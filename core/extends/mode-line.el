
;;; mode-line.el --- custom mode line format
;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'color)

(defvar powerline-image-apple-rgb)

(defun pl/interpolate (color1 color2)
  "Interpolate between COLOR1 and COLOR2.

COLOR1 and COLOR2 must be supplied as hex strings with a leading #."
  (let* ((c1 (color-name-to-rgb color1))
         (c2 (color-name-to-rgb color2))
         (red (/ (+ (nth 0 c1) (nth 0 c2)) 2))
         (green (/ (+ (nth 1 c1) (nth 1 c2)) 2))
         (blue (/ (+ (nth 2 c1) (nth 2 c2)) 2)))
    (color-rgb-to-hex red green blue)))

(defun pl/color-xyz-to-apple-rgb (X Y Z)
  "Convert CIE X Y Z colors to Apple RGB color space."
  (let ((r (+ (* 3.2404542 X) (* -1.5371385 Y) (* -0.4985314 Z)))
        (g (+ (* -0.9692660 X) (* 1.8760108 Y) (* 0.0415560 Z)))
        (b (+ (* 0.0556434 X) (* -0.2040259 Y) (* 1.0572252 Z))))
    (list (expt r (/ 1.8)) (expt g (/ 1.8)) (expt b (/ 1.8)))))

(defun pl/color-srgb-to-apple-rgb (red green blue)
  "Convert RED GREEN BLUE colors from sRGB color space to Apple RGB.
RED, GREEN and BLUE should be between 0.0 and 1.0, inclusive."
  (apply 'pl/color-xyz-to-apple-rgb (color-srgb-to-xyz red green blue)))

(defun pl/hex-color (color)
  "Get the hexadecimal value of COLOR."
  (when color
    (let ((srgb-color (color-name-to-rgb color)))
      (if powerline-image-apple-rgb
          (apply 'color-rgb-to-hex (apply 'pl/color-srgb-to-apple-rgb srgb-color))
        (apply 'color-rgb-to-hex srgb-color)))))

(defun pl/pattern (lst)
  "Turn LST into an infinite pattern."
  (when lst
    (let ((pattern (cl-copy-list lst)))
      (setcdr (last pattern) pattern))))

(defun pl/pattern-to-string (pattern)
  "Convert a PATTERN into a string that can be used in an XPM."
  (concat "\"" (mapconcat 'number-to-string pattern "") "\","))

(defun pl/reverse-pattern (pattern)
  "Reverse each line in PATTERN."
  (mapcar 'reverse pattern))

(defun pl/row-pattern (fill total &optional fade)
  "Make a list that has FILL 0s out of TOTAL 1s with FADE 2s to the right of the fill."
  (unless fade
    (setq fade 0))
  (let ((fill (min fill total))
        (fade (min fade (max (- total fill) 0))))
    (append (make-list fill 0)
            (make-list fade 2)
            (make-list (- total fill fade) 1))))

(defun pl/pattern-bindings-body (patterns height-exp pattern-height-sym
					  second-pattern-height-sym)
  "Create let-var bindings and a function body from PATTERNS.
The `car' and `cdr' parts of the result can be passed to the
function `pl/wrap-defun' as its `let-vars' and `body' arguments,
respectively.  HEIGHT-EXP is an expression calculating the image
height and it should contain a free variable `height'.
PATTERN-HEIGHT-SYM and SECOND-PATTERN-HEIGHT-SYM are symbols used
for let-var binding variables."
  (let* ((pattern (pl/pattern (mapcar 'pl/pattern-to-string (car patterns))))
         (header (mapcar 'pl/pattern-to-string (nth 1 patterns)))
         (footer (mapcar 'pl/pattern-to-string (nth 2 patterns)))
         (second-pattern (pl/pattern (mapcar 'pl/pattern-to-string (nth 3 patterns))))
         (center (mapcar 'pl/pattern-to-string (nth 4 patterns)))
         (reserve (+ (length header) (length footer) (length center))))
    (when pattern
      (cons `((,pattern-height-sym (max (- ,height-exp ,reserve) 0))
	      (,second-pattern-height-sym (/ ,pattern-height-sym 2))
	      (,pattern-height-sym ,(if second-pattern `(ceiling ,pattern-height-sym 2) `,pattern-height-sym)))
	    (list (when header `(mapconcat 'identity ',header ""))
		  `(mapconcat 'identity
			      (cl-subseq ',pattern 0 ,pattern-height-sym) "")
		  (when center `(mapconcat 'identity ',center ""))
		  (when second-pattern
		    `(mapconcat 'identity
				(cl-subseq ',second-pattern
					   0 ,second-pattern-height-sym) ""))
		  (when footer `(mapconcat 'identity ',footer "")))))))

(defun pl/pattern-defun (name dir width &rest patterns)
  "Create a powerline function of NAME in DIR with WIDTH for PATTERNS."
  (when (eq dir 'right)
    (setq patterns (mapcar 'pl/reverse-pattern patterns)))
  (let ((bindings-body (pl/pattern-bindings-body patterns
						 'height
						 'pattern-height
						 'second-pattern-height))
	(bindings-body-2x (pl/pattern-bindings-body (nthcdr 5 patterns)
						    '(* height 2)
						    'pattern-height-2x
						    'second-pattern-height-2x)))
    (pl/wrap-defun name dir width
		   (append (car bindings-body) (car bindings-body-2x))
		   (cdr bindings-body) (cdr bindings-body-2x))))

(defun pl/background-color (face)
  (face-attribute face
                  (if (face-attribute face :inverse-video nil 'default)
                      :foreground
                    :background)
                  nil
                  'default))

(defun pl/wrap-defun (name dir width let-vars body &optional body-2x)
  "Generate a powerline function of NAME in DIR with WIDTH using LET-VARS and BODY."
  (let* ((src-face (if (eq dir 'left) 'face1 'face2))
         (dst-face (if (eq dir 'left) 'face2 'face1)))
    `(defun ,(intern (format "powerline-%s-%s" name (symbol-name dir)))
	 (face1 face2 &optional height)
       (when window-system
         (unless height (setq height (pl/separator-height)))
         (let* ,(append `((color1 (when ,src-face
                                    (pl/hex-color (pl/background-color ,src-face))))
                          (color2 (when ,dst-face
                                    (pl/hex-color (pl/background-color ,dst-face))))
                          (colori (when (and color1 color2) (pl/interpolate color1 color2)))
                          (color1 (or color1 "None"))
                          (color2 (or color2 "None"))
                          (colori (or colori "None")))
                        let-vars)
           (apply 'create-image
		  ,(append `(concat (format "/* XPM */ static char * %s_%s[] = { \"%s %s 3 1\", \"0 c %s\", \"1 c %s\", \"2 c %s\","
					    ,(replace-regexp-in-string "-" "_" name)
					    (symbol-name ',dir)
					    ,width
					    height
					    color1
					    color2
					    colori))
			   body
			   '("};"))
		  'xpm t
		  :ascent 'center
		  :face (when (and face1 face2)
			  ,dst-face)
		  ,(and body-2x
			`(and (featurep 'mac)
			      (list :data-2x
				    ,(append `(concat (format "/* XPM */ static char * %s_%s_2x[] = { \"%s %s 3 1\", \"0 c %s\", \"1 c %s\", \"2 c %s\","
							      ,(replace-regexp-in-string "-" "_" name)
							      (symbol-name ',dir)
							      (* ,width 2)
							      (* height 2)
							      color1
							      color2
							      colori))
					     body-2x
					     '("};")))))))))))

(defmacro pl/slant (dir)
  "Generate a slant XPM function for DIR."
  (let* ((row-modifier (if (eq dir 'left) 'identity 'reverse)))
    (pl/wrap-defun "slant" dir 'width
                   '((width (1- (ceiling height 2))))
                   `((cl-loop for i from 0 to (1- height)
                              concat (pl/pattern-to-string (,row-modifier (pl/row-pattern (/ i 2) width)))))
		   `((cl-loop for i from 0 to (1- (* height 2))
                              concat (pl/pattern-to-string (,row-modifier (pl/row-pattern (/ i 2) (* width 2)))))))))




(defgroup powerline nil
  "Powerline, a prettier mode line."
  :group 'mode-line)

(defface powerline-active0 '((t (:inherit mode-line)))
  "Powerline face 0."
  :group 'powerline)

(defface powerline-active1 '((t (:background "grey17" :foreground "white" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active2 '((t (:background "grey40" :foreground "white" :inherit mode-line)))
  "Powerline face 2."
  :group 'powerline)

(defface powerline-inactive0
  '((t (:inherit mode-line-inactive)))
  "Powerline face 0."
  :group 'powerline)

(defface powerline-inactive1
  '((t (:background "grey11" :inherit mode-line-inactive)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive2
  '((t (:background "grey20" :inherit mode-line-inactive)))
  "Powerline face 2."
  :group 'powerline)

(defface mode-line-buffer-id-inactive
  '((t (:inherit mode-line-buffer-id)))
  "Powerline mode-line face"
  :group 'powerline)

(defcustom default-separator 'slant
  "")

(defcustom default-separator-dir '(left . right)
  "The separator direction to use for the default theme.

CONS of the form (DIR . DIR) denoting the lean of the
separators for the left and right side of the powerline.

DIR must be one of: left, right"
  :group 'powerline
  :type '(cons (choice :tag "Left Hand Side" (const left) (const right))
               (choice :tag "Right Hand Side" (const left) (const right))))

(defcustom powerline-height nil
  "Override the mode-line height."
  :group 'powerline
  :type '(choice integer (const nil)))

(defcustom powerline-text-scale-factor nil
  "Scale of mode-line font size to default text size.

Smaller mode-line fonts will be a float value less that 1.
Larger mode-line fonts require a float value greater than 1.

This is needed to make sure that text is properly aligned."
  :group 'powerline
  :type '(choice float integer (const nil)))

(defcustom powerline-image-apple-rgb nil
  "When t, Use Apple RGB colors for image generation.

On MacOS, sRGB colors are used for all GUI elements, except for image generation
which uses Apple RGB color space.  When this option is set, theme colors are
converted to equivalent Apple RGB colors before image generation."
  :group 'powerline
  :type 'boolean)

(defcustom powerline-gui-use-vcs-glyph nil
  "Display a unicode character to represent a version control system. Not always supported in GUI."
  :group 'powerline
  :type 'boolean)

(defcustom powerline-narrowed-indicator "Narrow"
  "A string to display in the mode-line when the buffer is narrowed."
  :group 'powerline
  :type 'string)

(defun pl/create-or-get-cache ()
  "Return a frame-local hash table that acts as a memoization cache for powerline. Create one if the frame doesn't have one yet."
  (let ((table (frame-parameter nil 'powerline-cache)))
    (if (hash-table-p table) table (pl/reset-cache))))

(defun pl/reset-cache ()
  "Reset and return the frame-local hash table used for a memoization cache."
  (let ((table (make-hash-table :test 'equal)))
    ;; Store it as a frame-local variable
    (modify-frame-parameters nil `((powerline-cache . ,table)))
    table))

(defun powerline-current-separator ()
  "Get the current default separator. Always returns utf-8 in non-gui mode."
  (if window-system
      default-separator
    'utf-8))

(defun powerline-delete-cache (&optional frame)
  "Set the FRAME cache to nil."
  (set-frame-parameter frame 'powerline-cache nil))

(defun powerline-desktop-save-delete-cache ()
  "Set all caches to nil unless `frameset-filter-alist' has :never for powerline-cache."
  (unless (and (boundp 'frameset-filter-alist)
               (eq (cdr (assq 'powerline-cache frameset-filter-alist))
                   :never))
    (dolist (fr (frame-list)) (powerline-delete-cache fr))))

(add-hook 'desktop-save-hook 'powerline-desktop-save-delete-cache)

;; from memoize.el @ http://nullprogram.com/blog/2010/07/26/
(defun pl/memoize (func)
  "Memoize FUNC.
If argument is a symbol then install the memoized function over
the original function.  Use frame-local memoization."
  (cl-typecase func
    (symbol (fset func (pl/memoize-wrap-frame-local (symbol-function func))) func)
    (function (pl/memoize-wrap-frame-local func))))

(defun pl/memoize-wrap-frame-local (func)
  "Return the memoized version of FUNC.
The memoization cache is frame-local."
  (let ((funcid (cl-gensym)))
    `(lambda (&rest args)
       ,(concat (documentation func) (format "\n(memoized function %s)" funcid))
       (let* ((cache (pl/create-or-get-cache))
              (key (cons ',funcid args))
              (val (gethash key cache)))
         (if val
             val
           (puthash key (apply ,func args) cache))))))

(defun pl/separator-height ()
  "Get default height for rendering separators."
  (or powerline-height (frame-char-height)))

(defun powerline-reset ()
  "Reset memoized functions."
  (interactive)
  (pl/memoize (pl/slant left))
  (pl/memoize (pl/slant right))
  (pl/reset-cache))

(powerline-reset)

(defun pl/make-xpm (name color1 color2 data)
  "Return an XPM image with NAME using COLOR1 for enabled and COLOR2 for disabled bits specified in DATA."
  (when window-system
    (create-image
     (concat
      (format "/* XPM */
static char * %s[] = {
\"%i %i 2 1\",
\". c %s\",
\"  c %s\",
"
              (downcase (replace-regexp-in-string " " "_" name))
              (length (car data))
              (length data)
              (or (pl/hex-color color1) "None")
              (or (pl/hex-color color2) "None"))
      (let ((len  (length data))
            (idx  0))
        (apply 'concat
               (mapcar #'(lambda (dl)
                           (setq idx (+ idx 1))
                           (concat
                            "\""
                            (concat
                             (mapcar #'(lambda (d)
                                         (if (eq d 0)
                                             (string-to-char " ")
                                           (string-to-char ".")))
                                     dl))
                            (if (eq idx len)
                                "\"};"
                              "\",\n")))
                       data))))
     'xpm t :ascent 'center)))

(defun pl/percent-xpm
    (height pmax pmin winend winstart width color1 color2)
  "Generate percentage xpm of HEIGHT for PMAX to PMIN given WINEND and WINSTART with WIDTH and COLOR1 and COLOR2."
  (let* ((height- (1- height))
         (fillstart (round (* height- (/ (float winstart) (float pmax)))))
         (fillend (round (* height- (/ (float winend) (float pmax)))))
         (data nil)
         (i 0))
    (while (< i height)
      (setq data (cons
                  (if (and (<= fillstart i)
                           (<= i fillend))
                      (append (make-list width 1))
                    (append (make-list width 0)))
                  data))
      (setq i (+ i 1)))
    (pl/make-xpm "percent" color1 color2 (reverse data))))

(pl/memoize 'pl/percent-xpm)

;;;###autoload
(defun powerline-hud (face1 face2 &optional width)
  "Return an XPM of relative buffer location using FACE1 and FACE2 of optional WIDTH."
  (unless width (setq width 2))
  (let ((color1 (if face1 (face-background face1) "None"))
        (color2 (if face2 (face-background face2) "None"))
        (height (or powerline-height (frame-char-height)))
        pmax
        pmin
        (ws (window-start))
        (we (window-end)))
    (save-restriction
      (widen)
      (setq pmax (point-max))
      (setq pmin (point-min)))
    (pl/percent-xpm height pmax pmin we ws
                    (* (frame-char-width) width) color1 color2)))

;;;###autoload
(defun powerline-mouse (click-group click-type string)
  "Return mouse handler for CLICK-GROUP given CLICK-TYPE and STRING."
  (cond ((eq click-group 'minor)
         (cond ((eq click-type 'menu)
                `(lambda (event)
                   (interactive "@e")
                   (minor-mode-menu-from-indicator ,string)))
               ((eq click-type 'help)
                `(lambda (event)
                   (interactive "@e")
                   (describe-minor-mode-from-indicator ,string)))
               (t
                `(lambda (event)
                   (interactive "@e")
                   nil))))
        (t
         `(lambda (event)
            (interactive "@e")
            nil))))

;;;###autoload
(defun powerline-concat (&rest strings)
  "Concatonate STRINGS and pad sides by spaces."
  (concat
   " "
   (mapconcat 'identity (delq nil strings) " ")
   " "))

;;;###autoload
(defmacro defpowerline (name body)
  "Create function NAME by wrapping BODY with powerline padding an propetization."
  `(defun ,name
       (&optional face pad)
     (powerline-raw ,body face pad)))

(defun pl/property-substrings (str prop)
  "Return a list of substrings of STR when PROP change."
  (let ((beg 0) (end 0)
        (len (length str))
        (out))
    (while (< end (length str))
      (setq end (or (next-single-property-change beg prop str) len))
      (setq out (append out (list (substring str beg (setq beg end))))))
    out))

(defun pl/assure-list (item)
  "Assure that ITEM is a list."
  (if (listp item)
      item
    (list item)))

(defun pl/add-text-property (str prop val)
  (mapconcat
   (lambda (mm)
     (let ((cur (pl/assure-list (get-text-property 0 'face mm))))
       (propertize mm 'face (append cur (list val)))))
   (pl/property-substrings str prop)
   ""))

;;;###autoload
(defun powerline-raw (str &optional face pad)
  "Render STR as mode-line data using FACE and optionally PAD import on left (l) or right (r)."
  (when str
    (let* ((rendered-str (format-mode-line str))
           (padded-str (concat
                        (when (and (> (length rendered-str) 0) (eq pad 'l)) " ")
                        (if (listp str) rendered-str str)
                        (when (and (> (length rendered-str) 0) (eq pad 'r)) " "))))

      (if face
          (pl/add-text-property padded-str 'face face)
        padded-str))))

;;;###autoload
(defun powerline-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when powerline-text-scale-factor
    (setq reserve (* powerline-text-scale-factor reserve)))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun powerline-fill-center (face reserve)
  "Return empty space using FACE to the center of remaining space leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when powerline-text-scale-factor
    (setq reserve (* powerline-text-scale-factor reserve)))
  (propertize " "
              'display `((space :align-to (- (+ center (.5 . right-margin)) ,reserve
                                             (.5 . left-margin))))
              'face face))

;;;###autoload (autoload 'powerline-major-mode "powerline")
(defpowerline powerline-major-mode
  (propertize (format-mode-line mode-name)
              'mouse-face 'mode-line-highlight
              'help-echo "Major mode\n\ mouse-1: Display major mode menu\n\ mouse-2: Show help for major mode\n\ mouse-3: Toggle minor modes"
              'local-map (let ((map (make-sparse-keymap)))
                           (define-key map [mode-line down-mouse-1]
                             `(menu-item ,(purecopy "Menu Bar") ignore
                                         :filter (lambda (_) (mouse-menu-major-mode-map))))
                           (define-key map [mode-line mouse-2] 'describe-mode)
                           (define-key map [mode-line down-mouse-3] mode-line-mode-menu)
                           map)))

;;;###autoload (autoload 'powerline-minor-modes "powerline")
(defpowerline powerline-minor-modes
  (mapconcat (lambda (mm)
               (propertize mm
                           'mouse-face 'mode-line-highlight
                           'help-echo "Minor mode\n mouse-1: Display minor mode menu\n mouse-2: Show help for minor mode\n mouse-3: Toggle minor modes"
                           'local-map (let ((map (make-sparse-keymap)))
                                        (define-key map
                                          [mode-line down-mouse-1]
                                          (powerline-mouse 'minor 'menu mm))
                                        (define-key map
                                          [mode-line mouse-2]
                                          (powerline-mouse 'minor 'help mm))
                                        (define-key map
                                          [mode-line down-mouse-3]
                                          (powerline-mouse 'minor 'menu mm))
                                        (define-key map
                                          [header-line down-mouse-3]
                                          (powerline-mouse 'minor 'menu mm))
                                        map)))
             (split-string (format-mode-line minor-mode-alist))
             (propertize " " 'face face)))

;;;###autoload (autoload 'powerline-narrow "powerline")
(defpowerline powerline-narrow
  (when ;; (buffer-narrowed-p) introduced in Emacs 24.3.
      (/= (- (point-max) (point-min)) (buffer-size))
    (propertize powerline-narrowed-indicator
                'mouse-face 'mode-line-highlight
                'help-echo "mouse-1: Remove narrowing from the current buffer"
                'local-map (make-mode-line-mouse-map
                            'mouse-1 'mode-line-widen))))

;;;###autoload (autoload 'powerline-encoding "powerline")
(defpowerline powerline-encoding
  (let ((buf-coding (format "%s" buffer-file-coding-system)))
    (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
        (match-string 1 buf-coding)
      buf-coding)))



;;;###autoload (autoload 'powerline-process "powerline")
(defpowerline powerline-process
  (cond
   ((symbolp mode-line-process) (symbol-value mode-line-process))
   ((listp mode-line-process) (format-mode-line mode-line-process))
   (t mode-line-process)))

(defvar pl/default-mode-line mode-line-format)

(defvar pl/minibuffer-selected-window-list '())

(defun pl/minibuffer-selected-window ()
  "Return the selected window when entereing the minibuffer."
  (when pl/minibuffer-selected-window-list
    (car pl/minibuffer-selected-window-list)))

(defun pl/minibuffer-setup ()
  "Save the `minibuffer-selected-window' to `pl/minibuffer-selected-window'."
  (push (minibuffer-selected-window) pl/minibuffer-selected-window-list))

(add-hook 'minibuffer-setup-hook 'pl/minibuffer-setup)

(defun pl/minibuffer-exit ()
  "Set `pl/minibuffer-selected-window' to nil."
  (pop pl/minibuffer-selected-window-list))

(add-hook 'minibuffer-exit-hook 'pl/minibuffer-exit)

(defvar powerline-selected-window (frame-selected-window))
(defun powerline-set-selected-window ()
  "sets the variable `powerline-selected-window` appropriately"
  (when (not (minibuffer-window-active-p (frame-selected-window)))
    (setq powerline-selected-window (frame-selected-window))
    (force-mode-line-update)))

(defun powerline-unset-selected-window ()
  "Unsets the variable `powerline-selected-window` and updates the modeline"
  (setq powerline-selected-window nil)
  (force-mode-line-update))

(add-hook 'window-configuration-change-hook 'powerline-set-selected-window)

;; focus-in-hook was introduced in emacs v24.4.
;; Gets evaluated in the last frame's environment.
(add-hook 'focus-in-hook 'powerline-set-selected-window)

;; focus-out-hook was introduced in emacs v24.4.
(add-hook 'focus-out-hook 'powerline-unset-selected-window)

;; Executes after the window manager requests that the user's events
;; be directed to a different frame.
(defadvice handle-switch-frame
    (after powerline-set-selected-window-after-switch-frame activate)
  (powerline-set-selected-window))

(defadvice select-window (after powerline-select-window activate)
  "makes powerline aware of window changes"
  (powerline-set-selected-window))

;;;###autoload (autoload 'powerline-selected-window-active "powerline")
(defun powerline-selected-window-active ()
  "Return whether the current window is active."
  (eq powerline-selected-window (selected-window)))

(defun powerline-revert ()
  "Revert to the default Emacs mode-line."
  (interactive)
  (setq-default mode-line-format pl/default-mode-line))

(defun pl/render (item)
  "Render a powerline ITEM."
  (cond
   ((and (listp item) (eq 'image (car item)))
    (propertize " " 'display item
                'face (plist-get (cdr item) :face)))
   (item item)))

(defun powerline-render (values)
  "Render a list of powerline VALUES."
  (mapconcat 'pl/render values ""))

(defun powerline-width (values)
  "Get the length of VALUES."
  (if values
      (let ((val (car values)))
        (+ (cond
            ((stringp val) (string-width (format-mode-line val)))
            ((and (listp val) (eq 'image (car val)))
             (car (image-size val)))
            (t 0))
           (powerline-width (cdr values))))
    0))

(defun powerline--unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (powerline-raw
   (format-mode-line
    (concat
     (cond
      ((string= "1" str) "➊ ")
      ((string= "2" str) "➋ ")
      ((string= "3" str) "➌ ")
      ((string= "4" str) "➍ ")
      ((string= "5" str) "➎ ")
      ((string= "6" str) "➏ ")
      ((string= "7" str) "➐ ")
      ((string= "8" str) "➑ ")
      ((string= "9" str) "➒ ")
      ((string= "0" str) "➓ "))))))

(defpowerline powerline-window-number
  (when (bound-and-true-p winum-mode)
    (let* ((num (winum-get-number))
	   (str (when num (int-to-string num))))
      (powerline--unicode-number str))))

;;;###autoload (autoload 'powerline-buffer-id "powerline")
(defpowerline powerline-buffer-id
  (powerline-raw
   (format-mode-line
    (concat 
     (cond
      ((string= major-mode "emacs-lisp-mode") "")
      ((string= major-mode "lisp-interaction-mode") "")
      ((string= major-mode "json-mode") "")
      ((string= major-mode "python-mode") "")
      ((string= major-mode "css-mode") "")
      ((string= major-mode "scss-mode") "\xe603")
      ((string= major-mode "js2-mode") "")
      ((string= major-mode "markdown-mode") "")
      ((string= major-mode "org-mode") "")
      ((string= major-mode "web-mode") "")
      ((string= major-mode "debugger-mode") "\xf46f")
      (t (format "%s" major-mode)))
     (propertize " %b " 'face face)))))

(defpowerline powerline-vc
  (when vc-mode
    (powerline-raw
     (format-mode-line
      (cond
       ((string-match "Git[:-]" vc-mode)
	(let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
	  (concat
	   (propertize " \xf418")
	   (propertize (format " %s " branch)))))
       (t (format "%s" vc-mode)))))))

(defpowerline powerline-flycheck
  (powerline-raw
   (format-mode-line
    '(:eval
      (pcase flycheck-last-status-change
	(`finished (if flycheck-current-errors
				(let ((count (let-alist (flycheck-count-errors flycheck-current-errors)
					       (+ (or .warning 0) (or .error 0)))))
				  (propertize (format " ✖ %s Issue%s " count (if (eq 1 count) "" "s"))))

			      (propertize " ✔ No Issues ")))

		 (`running (propertize " ⟲ Running "))

		 (`no-checker (propertize " ⚠ No Checke "))

		 (`not-checked " ✖ Disabled ")
		 (`errored (propertize " ⚠ Error "))
		 (`interrupted "⛔ Interrupted"))))))
			 
			 
			 	
    (defpowerline powerline-time
      (powerline-raw
       (format-mode-line
	(concat
	 (propertize " \xf49b")
	 (propertize (format-time-string " %H:%M "))))))


    (setq-default mode-line-format
		  '("%e"
		    (:eval
		     (let* ((active (powerline-selected-window-active))
                            (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
			    (mode-line (if active 'mode-line 'mode-line-inactive))
                            (face0 (if active 'powerline-active0 'powerline-inactive0))
			    (face1 (if active 'powerline-active1 'powerline-inactive1))
			    (face2 (if active 'powerline-active2 'powerline-inactive2))
			    (separator-left (intern (format "powerline-%s-%s"
							    (powerline-current-separator)
							    (car default-separator-dir))))
			    (separator-right (intern (format "powerline-%s-%s"
							     (powerline-current-separator)
							     (cdr default-separator-dir))))
			    (lhs (list (powerline-window-number face1 'l)
				       (funcall separator-left face1 face0)
				       (powerline-buffer-id `(mode-line-buffer-id ,face0) 'l)
				       (funcall separator-left face0 face1)
				       (powerline-vc face1)
				       (funcall separator-left face1 face0)
				       (powerline-flycheck face0)
				       (funcall separator-left face0 face1)))
			    (rhs (list (powerline-encoding face1 'r)
				       (funcall separator-right face1 face0)
				       (powerline-time face0 'r)
				       (funcall separator-right face0 face1)
				       (powerline-raw " Ln %l " face1 'r)
				       (funcall separator-right face1 face0)
				       (powerline-raw "%6p" face0 'r)
				       (powerline-fill face0 0)))
			    (center (list 
				     (funcall separator-left face1 face2)
				     (powerline-vc face2 'l)
				     (funcall separator-right face2 face1))))
		       (concat (powerline-render lhs)
			       ;;(powerline-fill-center face1 (/ (powerline-width center) 2.0))
			       ;;(powerline-render center)
			       (powerline-fill face1 (powerline-width rhs))
			       (powerline-render rhs))))))

    (provide 'mode-line)

;;; mode-line.el ends here
