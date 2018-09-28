
;;; Code:
(require 'memoize)
(require 'cl-lib)

(defvar file-type/icons-alist
  '(("default" . "\xe612" )
    ("folder" . "\xf07b")
    ("folder_open" . "\xf07c")
    ("folder_npm" . "\xe5fa")
    ("favicon" . "\xe623")
    ;; system os
    ("windows" . "\xe70f")
    ("apple" . "\xe711")
    ("linux" . "\xe712")
    ;; framework
    ("angular" . "\xe753")
    ("react" . "\xe7ba")
    ("vue" . "\xfd42")
    ;; front-end
    ("html" . "\xf13b")
    ("css" . "\xe74a")
    ("scss" . "\xe603")
    ("js" . "\xe74e")
    ("ts" . "\xe628")
    ;; git
    ("folder_git" . "\xe5fb")
    ("git" . "\xe702")
    ("git_branch" . "\xe725")
    ("git_commit" . "\xe729")
    ("git_compare" . "\xe728")
    ("git_merge" . "\xe727")
    ("git_pull_request" . "\xe726")
    ;; battery
    ("battery" . "\xf240")
    ("battery_0" . "\xf244")
    ("battery_1" . "\xf243")
    ("battery_2" . "\xf242")
    ("battery_3" . "\xf241")
    ;; config
    ("webpack" . "\xea61")
    ("json" . "\xe60b")
    ("license" . "\xe60a")
    ("gnu" . "\xe679")
    ("markdown" . "\xe73e")
    ("npm" . "\xe71e")
    ("yarn" . "\xea1a")
    ("org" . "\xe917")
    ("lisp" . "\xe926")
    ("eslint" . "\xe90e")
    ("stylelint" . "\xe93d")
    ;; mode
    ("python" . "\xe73c")
    ("ruby" . "\xe791")
    ("terminal" . "\xe795")
    ("terminal_badge" . "\xe7a2")
    ("vim" . "\xe7c5")
    ;; others
    ("bug" . "\xf188")
    ("calculator" . "\xf1ec")
    ("calendar" . "\xf073")
    ("microchip" . "\xf2db")
    ("cpp" . "\xfb71")
    ("cpu" . "\xf986")
    ("key" . "\xf805")
    ;; social
    ("instagram" . "\xf16d")
    ("dribbble" . "\xf17d")
    ("twitter" . "\xf099")
    ("github" . "\xf09b")))

;;; Custom Variables
(defgroup all-the-icons nil
  "Manage how All The Icons formats icons."
  :prefix "all-the-icons-"
  :group 'appearance
  :group 'convenience)

(defcustom all-the-icons-color-icons t
  "Whether or not to include a foreground colour when formatting the icon."
  :group 'all-the-icons
  :type 'boolean)

(defcustom all-the-icons-scale-factor 1
  "The base Scale Factor for the `height' face property of an icon."
  :group 'all-the-icons
  :type 'number)

(defcustom all-the-icons-default-adjust -0.2
  "The default adjustment to be made to the `raise' display property of an icon."
  :group 'all-the-icons
  :type 'number)

(defvar all-the-icons-font-families '() "List of defined icon font families.")
(defvar all-the-icons-font-names '() "List of defined font file names this package was built with.")

(defvar all-the-icons-icon-alist
  '(
    ("\\.org"           all-the-icons-fonts "org")
    ("\\.md"            all-the-icons-fonts "markdown")
    ("\\.mk$"           all-the-icons-fonts "gnu")
    ("\\.sh"            all-the-icons-fonts "terminal")
    ("\\.py$"           all-the-icons-fonts "python")
    ("\\.gem$"          all-the-icons-fonts "ruby") 
    ("\\.rb$"           all-the-icons-fonts "ruby")

    ("^Makefile$"       all-the-icons-fonts "gnu")
    ("^Gemfile$"        all-the-icons-fonts "ruby")
    ("^Brewfile$"       all-the-icons-fonts "ruby")
    ("^LICENSE$"        all-the-icons-fonts "license")

    ("\\.npmignore"     all-the-icons-fonts "npm")
    (".npmrc"           all-the-icons-fonts "npm")
    ("^package.json$"     all-the-icons-fonts "npm")
    ("^package.lock.json$" all-the-icons-fonts "npm")
    ("\\.yarnrc"          all-the-icons-fonts "yarn")
    ("^yarn.lock$"      all-the-icons-fonts "yarn")
    ("^webpack"         all-the-icons-fonts "webpack")
    ("\\.gitconfig"     all-the-icons-fonts "git")
    ("\\.gitignore"     all-the-icons-fonts "git")
    (".bashrc"          all-the-icons-fonts "terminal")
    (".bash_profile"    all-the-icons-fonts "terminal")
    (".bash_history"    all-the-icons-fonts "terminal")
    ("\\.zsh"           all-the-icons-fonts "terminal")
    (".zsh_history"     all-the-icons-fonts "terminal")
    
    ("\\.html?$"        all-the-icons-fonts "html")
    ("\\.css$"          all-the-icons-fonts "css")
    ("\\.scss$"         all-the-icons-fonts "scss")
    ("-?spec\\.ts$"     all-the-icons-fonts "ts")
    ("-?test\\.ts$"     all-the-icons-fonts "ts")
    ("-?spec\\.js$"     all-the-icons-fonts "js")
    ("-?test\\.js$"     all-the-icons-fonts "js")
    ("\\.d\\.ts$"       all-the-icons-fonts "ts")
    ("\\.ts$"           all-the-icons-fonts "ts")
    ("\\.js$"           all-the-icons-fonts "js")
    ("\\.vue$"          all-the-icons-fonts "vue")
    ("\\.json$"         all-the-icons-fonts "json")

    ("^\\."             all-the-icons-fonts "default")
    ("."                all-the-icons-fonts "default")))

(defvar all-the-icons-dir-icon-alist
  '(
    ("\\.git"           all-the-icons-fonts "folder_git")
    ("\\node_modules"   all-the-icons-fonts "folder_npm")
    ("\\."              all-the-icons-fonts "folder")
    ("."                all-the-icons-fonts "folder")
    ))

;; ====================
;;   Functions Start
;; ====================

(defun all-the-icons-auto-mode-match? (&optional file)
  "Whether or not FILE's `major-mode' match against its `auto-mode-alist'."
  (let* ((file (or file (buffer-file-name) (buffer-name)))
         (auto-mode (all-the-icons-match-to-alist file auto-mode-alist)))
    (eq major-mode auto-mode)))

(defun all-the-icons-match-to-alist (file alist)
  "Match FILE against an entry in ALIST using `string-match'."
  (cdr (cl-find-if (lambda (it) (string-match (car it) file)) alist)))

;; Icon functions
(defun all-the-icons-icon-for-dir (dir &optional chevron padding)
  "Format an icon for DIR with CHEVRON similar to tree based directories."
  (let* ((matcher (all-the-icons-match-to-alist (file-name-base dir) all-the-icons-dir-icon-alist))
         (path (expand-file-name dir))
         (padding (or padding "\t"))
         (icon (cond
                ((file-exists-p (format "%s/.git" path))
                 (format "%s" (all-the-icons-fonts "folder_git" :height 1.1)))
                (t (apply (car matcher) (cdr matcher))))))
    (format "%s%s%s" padding icon padding)))

;;;###autoload
(defun all-the-icons-icon-for-file (file &rest arg-overrides)
  "Get the formatted icon for FILE.
ARG-OVERRIDES should be a plist containining `:height',
`:v-adjust' or `:face' properties like in the normal icon
inserting functions."
  (let* ((icon (all-the-icons-match-to-alist file all-the-icons-icon-alist))
         (args (cdr icon)))
    (when arg-overrides (setq args (append `(,(car args)) arg-overrides (cdr args))))
    (apply (car icon) args)))

(memoize 'all-the-icons-icon-for-file)

;; Family Face Functions
(defun all-the-icons-icon-family-for-file (file)
  "Get the icons font family for FILE."
  (let ((icon (all-the-icons-match-to-alist file all-the-icons-icon-alist)))
    (funcall (intern (format "%s-family" (car icon))))))

(defun all-the-icons-icon-family (icon)
  "Get a propertized ICON family programatically."
  (plist-get (get-text-property 0 'face icon) :family))

(memoize 'all-the-icons-icon-family-for-file)
(memoize 'all-the-icons-icon-family)

;;;###autoload
(defun all-the-icons--icon-info-for-buffer (&optional f)
  "Get icon info for the current buffer.

When F is provided, the info function is calculated with the format
`all-the-icons-icon-%s-for-file' or `all-the-icons-icon-%s-for-mode'."
  (let* ((base-f (concat "all-the-icons-icon" (when f (format "-%s" f))))
         (file-f (intern (concat base-f "-for-file")))
         (mode-f (intern (concat base-f "-for-mode"))))
    (if (and (buffer-file-name)
             (all-the-icons-auto-mode-match?))
        (funcall file-f (file-name-nondirectory (buffer-file-name)))
      (funcall mode-f major-mode))))

;; Definitions

(eval-and-compile
  (defun all-the-icons--function-name (name)
    "Get the symbol for an icon function name for icon set NAME."
    (intern (concat "all-the-icons-" (downcase (symbol-name name)))))

  (defun all-the-icons--family-name (name)
    "Get the symbol for an icon family function for icon set NAME."
    (intern (concat "all-the-icons-" (downcase (symbol-name name)) "-family")))

  (defun all-the-icons--data-name (name)
    "Get the symbol for an icon family function for icon set NAME."
    (intern (concat "all-the-icons-" (downcase (symbol-name name)) "-data")))

  (defun all-the-icons--insert-function-name (name)
    "Get the symbol for an icon insert function for icon set NAME."
    (intern (concat "all-the-icons-insert-" (downcase (symbol-name name))))))

;; Icon insertion functions

(defun all-the-icons--read-candidates ()
  "Helper to build a list of candidates for all families."
  (cl-reduce 'append (mapcar (lambda (it) (all-the-icons--read-candidates-for-family it t)) all-the-icons-font-families)))

(defun all-the-icons--read-candidates-for-family (family &optional show-family)
  "Helper to build read candidates for FAMILY.
If SHOW-FAMILY is non-nil, displays the icons family in the candidate string."
  (let ((data   (funcall (all-the-icons--data-name family)))
        (icon-f (all-the-icons--function-name family)))
    (mapcar
     (lambda (it)
       (let* ((icon-name (car it))
              (icon-name-head (substring icon-name 0 1))
              (icon-name-tail (substring icon-name 1))

              (icon-display (propertize icon-name-head 'display (format "%s\t%s" (funcall icon-f icon-name) icon-name-head)))
              (icon-family (if show-family (format "\t[%s]" family) ""))

              (candidate-name (format "%s%s%s" icon-display icon-name-tail icon-family))
              (candidate-icon (funcall (all-the-icons--function-name family) icon-name)))

         (cons candidate-name candidate-icon)))
     data)))

;;;###autoload
(defun all-the-icons-insert (&optional arg family)
  "Interactive icon insertion function.
When Prefix ARG is non-nil, insert the propertized icon.
When FAMILY is non-nil, limit the candidates to the icon set matching it."
  (interactive "P")
  (let* ((standard-output (current-buffer))
         (candidates (if family
                         (all-the-icons--read-candidates-for-family family)
                       (all-the-icons--read-candidates)))
         (prompt     (if family
                         (format "%s Icon: " (funcall (all-the-icons--family-name family)))
                       "Icon : "))

         (selection (completing-read prompt candidates nil t))
         (result    (cdr (assoc selection candidates))))

    (if arg (prin1 result) (insert result))))

(defmacro define-icon (name alist family &optional font-name)
  "Macro to generate functions for inserting icons for icon set NAME."
  `(progn
     (add-to-list 'all-the-icons-font-families (quote ,name))
     (add-to-list 'all-the-icons-font-names (quote ,(downcase (format "%s.ttf" (or font-name family)))))

     (defun ,(all-the-icons--family-name name) () ,family)
     (defun ,(all-the-icons--data-name name) () ,alist)
     (defun ,(all-the-icons--function-name name) (icon-name &rest args)
       (let ((icon (cdr (assoc icon-name ,alist)))
             (other-face (when all-the-icons-color-icons (plist-get args :face)))
             (height (or (plist-get args :height) 1.0))
             (v-adjust (or (plist-get args :v-adjust) all-the-icons-default-adjust))
             (family ,family))
         (unless icon
           (error (format "Unable to find icon with name `%s' in icon set `%s'" icon-name (quote ,name))))
         (propertize icon
                     'face (if other-face
                               `(:family ,family :height ,height :inherit ,other-face)
                             `(:family ,family :height ,height))
                     'display `(raise ,v-adjust)
                     'rear-nonsticky t
                     'font-lock-ignore t)))
     (defun ,(all-the-icons--insert-function-name name) (&optional arg)
       ,(format "Insert a %s icon at point." family)
       (interactive "P")
       (all-the-icons-insert arg (quote ,name)))))

(define-icon fonts file-type/icons-alist "system fonts")

(provide 'all-the-icons)

;;; all-the-icons.el ends here
