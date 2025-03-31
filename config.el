;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Dustin Schauten"
      user-mail-address "schautendustin@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setq doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 12.0 :weight 'semi-light)
;;(setq doom-font (font-spec :family "ProFont Nerd Font" :size 12.0 :weight 'semi-light)
(setq doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 12.0 :weight 'semi-bold)
      ;; (setq doom-font (font-spec :family "Tamzen" :size 15.0 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Source Sans Pro" :size 11.0 :weight 'semi-light)
      doom-big-font (font-spec :family "CaskaydiaCove Nerd Font" :size 11.0 :weight 'semi-light)
      )
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-gruvbox-dark-variant "hard")

;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'doom-solarized-light)
(setq doom-theme 'doom-kanagawa)

(after! corfu
        (setq corfu-preselect 'first)
        (setq corfu-auto-delay 0.05)
        )
(setenv "LSP_USE_PLISTS" "true")
(require 'yuck-mode)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(setq doom-modeline-height 25)

(set-frame-parameter nil 'alpha-background 100)
(add-to-list 'default-frame-alist '(alpha-background . 100))

(setq nerd-icons-font-family "Symbols Nerd Fonts Mono")

(setq column-number-mode nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Orga/")



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(require 'org-alert)

(defadvice! shut-up-org-problematic-hooks (fn &rest args)
  :around #'org-fancy-priorities-mode
  :around #'org-superstar-mode
  (ignore-errors (apply fn args)))

(setq
 org-superstar-headline-bullets-list '("⁖" "◉" "✸" "○" "✿" )
 )

(setq org-ellipsis " ▼ ")

(setq org-fancy-priorities-list '("卑" "" ""))

(defun my/org-mode/load-prettify-symbols ()
  (interactive)
  (setq prettify-symbols-alist
        (mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
                '(("[ ]" .  "")
                  ("[X]" . "" )
                  ("[-]" . "" )
                  ("lambda" . "ﬦ")
                  ("#+begin_src" . "")
                  ("#+end_src" . "")
                  ("#+begin_example" . "")
                  ("#+end_example" . "")
                  ("#+begin_quote" . "")
                  ("#+end_quote" . "")
                                        ;("TODO" . "")
                                        ;("DONE" . "")
                                        ;("HOLD" . "")
                                        ;("STRT" . "")
                  )
                )
        )
  )

(setq org-hide-emphasis-markers t)

(add-hook! 'org-mode-hook
           #'+org-pretty-mode )

(define-globalized-minor-mode global-prettify-symbols-mode prettify-symbols-mode
  (lambda () (prettify-symbols-mode 1)))
(global-prettify-symbols-mode 1)

(add-hook! 'org-mode-hook
           #'my/org-mode/load-prettify-symbols )

(setq org-image-actual-width nil)

;;(define-globalized-minor-mode global-rainbow-mode rainbow-mode
;;  (lambda () (rainbow-mode 1)))
;;(global-rainbow-mode 1 )

                                        ;(add-hook 'window-setup-hook #'treemacs 'append)
                                        ;(setq doom-themes-treemacs-theme "kaolin-treemacs-theme")
(setq neo-theme 'icons)

                                        ;(use-package kaolin-themes
                                        ;  :config
                                        ;  (load-theme 'kaolin-dark t)
                                        ;  (kaolin-treemacs-theme))


(map! :leader
      :desc "Switch to left window"
      "h" #'evil-window-left)

(map! :leader
      :desc "Switch to right window"
      "l" #'evil-window-right)

(map! :leader
      :desc "Switch to up window"
      "k" #'evil-window-up)

(map! :leader
      :desc "Switch to down window"
      "j" #'evil-window-down)

(map! :leader
      :desc "Switch to up buffer"
      "w <up>" #'+evil/window-move-up)

(map! :leader
      :desc "Switch to up buffer"
      "w <down>" #'+evil/window-move-down)

(map! :leader
      :desc "Switch to up buffer"
      "w <left>" #'+evil/window-move-left)

(map! :leader
      :desc "Switch to up buffer"
      "w <right>" #'+evil/window-move-right)

(map! :leader
      :desc "Hydra Window Resize"
      "r" #'+hydra/window-nav/body)

(map! :leader
      :desc "Dashboard"
      "H" #'+doom-dashboard/open)

(map! :leader
      :desc "Capture"
      "C" #'counsel-org-capture)

(map! :leader
      :desc "Rainbow mode"
      "t R" #'rainbow-mode)

(map! :leader
      :desc "LSP Doc-View"
      "d" #'lsp-ui-doc-show)

;; (map! :leader
;;       :desc "comment"
;;       "k" #'Comment-dwim)

(map! :leader
      :desc "daily entry"
      "n r D" #'org-roam-dailies-capture-today)

(map! :leader
      :desc "prev node"
      "B" #'org-mark-ring-goto)

(map! :leader
      :desc "darkroom"
      "t d" #'darkroom-tentative-mode)

(map! :leader
      :desc "Breakpoint"
      "D b" #'dap-breakpoint-toggle)

(map! :leader
      :desc "Start"
      "D s" #'dap-debug)

(map! :leader
      :desc "Start"
      "D n" #'dap-next)

(map! :leader
      :desc "Eval thing"
      "D D" #'dap-hydra)

(map! :leader
      (:prefix-map ("N" . "Scientific notes")
       ;;(:prefix ("j" . "journal")
       :desc "insert note" "c" #'orb-insert-link
       :desc "Highlight PDF" "h" #'pdf-annot-add-highlight-markup-annotation
       :desc "Ivy Bibtex" "i" #'ivy-bibtex
       :desc "ORB Mode" "o" #'org-roam-bibtex-mode
       :desc "Show PDF for current note" "p" #'orb-note-actions
       :desc "Show note in PDF" "n" #'org-noter-sync-current-note
       :desc "Kill noter session" "x" #'org-noter-kill-session
       :desc "Invert PDF color" "r" #'pdf-view-themed-minor-mode
       :desc "Insert Bibtex from DOI" "r" #'doi-insert-bibtex
       ))
(map! :leader
      :desc "Compile"
      "c c" #'compile)

(map! :leader
      :desc "Kill compilation"
      "c K" #'kill-compilation)

(defun my/run-with-python()
  (setq-local compile-command
              (concat "python "
                      (when buffer-file-name
                        (shell-quote-argument buffer-file-name)))))

(add-hook 'python-mode-hook 'my/run-with-python)


(define-key evil-normal-state-map (kbd "tf") (lambda () (interactive) (+goto-function.outer)))
(define-key evil-normal-state-map (kbd "tF") (lambda () (interactive) (+goto-previous-function.outer)))
(define-key evil-normal-state-map (kbd "tc") (lambda () (interactive) (+goto-class.outer)))
(define-key evil-normal-state-map (kbd "tC") (lambda () (interactive) (+goto-previous-class.outer)))
(define-key evil-normal-state-map (kbd "tl") (lambda () (interactive) (+goto-loop.outer)))
(define-key evil-normal-state-map (kbd "tL") (lambda () (interactive) (+goto-previous-loop.outer)))
(define-key evil-normal-state-map (kbd "ti") (lambda () (interactive) (+goto-conditional.outer)))
(define-key evil-normal-state-map (kbd "tI") (lambda () (interactive) (+goto-previous-conditional.outer)))
(define-key evil-normal-state-map (kbd "ta") (lambda () (interactive) (+goto-parameter.outer)))
(define-key evil-normal-state-map (kbd "tA") (lambda () (interactive) (+goto-previous-parameter.outer)))
(define-key evil-visual-state-map (kbd "tf") (lambda () (interactive) (+goto-function.outer)))
(define-key evil-visual-state-map (kbd "tF") (lambda () (interactive) (+goto-previous-function.outer)))
(define-key evil-visual-state-map (kbd "tc") (lambda () (interactive) (+goto-class.outer)))
(define-key evil-visual-state-map (kbd "tC") (lambda () (interactive) (+goto-previous-class.outer)))
(define-key evil-visual-state-map (kbd "tl") (lambda () (interactive) (+goto-loop.outer)))
(define-key evil-visual-state-map (kbd "tL") (lambda () (interactive) (+goto-previous-loop.outer)))
(define-key evil-visual-state-map (kbd "ti") (lambda () (interactive) (+goto-conditional.outer)))
(define-key evil-visual-state-map (kbd "tI") (lambda () (interactive) (+goto-previous-conditional.outer)))
(define-key evil-visual-state-map (kbd "ta") (lambda () (interactive) (+goto-parameter.outer)))
(define-key evil-visual-state-map (kbd "tA") (lambda () (interactive) (+goto-previous-parameter.outer)))


(defvar ivy-bibtex-extra-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-SPC") 'ivy-mark)
    (define-key map (kbd "S-SPC") 'ivy-unmark)
    (define-key map (kbd "M-e") '(ivy-bibtex-edit-notes (bibtex-completion-key-at-point)))
    map)
  "Optional extra keymap for `ivy-bibtex'.")



(add-hook 'darkroom-tentative-mode-hook (lambda () (interactive) (display-line-numbers-mode 'toggle)))

(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %d-%m-%Y"
      org-journal-file-format "%d-%m-%Y.org")

(setq org-journal-dir "~/Roam/daily")

(setq doom-modeline-icon t)
(setq doom-modeline-modal-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-persp-name t)

(setq org-roam-directory "~/Roam")


(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(add-function :before-until tree-sitter-hl-face-mapping-function
              (lambda (capture-name)
                (pcase capture-name
                  ("julia.function.call" 'lsp-face-semhl-function)
                  )))

(add-function :before-until tree-sitter-hl-face-mapping-function
              (lambda (capture-name)
                (pcase capture-name
                  ("julia.attribute" 'lsp-face-semhl-interface)
                  )))

(add-function :before-until tree-sitter-hl-face-mapping-function
              (lambda (capture-name)
                (pcase capture-name
                  ("julia.parameter.type" 'lsp-face-semhl-type)
                  )))

(add-function :before-until tree-sitter-hl-face-mapping-function
              (lambda (capture-name)
                (pcase capture-name
                  ("julia.struct.type" 'lsp-face-semhl-type)
                  )))

(add-function :before-until tree-sitter-hl-face-mapping-function
              (lambda (capture-name)
                (pcase capture-name
                  ("julia.type.type" 'lsp-face-semhl-type)
                  )))

(add-function :before-until tree-sitter-hl-face-mapping-function
              (lambda (capture-name)
                (pcase capture-name
                  ("julia.return" 'lsp-face-semhl-keyword)
                  )))

(add-function :before-until tree-sitter-hl-face-mapping-function
              (lambda (capture-name)
                (pcase capture-name
                  ("julia.macro" 'lsp-face-semhl-default-library)
                  )))

(add-function :before-until tree-sitter-hl-face-mapping-function
              (lambda (capture-name)
                (pcase capture-name
                  ("julia.function_dec" 'lsp-face-semhl-definition)
                  )))

(add-hook 'julia-mode-hook
          (lambda ()
            (tree-sitter-hl-add-patterns nil
              [(call_expression ((identifier)+ @julia.function.call))
               (macro_expression (macro_identifier ) @julia.macro)
               (field_expression (_) (identifier) @julia.attribute)
               (typed_parameter (_) (identifier) @julia.parameter.type)
               (return_statement "return" @julia.return)
               (function_definition (identifier ) @julia.function_dec)
               (typed_expression (parameterized_identifier) @julia.struct.type)
               (typed_expression (_)(identifier) @julia.struct.type)
               (parameterized_identifier) @julia.type.type
               ]

              )))

(setq all-the-icons-dired-monochrome 'nil)

(defhydra hydra-zoom (global-map "<C-R>")
  "splitter"
  ("<Up>" hydra-move-splitter-up)
  ("<Down>" hydra-move-splitter-down)
  ("<Right>" hydra-move-splitter-right)
  ("<Left>" hydra-move-splitter-left))

(after! all-the-icons
  (setcdr (assoc "m" all-the-icons-extension-icon-alist)
          (cdr (assoc "matlab" all-the-icons-extension-icon-alist))))

                                        ; TODO: Download Matlab mode via 'M-x' list-packages
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
;; (require 'matlab-load)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "~/MATLAB/bin/matlab")
(defun my-matlab-hook ()
  (display-line-numbers-mode 1))
(add-hook 'matlab-mode-hook 'my-matlab-hook)
;; (setq fancy-splash-image "~/Stuff/gnu.svg")
(setq fancy-splash-image "~/Stuff/nasa.svg")


;;;;;;; (setq mini-frame-show-parameters
;;;;;;;         `((left . 0.5)
;;;;;;;           (top . 1.0)
;;;;;;;           (width . 1.0)
;;;;;;;           (height . 5)
;;;;;;;           (left-fringe . 12)
;;;;;;;           (right-fringe .12)
;;;;;;;           (child-frame-border-width . 0)
;;;;;;;           (internal-border-width . 0)))


(require 'svg-lib)
(require 'svg-tag-mode)
(require 'color)

;; (setq svg-tag-tags '(
;;                      (":UNI:" . ((lambda (tag) (svg-tag-make "Uni" :face 'shadow))))
;;                      (":IMPROV:" . ((lambda (tag) (svg-tag-make "Improv"))))
;;                      (":PROD:" . ((lambda (tag) (svg-tag-make "Prod"))))
;;                      ("HOLD" . ((lambda (tag) (svg-tag-make "HOLD" :face 'transient-pink))))
;;                      ("STRT" . ((lambda (tag) (svg-tag-make "START" :inverse t :face '+org-todo-cancel))))
;;                      (":FUN:" . ((lambda (tag) (svg-tag-make "Fun" :face 'warning))))
;;                      (":CODE:" . ((lambda (tag) (svg-tag-make "Code" :face 'match))))
;;                      (":IMP:" . ((lambda (tag) (svg-tag-make "Important" :inverse t))))
;;                      (":JP:" . ((lambda (tag) (svg-tag-make "JP" :inverse t :face 'org-headline-todo))))
;;                      ;;("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'fringe))))
;;                      ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :inverse t :face 'org-level-1))))
;;                      ("THNK" . ((lambda (tag) (svg-tag-make "THNK" :inverse t :face 'org-level-1))))
;;                      ("WORK" . ((lambda (tag) (svg-tag-make "WORK" :inverse t :face 'match))))
;;                      ("PRCS" . ((lambda (tag) (svg-tag-make "PRCS" :inverse t :face 'warning))))
;;                      ("CURR" . ((lambda (tag) (svg-tag-make "CURR" :face '+org-todo-cancel))))
;;                      ("PROJ" . ((lambda (tag) (svg-tag-make "PROJ" :inverse t :face '+org-todo-project))))
;;                      ("\\[#[A-Z]\\]" . ( (lambda (tag) (svg-tag-make tag :inverse t :face '+org-todo-cancel :beg 2 :end -1 :margin 0))))
;;                      (":orange:" . ( (lambda (tag) (svg-tag-make "+" :inverse t :face 'org-code))))
;;                      (":yellow:" . ( (lambda (tag) (svg-tag-make "+" :inverse t :face '+org-todo-onhold))))
;;                      (":red:" . ( (lambda (tag) (svg-tag-make "+" :inverse t :face '+org-todo-cancel))))
;;                      (":green:" . ( (lambda (tag) (svg-tag-make "+" :inverse t :face 'org-checkbox))))
;;                      (":blue:" . ( (lambda (tag) (svg-tag-make "+" :inverse t :face 'dired-special))))
;;                      ))
;; (add-hook 'org-mode-hook
;;           #'svg-tag-mode)
;; (add-hook 'org-agenda-mode-hook
;;           #'svg-tag-mode)

;; (defun doom-dashboard-widget-head-text ()
;;   (insert
;;    "\n test"
;;    (+doom-dashboard--center
;;     (- +doom-dashboard--width 2)

;;    "\n")))

;; (defvar +doom-dashboard-functions
;;   '(doom-dashboard-widget-banner
;;     doom-dashboard-widget-head-text
;;     doom-dashboard-widget-shortmenu
;;     doom-dashboard-widget-loaded
;;     doom-dashboard-widget-footer)
;;   "List of widget functions to run in the dashboard buffer to construct the
;; dashboard. These functions take no arguments and the dashboard buffer is current
;; while they run.")

(after! org
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "CURR(c)"                             ; A task that needs doing & is ready to do
           "PROJ(p)"  ; A project, which usually contains other tasks
           "WORK(u)"
           "PRCS(v)"                             ; A recurring task
           "STRT(s)"
           "THNK(n)"                             ; A task that is in progress
           "WAIT(w)"  ; Something external is holding up this task
           "HOLD(h)"  ; This task is paused/on hold because of me
           "IDEA(i)"  ; An unconfirmed and unapproved task or notion
           "|"
           "DONE(d)"  ; Task successfully completed
           "KILL(k)") ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](W)"   ; Task is being held up or paused
           "|"
           "[X](D)")  ; Task was completed
          (sequence
           "|"
           "OKAY(o)"
           "YES(y)"
           "NO(n)"))
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("STRT" . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)
          ("NO"   . +org-todo-cancel)
          ("KILL" . +org-todo-cancel)))
  )



;; (add-load-path! "~/.doom.d/lisp/setup-splash.el")

(setq org-agenda-custom-commands
      '(
        ("D" "Meine Agenda"
         ((todo "THNK|HOLD"
                (
                 (org-agenda-overriding-header " REMINDER\n")
                 ))
          (agenda " "
                  (
                   (org-agenda-overriding-header " SOOOON\n")
                   (org-agenda-span 30)
                   (org-agenda-start-day "+0d")
                   (org-agenda-show-all-dates nil)
                   (org-agenda-entry-types '(:deadline))
                   (org-deadline-warning-days 0)
                   ))
          (agenda " "
                  (
                   (org-agenda-overriding-header " Day\n")
                   (org-agenda-span 1)
                   (org-agenda-start-day "+0d")
                   (org-deadline-warning-days 0)
                   (org-agenda-day-face-function (lambda (date) 'org-agenda-date))
                   ))
          (agenda " "
                  ((org-agenda-overriding-header "󰎕 Tomorrow\n")
                   (org-agenda-start-day "+1d")
                   (org-agenda-span 1)
                   (org-agenda-show-all-dates nil)
                   ))
          (todo "PROJ"
                ((org-agenda-overriding-header "󰀸 Projects i want to do :]\n")))
          (agenda " "
                  ((org-agenda-overriding-header " ÜBERMORGEN\n")
                   (org-agenda-start-day "+2d")
                   (org-agenda-span 1)
                   (org-agenda-show-all-dates nil)
                   ))
          (todo "CURR"
                ((org-agenda-overriding-header " Current projects\n")))
          ))
        ))

(setq +org-capture-notes-file "inbox.org")
(setq +org-capture-projects-file "~/Dropbox/Orga/projects.org")

;;(after! org-capture
;;(setq org-capture-templates
;;    (doct `((,(format "%s\ttodo item" (all-the-icons-octicon "checklist" :face 'all-the-icons-dpink :v-adjust 0.01))
;;           :keys "t"
;;:file +org-capture-todo-file
;;:prepend t
;;:headline "Inbox"
;;:type entry
;;:template ("* TODO %?"
;;          "SCHEDULED: %^T")
;;)
;;(,(format "%s\tinbox item" (all-the-icons-faicon "sticky-note-o" :face 'all-the-icons-purple :v-adjust 0.01))
;;:keys "i"
;;:file +org-capture-notes-file
;;:prepend t
;;:type entry
;;:template ("* %?")
;;)
;;(,(format "%s\tproject idea" (all-the-icons-material "library_books" :face 'all-the-icons-orange :v-adjust 0.01))
;;                  :keys "p"
;;                :file +org-capture-projects-file
;;              :prepend t
;;                  :headline "PR0JECTS"
;;                :type entry
;;              :template ("* PROJ %^{Project name} [/] :%^{Tag|CODE|FUN|IMPROV}:"
;;                       "** [ ] %?")
;;          )
;;       (, (format "%s\trandom thought" (all-the-icons-material "bubble_chart" :face 'all-the-icons-purple :v-adjust 0.01))
;;        :keys "r"
;;                    :file "~/Dropbox/Stuff/Orga/Roam/20220306201250-random_thoughts.org"
;;                  :prepend t
;;                :type entry
;;              :template ("* %?"
;;                       "%U"))
;;       (, (format "%s\tvid list" (all-the-icons-material "bubble_chart" :face 'all-the-icons-purple :v-adjust 0.01))
;;        :keys "v"
;;      :file "~/Dropbox/Stuff/Orga/Roam/20220228205355-vidlist.org"
;;                    :prepend t
;;                  :type entry
;;                :template ("* %?")))))
;;)

(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(setq display-time-load-average-threshold nil)
;; (nyan-mode 1)
;; (parrot-mode)
;; (parrot-set-parrot-type 'science)

(setq lsp-julia-package-dir nil)
(setq lsp-julia-default-environment "~/.julia/environments/v1.10")

(after! julia-mode
  (add-hook! 'julia-mode-hook
    (setq-local lsp-enable-folding t
                lsp-folding-range-limit 100)))

(setq org-roam-dailies-capture-templates
      '(("w" "Weekly" entry "* Thought of the week\n %?\n* Review \n\n* What to keep up\n\n* What to improve\n\n* Vibes/Mood/Interest"
         :if-new (file+head "weekly/weekly-%<%d-%m-%Y>.org" "#+title: Weekly: %<%d-%m-%Y>\n"))
        ("d" "Daily" entry "* %?" :if-new (file+head  "daily-%<%d-%m-%Y>.org" "#+title: %<%d-%m-%Y>\n"))
        )
      )

(setq org-roam-capture-templates
      '(("d" "default" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("m" "master" plain (file "~/Roam/test/templates/stuff.org")
         :target (file+head "master/%<%Y%m%d%H%M%S>-${citekey}.org" "#+title: ${citekey}\n#+description: ${title}\n#+filetags: :uni:MA:\n\n* Summary\n\n* Further Reading")
         :unnarrowed t)
        ("u" "uni" plain
         "#+STARTUP: latexpreview\n %?"
         :target (file+head "uni/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("n" "ref + noter" plain
         (file "~/Roam/test/templates/noternotes.org")
         :target (file+head "~/Roam/notes/${citekey}.org" "#+title: ${citekey}\n* ${title}\n")
         :unnarrowed t
         )
        ("l" "lotr" plain
         "\n\n* Summary\n%?"
         :if-new (file+head "~/Roam/Lord of the Rings/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ))


(setq lsp-enable-file-watchers nil)
(setq org-capture-bookmark nil)
(doom-themes-neotree-config)
(setq doom-themes-neotree-file-icons t)
(setq bibtex-completion-bibliography
      '("~/Roam/papers/lib.bib"))
(setq bibtex-completion-library-path '("~/Roam/papers"))
;; (setq org-startup-with-latex-preview t)
(setq org-use-sub-superscripts nil)
(setq org-pretty-entities nil)
(setq org-pretty-entities-include-sub-superscripts nil)
(setq lsp-julia-package-dir nil)
(setq lsp-julia-default-environment "~/.julia/environments/v1.10")

(add-hook 'org-mode-hook
          (λ! (yas-minor-mode)
              (yas-activate-extra-mode 'latex-mode)))

(display-time)

(require 'org-modern)
(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"
 ;; Agenda styling
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "<< now ─────────────────────────────────────────────────")

;; (setq org-modern-block nil)
;; (setq org-modern-todo nil)
;; (setq org-modern-tag nil)
;; (setq org-modern-priority nil)

;; (global-org-modern-mode)
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
(set-register ?m (cons 'file "~/Dropbox/Orga/Main.org"))

(add-to-list 'display-buffer-alist '("^\\*Python\\*$" display-buffer-at-bottom (window-height . 15)))

(add-to-list 'display-buffer-alist '("^\*Python :: Run file \(buffer\)<1> server log\*$" display-buffer-at-bottom (window-height . 15)))
(add-to-list 'display-buffer-alist '("^\*Python :: Run file \(buffer\) server log\*$" display-buffer-at-bottom (window-height . 15)))
(setq vterm-shell "/bin/bash")

(add-to-list
 'auto-mode-alist
 '("\\.py$" . python-mode))


(use-package! org-roam-bibtex
  :after org-roam
  :config
  (require 'org-ref)) ; optional: if using Org-ref v2 or v3 citation links

(setq bibtex-completion-notes-path "~/Roam/notes")
;; (require 'mozc)
;; (setq default-input-method "japanese-mozc")
;;(setq mozc-candidate-style 'posframe)

;; (setq orb-note-actions-interface 'ivy)
;; (add-hook 'org-roam-bibtex-mode-hook #'org-roam-bibtex-mode)

;; (add-hook! 'org-roam-bibtex-mode-hook #'org-roam-bibtex-mode)
(setq org-excalidraw-directory "~/Dropbox/Orga/Scratchpad")
(setq org-noter-always-create-frame nil)
;; (require 'dap-python)
;;
(after! dap-mode (setq dap-python-debugger 'debugpy))

;; (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(lsp-headerline-breadcrumb-mode 1)
(setq doom-themes-treemacs-theme "doom-colors")
(after! org
  (set-face-attribute 'org-document-title nil
                      :background nil
                      :height 1.75
                      :weight 'bold)
  (set-face-attribute 'org-link nil
                      :weight 'normal
                      :background nil)
  (set-face-attribute 'org-code nil
                      :background nil)
  (set-face-attribute 'org-date nil
                      :background nil)
  (set-face-attribute 'org-level-1 nil
                      :background nil
                      :height 1.2
                      :weight 'normal)
  (set-face-attribute 'org-level-2 nil
                      :background nil
                      :height 1.1
                      :weight 'normal)
  (set-face-attribute 'org-level-3 nil
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-4 nil
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-5 nil
                      :weight 'normal)
  (set-face-attribute 'org-level-6 nil
                      :weight 'normal))

(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)

;; (use-package! websocket
;;     :after org-roam)

;; (use-package! org-roam-ui
;;     :after org-roam ;; or :after org
;; ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;; ;;         a hookable mode anymore, you're advised to pick something yourself
;; ;;         if you don't care about startup time, use
;; ;;  :hook (after-init . org-roam-ui-mode)
;;     :config
;;     (setq org-roam-ui-sync-theme t
;;           org-roam-ui-follow t
;;           org-roam-ui-update-on-save t
;;           org-roam-ui-open-on-start t))

(company-posframe-mode 1)
(after! org-noter
  (setq org-noter-doc-split-fraction '(0.65 . 0.35)))
(make-face-unbold 'tree-sitter-hl-face:function.call)
;; (make-face-unbold 'highlight-numbers-number)

;; PYWAL THEME
;; (setq ewal-use-built-in-always-p nil
;;       ewal-use-built-in-on-failure-p t
;;       ewal-built-in-palette "sexy-material")

;; (progn (show-paren-mode +1)
;;        (global-hl-line-mode)
;;        (load-theme 'ewal-doom-one t)
;;        (enable-theme 'ewal-doom-one))

;; (after! ewal-doom-themes
;;   (ewal-evil-cursors-get-colors :apply t)
;;   (setq ewal-doom-one-brighter-modeline t)
;;   )

(setq +evil-want-o/O-to-continue-comments nil)
(add-to-list 'exec-path "/home/yulivee/.local/share/go/bin")

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "python " buffer-file-name))))

(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "go run " buffer-file-name))))

(add-hook! 'org-mode-hook
           #'+zen/toggle)
(setq my/org-latex-scale 2)
(setq org-format-latex-options (plist-put org-format-latex-options :scale my/org-latex-scale))
;; (require 'quarto-mode)

(setq org-timeblock-n-days-view 1)

(defun my/dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (message "Opening %s..." file)
    (call-process "xdg-open" nil 0 nil file)
    (message "Opening %s done" file)))

(defun my/open-with ()
  (interactive)
  (let* ((file (buffer-file-name)))
    (message "Opening %s..." file)
    (call-process "xdg-open" nil 0 nil file)
    (message "Opening %s done" file)))


(setq lsp-treemacs-symbols-sort-functions '(lsp-treemacs-sort-by-kind))
(setq lsp-treemacs-symbols-position-params '((side . right) (slot . 2) (window-width . 30)))

(poke-line-global-mode 1)
(poke-line-set-pokemon "gardevoir")

(map! :leader
      :desc "Compile"
      "c c" #'compile)

(setq alert-default-style 'libnotify)
(setq org-alert-interval 300
      org-alert-notify-cutoff 10
      org-alert-notify-after-event-cutoff 10)

(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "JetBrainsMono Nerd Font"
                           :height 1.5))
(add-hook 'nov-mode-hook 'my-nov-font-setup)


(setq bibtex-completion-format-citation-functions
      '((org-mode      . my/bibtex-completion-format-citation-org-cite)
        (latex-mode    . bibtex-completion-format-citation-cite)
        (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
        (default       . bibtex-completion-format-citation-default)))

(setq bibtex-completion-pdf-open-function
      (lambda (fpath)
        (call-process "zathura" nil 0 nil fpath)))

(defun bibtex-completion-open-pdf-external (keys &optional fallback-action)
  (let ((bibtex-completion-pdf-open-function
         (lambda (fpath) (call-process "emacsclient" nil 0 nil fpath))))
    (bibtex-completion-open-pdf keys fallback-action)))

(ivy-mode 1)
(require 'ivy-bibtex)
(ivy-bibtex-ivify-action bibtex-completion-open-pdf-external ivy-bibtex-open-pdf-external)

(ivy-add-actions
 'ivy-bibtex
 '(("P" ivy-bibtex-open-pdf-external "Open PDF file in emacs")))

;; (setq lsp-pyright-multi-root nil)
(setq lsp-pyright-venv-path "/Users/dusc/venv")

;; You can use this hydra menu that have all the commands
;; (map! :n "C-SPC" 'harpoon-quick-menu-hydra)
(map! :n "C-s" 'harpoon-add-file)

;; And the vanilla commands
;; (map! :leader "j c" 'harpoon-clear)
;; (map! :leader "j f" 'harpoon-toggle-file)
(map! :leader "1" 'harpoon-go-to-1)
(map! :leader "2" 'harpoon-go-to-2)
(map! :leader "3" 'harpoon-go-to-3)
(map! :leader "4" 'harpoon-go-to-4)
(map! :leader "5" 'harpoon-go-to-5)
(map! :leader "6" 'harpoon-go-to-6)
(map! :leader "7" 'harpoon-go-to-7)
(map! :leader "8" 'harpoon-go-to-8)
(map! :leader "9" 'harpoon-go-to-9)

(setq bibtex-completion-additional-search-fields '(tags))
(setq orb-insert-link-description 'citekey)


;; (use-package! websocket
;;     :after org-roam)

;; (use-package! org-roam-ui
;;     :after org-roam ;; or :after org
;; ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;; ;;         a hookable mode anymore, you're advised to pick something yourself
;; ;;         if you don't care about startup time, use
;; ;;  :hook (after-init . org-roam-ui-mode)
;;     :config
;;     (setq org-roam-ui-sync-theme t
;;           org-roam-ui-follow t
;;           org-roam-ui-update-on-save t
;;           org-roam-ui-open-on-start t))

(setq org-roam-bibtex-mode t)
(add-to-list 'magit-section-initial-visibility-alist (cons 'org-roam-node-section 'hide))

(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;; (catppuccin-reload)

;; (after! org-roam
;;   (defun my/set-tab-theme ()
;;     (let ((bg (face-attribute 'mode-line :background))
;;           (fg (face-attribute 'default :foreground))
;; 	  (hg (face-attribute 'default :background))
;;           (base (face-attribute 'mode-line :background))
;;           (box-width (/ (line-pixel-height) 4)))
;;       (set-face-attribute 'tab-line nil
;; 			  :background base
;; 			  :foreground fg
;; 			  :height 0.8
;; 			  :inherit nil
;; 			  :box (list :line-width -1 :color base)
;; 			  )
;;       (set-face-attribute 'tab-line-tab nil
;; 			  :foreground fg
;; 			  :background bg
;; 			  :weight 'normal
;; 			  :inherit nil
;; 			  :box (list :line-width box-width :color bg))
;;       (set-face-attribute 'tab-line-tab-inactive nil
;; 			  :foreground fg
;; 			  :background base
;; 			  :weight 'normal
;; 			  :inherit nil
;; 			  :box (list :line-width box-width :color base))
;;       (set-face-attribute 'tab-line-highlight nil
;; 			  :foreground fg
;; 			  :background hg
;; 			  :weight 'normal
;; 			  :inherit nil
;; 			  :box (list :line-width box-width :color hg))
;;       (set-face-attribute 'tab-line-tab-current nil
;; 			  :foreground fg
;; 			  :background hg
;; 			  :weight 'normal
;; 			  :inherit nil
;; 			  :box (list :line-width box-width :color hg))))

;;   (defun my/tab-line-name-buffer (buffer &rest _buffers)
;;     "Create name for tab with padding and truncation.
;; If buffer name is shorter than `tab-line-tab-max-width' it gets
;; centered with spaces, otherwise it is truncated, to preserve
;; equal width for all tabs.  This function also tries to fit as
;; many tabs in window as possible, so if there are no room for tabs
;; with maximum width, it calculates new width for each tab and
;; truncates text if needed.  Minimal width can be set with
;; `tab-line-tab-min-width' variable."
;;     (with-current-buffer buffer
;;       (let* ((window-width (window-width (get-buffer-window)))
;;              (tab-amount (length (tab-line-tabs-window-buffers)))
;;              (window-max-tab-width (if (>= (* (+ tab-line-tab-max-width 3) tab-amount) window-width)
;;                                        (/ window-width tab-amount)
;;                                      tab-line-tab-max-width))
;;              (tab-width (- (cond ((> window-max-tab-width tab-line-tab-max-width)
;;                                   tab-line-tab-max-width)
;;                                  ((< window-max-tab-width tab-line-tab-min-width)
;;                                   tab-line-tab-min-width)
;;                                  (t window-max-tab-width))
;;                            3)) ;; compensation for ' x ' button
;;              (buffer-name (string-trim (buffer-name)))
;;              (name-width (length buffer-name)))
;;         (if (>= name-width tab-width)
;;             (concat  " " (truncate-string-to-width buffer-name (- tab-width 2)) "…")
;;           (let* ((padding (make-string (+ (/ (- tab-width name-width) 2) 1) ?\s))
;;                  (buffer-name (concat padding buffer-name)))
;;             (concat buffer-name (make-string (- tab-width (length buffer-name)) ?\s)))))))

;;   (defun tab-line-close-tab (&optional e)
;;     "Close the selected tab.
;; If tab is presented in another window, close the tab by using
;; `bury-buffer` function.  If tab is unique to all existing
;; windows, kill the buffer with `kill-buffer` function.  Lastly, if
;; no tabs left in the window, it is deleted with `delete-window`
;; function."
;;     (interactive "e")
;;     (let* ((posnp (event-start e))
;;            (window (posn-window posnp))
;;            (buffer (get-pos-property 1 'tab (car (posn-string posnp)))))
;;       (with-selected-window window
;;         (let ((tab-list (tab-line-tabs-window-buffers))
;;               (buffer-list (flatten-list
;;                             (seq-reduce (lambda (list window)
;;                                           (select-window window t)
;;                                           (cons (tab-line-tabs-window-buffers) list))
;;                                         (window-list) nil))))
;;           (select-window window)
;;           (if (> (seq-count (lambda (b) (eq b buffer)) buffer-list) 1)
;;               (progn
;;                 (if (eq buffer (current-buffer))
;;                     (bury-buffer)
;;                   (set-window-prev-buffers window (assq-delete-all buffer (window-prev-buffers)))
;;                   (set-window-next-buffers window (delq buffer (window-next-buffers))))
;;                 (unless (cdr tab-list)
;;                   (ignore-errors (delete-window window))))
;;             (and (kill-buffer buffer)
;;                  (unless (cdr tab-list)
;;                    (ignore-errors (delete-window window)))))))))

;;   (unless (version< emacs-version "27")
;;     (use-package tab-line
;;       :ensure nil
;;       :hook (after-init . global-tab-line-mode)
;;       :config

;;       (defcustom tab-line-tab-min-width 10
;;         "Minimum width of a tab in characters."
;;         :type 'integer
;;         :group 'tab-line)

;;       (defcustom tab-line-tab-max-width 30
;;         "Maximum width of a tab in characters."
;;         :type 'integer
;;         :group 'tab-line)

;;       (setq tab-line-close-button-show t
;;             tab-line-new-button-show nil
;;             tab-line-separator ""
;;             tab-line-tab-name-function #'my/tab-line-name-buffer
;;             tab-line-right-button (propertize (if (char-displayable-p ?▶) " ▶ " " > ")
;;                                               'keymap tab-line-right-map
;;                                               'mouse-face 'tab-line-highlight
;;                                               'help-echo "Click to scroll right")
;;             tab-line-left-button (propertize (if (char-displayable-p ?◀) " ◀ " " < ")
;;                                              'keymap tab-line-left-map
;;                                              'mouse-face 'tab-line-highlight
;;                                              'help-echo "Click to scroll left")
;;             tab-line-close-button (propertize (if (char-displayable-p ?×) " × " " x ")
;;                                               'keymap tab-line-tab-close-map
;;                                               'mouse-face 'tab-line-close-highlight
;;                                               'help-echo "Click to close tab"))

;;       (my/set-tab-theme)

;;       ;;(dolist (mode '(ediff-mode process-menu-mode term-mode vterm-mode))
;;       ;;(add-to-list 'tab-line-exclude-modes mode))
;;       (dolist (mode '(ediff-mode process-menu-mode))
;;         (add-to-list 'tab-line-exclude-modes mode))
;;       ))

;;   )
;; (global-tab-line-mode t)


;; DASHBOARD CONFIG
(defun doom-dashboard-widget-footer ()
  (insert
   "\n"
   (+doom-dashboard--center
    (- +doom-dashboard--width 2)
    (with-temp-buffer
      (insert-text-button (or (nerd-icons-faicon "nf-fae-planet" :face 'doom-dashboard-footer-icon :height 1.3 :v-adjust -0.15)
                              (propertize "github" 'face 'doom-dashboard-footer))
                          'action (lambda (_) (browse-url "https://github.com/hlissner/doom-emacs"))
                          'follow-link t
                          'help-echo "bruh lmao")
      (buffer-string)))
   "\n"))

(defun doom-display-benchmark-h (&optional return-p)
  (funcall (if return-p #'format #'message)
           "loaded %d packages in %.03fs"
           (- (length load-path) (length (get 'load-path 'initial-value)))
           doom-init-time))


(defun dashboard-text-lol (&optional return-p)
  (funcall (if return-p #'format #'message)
           "head in the clouds - but my gravity's centered"))

(defun insert-dashboard-text ()
  (insert
   (propertize
    (+doom-dashboard--center
     +doom-dashboard--width
     (dashboard-text-lol 'return))
    'face 'doom-dashboard-loaded)
   ))

(defvar +doom-dashboard-menu-sections2
  '(("Recently opened files"
     :icon (nerd-icons-faicon "nf-fa-file_text" :face 'doom-dashboard-menu-title)
     :action recentf-open-files)
    ("Reload last session"
     :icon (nerd-icons-octicon "nf-oct-history" :face 'doom-dashboard-menu-title)
     :when (cond ((modulep! :ui workspaces)
                  (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                 ((require 'desktop nil t)
                  (file-exists-p (desktop-full-file-name))))
     :action doom/quickload-session)
    ("Open private configuration"
     :icon (nerd-icons-octicon "nf-oct-tools" :face 'doom-dashboard-menu-title)
     :when (file-directory-p doom-user-dir)
     :action doom/open-private-config)
    )
  )

(defun doom-dashboard-widget-shortmenu ()
  (insert "\n")
  (dolist (section +doom-dashboard-menu-sections2)
    (cl-destructuring-bind (label &key icon action when face key) section
      (when (and (fboundp action)
                 (or (null when)
                     (eval when t)))
        (insert
         (+doom-dashboard--center
          (- +doom-dashboard--width 1)
          (let ((icon (if (stringp icon) icon (eval icon t))))
            (format (format "%s%%s%%-10s" (if icon "%3s\t" "%3s"))
                    (or icon "")
                    (with-temp-buffer
                      (insert-text-button
                       label
                       'action
                       `(lambda (_)
                          (call-interactively (or (command-remapping #',action)
                                                  #',action)))
                       'face (or face 'doom-dashboard-menu-title)
                       'follow-link t
                       'help-echo
                       (format "%s (%s)" label
                               (propertize (symbol-name action) 'face 'doom-dashboard-menu-desc)))
                      (format "%-37s" (buffer-string)))
                    ;; Lookup command keys dynamically
                    (propertize
                     (or key
                         (when-let*
                             ((keymaps
                               (delq
                                nil (list (when (bound-and-true-p evil-local-mode)
                                            (evil-get-auxiliary-keymap +doom-dashboard-mode-map 'normal))
                                          +doom-dashboard-mode-map)))
                              (key
                               (or (when keymaps
                                     (where-is-internal action keymaps t))
                                   (where-is-internal action nil t))))
                           (with-temp-buffer
                             (save-excursion (insert (key-description key)))
                             (while (re-search-forward "<\\([^>]+\\)>" nil t)
                               (let ((str (match-string 1)))
                                 (replace-match
                                  (upcase (if (< (length str) 3)
                                              str
                                            (substring str 0 3))))))
                             (buffer-string)))
                         "")
                     'face 'doom-dashboard-menu-desc))))
         (if (display-graphic-p)
             ;; "\n\n"
             "\n"))))))

;; ADD INSERT-DASHBOARD-TEXT TO +DOOM-DASHBOARD-FUNCTIONS
;; (use-package! lsp-bridge
;;   :config
;;   (setq lsp-bridge-enable-log nil)
;;   (global-lsp-bridge-mode)
;;   )

;; (define-key acm-mode-map (kbd "<tab>") #'acm-select-next)
;; (define-key acm-mode-map (kbd "<backtab>") #'acm-select-prev)

;; (add-hook 'prog-mode-hook
;;           (lsp-mode -1)
;;           (company-mode 0)
;; (lambda () (interactive) (lsp-mode -1))
;; (lambda () (interactive) (company-mode 0))
;; )


;; (after! python-mode
;;   (add-hook! 'python-mode-hook
;;     (setq-local lsp-mode -1
;;                 company-mode 0)))

;; (lsp-mode -1)

(defun my/bibtex-completion-format-citation-org-cite (keys)
  (format "cite:%1s" (s-join ";"(--map (format "%s" it) keys))))

(setq bibtex-completion-format-citation-functions
      '((org-mode       . my/bibtex-completion-format-citation-org-cite)
        (latex-mode     . bibtex-completion-format-citation-cite)
        (markdown-mode  . bibtex-completion-format-citation-pandoc-citeproc)
        (default        . bibtex-completion-format-citation-default)))

(setq read-process-output-max (* 2048 2048))
(setq lsp-idle-delay 0.100)
(setq lsp-log-io nil) ; if set to true can cause a performance hit
(setq gc-cons-threshold 100000000)

;; (use-package punch-line
;;   :ensure nil
;;   :after evil
;;   :custom
;;   (punch-weather-update) ;; Use weather service
;;   :config
;;   (setq
;;    punch-line-separator "  "
;;    punch-show-project-info t					;; Show project info
;;    punch-show-git-info t						;; Show git info
;;    punch-show-lsp-info t						;; Show eglot info
;;    punch-show-copilot-info t					;; Show copilot
;;    punch-show-battery-info t					;; Show battery status
;;    punch-show-weather-info t					;; Weather info
;;    punch-weather-latitude "56.7365"				;; Weather latitude
;;    punch-weather-longitude "16.2981"			;; Weather longitude
;;    punch-line-music-info '(:service apple))		;; Music service
;;   (punch-line-mode 1))

(setq company-idle-delay 0.1)
