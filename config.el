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
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12.0 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 15))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Stuff/Orga/")


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
      "<left>" #'evil-window-left)

(map! :leader
      :desc "Switch to right window"
      "<right>" #'evil-window-right)

(map! :leader
      :desc "Switch to up window"
      "<up>" #'evil-window-up)

(map! :leader
      :desc "Switch to down window"
      "<down>" #'evil-window-down)

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

(map! :leader
      :desc "comment"
      "k" #'comment-dwim)

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

(add-hook 'darkroom-tentative-mode-hook (lambda () (interactive) (display-line-numbers-mode 'toggle)))

(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %d-%m-%Y"
      org-journal-file-format "%d-%m-%Y.org")

(setq org-journal-dir "~/Dropbox/Stuff/Orga/Roam/daily")

(setq doom-modeline-icon t)
(setq doom-modeline-modal-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-persp-name t)

(setq org-roam-directory "~/Dropbox/Stuff/Orga/Roam")


(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

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
(require 'matlab-load)
 (add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
 (setq matlab-indent-function t)
(setq matlab-shell-command "~/MATLAB/bin/matlab")
(defun my-matlab-hook ()
   (display-line-numbers-mode 1))
(add-hook 'matlab-mode-hook 'my-matlab-hook)
(setq fancy-splash-image "~/Pictures/emacs-logo.png")


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

(setq svg-tag-tags '(
                     (":UNI:" . ((lambda (tag) (svg-tag-make "Uni" :face 'shadow))))
                     (":IMPROV:" . ((lambda (tag) (svg-tag-make "Improv"))))
                     (":PROD:" . ((lambda (tag) (svg-tag-make "Prod"))))
                     ("HOLD" . ((lambda (tag) (svg-tag-make "HOLD" :face 'transient-pink))))
                     ("STRT" . ((lambda (tag) (svg-tag-make "START" :inverse t :face '+org-todo-cancel))))
                     (":FUN:" . ((lambda (tag) (svg-tag-make "Fun" :face 'warning))))
                     (":CODE:" . ((lambda (tag) (svg-tag-make "Code" :face 'match))))
                     (":IMP:" . ((lambda (tag) (svg-tag-make "Important" :inverse t))))
                     (":JP:" . ((lambda (tag) (svg-tag-make "JP" :inverse t :face 'org-headline-todo))))
                     ;;("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'fringe))))
                     ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :inverse t :face 'org-level-1))))
                     ("THNK" . ((lambda (tag) (svg-tag-make "THNK" :inverse t :face 'org-level-1))))
                     ("WORK" . ((lambda (tag) (svg-tag-make "WORK" :inverse t :face 'match))))
                     ("PRCS" . ((lambda (tag) (svg-tag-make "PRCS" :inverse t :face 'warning))))
                     ("CURR" . ((lambda (tag) (svg-tag-make "CURR" :face '+org-todo-cancel))))
                     ("PROJ" . ((lambda (tag) (svg-tag-make "PROJ" :inverse t :face '+org-todo-project))))
                     ("\\[#[A-Z]\\]" . ( (lambda (tag) (svg-tag-make tag :inverse t :face '+org-todo-cancel :beg 2 :end -1 :margin 0))))
                     ))
(add-hook 'org-mode-hook
          #'svg-tag-mode)
(add-hook 'org-agenda-mode-hook
          #'svg-tag-mode)

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
                 (org-agenda-overriding-header "⚠ REMINDER\n")
                 ))
          (agenda " "
                  (
                   (org-agenda-overriding-header "⚠ SOOOON\n")
                   (org-agenda-span 30)
                   (org-agenda-start-day "+0d")
                   (org-agenda-show-all-dates nil)
                   (org-agenda-entry-types '(:deadline))
                   (org-deadline-warning-days 0)
                   ))
          (agenda " "
                  (
                   (org-agenda-overriding-header "⚠ Day\n")
                   (org-agenda-span 1)
                   (org-agenda-start-day "+0d")
                   (org-deadline-warning-days 0)
                   (org-agenda-day-face-function (lambda (date) 'org-agenda-date))
                   ))
          (agenda " "
                  ((org-agenda-overriding-header "🗓 Tomorrow\n")
                  (org-agenda-start-day "+1d")
                  (org-agenda-span 1)
                  (org-agenda-show-all-dates nil)
                  ))
          (todo "PROJ"
                ((org-agenda-overriding-header "❇ Projects i want to do :]\n")))
          (agenda " "
                  ((org-agenda-overriding-header "🗓 ÜBERMORGEN\n")
                  (org-agenda-start-day "+2d")
                  (org-agenda-span 1)
                  (org-agenda-show-all-dates nil)
                  ))
         (todo "CURR"
                ((org-agenda-overriding-header "🕜 Current projects\n")))
          ))
        ))

(setq +org-capture-notes-file "inbox.org")

(after! org-capture
    (setq org-capture-templates
          (doct `((,(format "%s\ttodo item" (all-the-icons-octicon "checklist" :face 'all-the-icons-dpink :v-adjust 0.01))
                   :keys "t"
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* TODO %?"
                              "SCHEDULED: %^T")
                   )
                  (,(format "%s\tinbox item" (all-the-icons-faicon "sticky-note-o" :face 'all-the-icons-purple :v-adjust 0.01))
                   :keys "i"
                   :file +org-capture-notes-file
                   :prepend t
                   :type entry
                   :template ("* %?")
                   )
                  (,(format "%s\tproject idea" (all-the-icons-material "library_books" :face 'all-the-icons-orange :v-adjust 0.01))
                   :keys "p"
                   :file +org-capture-projects-file
                   :prepend t
                   :headline "PR0JECTS"
                   :type entry
                   :template ("* PROJ %^{Project name} [/] :%^{Tag|CODE|FUN|IMPROV}:"
                              "** [ ] %?")
                   )
                  (, (format "%s\trandom thought" (all-the-icons-material "bubble_chart" :face 'all-the-icons-purple :v-adjust 0.01))
                     :keys "r"
                     :file "~/Dropbox/Stuff/Orga/Roam/20220306201250-random_thoughts.org"
                     :prepend t
                     :type entry
                     :template ("* %?"
                                "%U"))
                              )))
)

(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(setq display-time-load-average-threshold nil)
;; (nyan-mode 1)
;; (parrot-mode)
;; (parrot-set-parrot-type 'science)

(setq lsp-julia-package-dir nil)
(setq lsp-julia-default-environment "~/.julia/environments/v1.7")

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* %<%H:%M> %?"
         :if-new (file+head "%<%d-%m-%Y>.org" "%<%d-%m-%Y>\n")))
      )

(setq org-roam-capture-templates
      '(("d" "default" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "${title}\n")
         :unnarrowed t)
      ("m" "master" plain (file "~/Dropbox/Stuff/Orga/Roam/test/templates/stuff.org")
         :target (file+head "master/%<%Y%m%d%H%M%S>-${slug}.org" "${title}\n")
         :unnarrowed t)
      ("u" "uni" plain
       "#+STARTUP: latexpreview\n %?"
       :target (file+head "uni/%<%Y%m%d%H%M%S>-${slug}.org" "${title}\n")
       :unnarrowed t)))

(setq lsp-enable-file-watchers nil)
(setq org-capture-bookmark nil)
(doom-themes-neotree-config)
(setq doom-themes-neotree-file-icons t)
(setq bibtex-completion-bibliography
      '("~/Dropbox/Stuff/Orga/Roam/papers/lib.bib"))
(setq bibtex-completion-library-path '("~/Dropbox/Stuff/Orga/Roam/papers"))
(setq org-startup-with-latex-preview t)
(setq org-use-sub-superscripts nil)
(setq org-pretty-entities nil)
(setq org-pretty-entities-include-sub-superscripts nil)
(setq lsp-julia-package-dir nil)
(setq lsp-julia-default-environment "~/.julia/environments/v1.7")

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

(setq org-modern-block nil)
(setq org-modern-todo nil)
(setq org-modern-tag nil)
(setq org-modern-priority nil)

;; (global-org-modern-mode)
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
(set-register ?m (cons 'file "~/Dropbox/Stuff/Orga/Main.org"))

(add-to-list 'display-buffer-alist '("^\\*Python\\*$" display-buffer-at-bottom (window-height . 15)))

(add-to-list 'display-buffer-alist '("^\*Python :: Run file \(buffer\)<1> server log\*$" display-buffer-at-bottom (window-height . 15)))
(add-to-list 'display-buffer-alist '("^\*Python :: Run file \(buffer\) server log\*$" display-buffer-at-bottom (window-height . 15)))
(setq vterm-shell "/bin/zsh")
