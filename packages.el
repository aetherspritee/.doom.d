;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

(package! org-alert)
(package! tree-sitter)
(package! tree-sitter-langs)
;;(package! svg-lib)
(package! svg-tag-mode)
(package! dap-mode)
(package! org-modern)
(package! org-ref)
(package! poke-line)
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
(unpin! bibtex-completion helm-bibtex ivy-bibtex)
(package! company-posframe)
(package! darkroom)
(package! mozc)
(package! autothemer)
(package! rainbow-mode)
(package! mozc-cand-posframe)
(package! org-noter-pdftools)
(package! ewal)
(package! ewal-doom-themes)
(package! ewal-evil-cursors)
(package! leetcode)
(package! yuck-mode)
(package! shrface)
(package! fixmee)
(package! julia-ts-mode)
(package! org-ql)
(package! visual-regexp-steroids)
(package! nov)
(package! persist)
(package! gruvbox-theme)
(package! harpoon)
(package! doom-todo-ivy
  :recipe (:host github :repo "jsmestad/doom-todo-ivy"))
(package! catppuccin-theme)

(package! Org-timeblock
  :recipe (:host github :repo "ichernyshovvv/org-timeblock"))

(package! everforest
  :recipe (:host github :repo "Theory-of-Everything/everforest-theme" :files ("everforest-hard-dark-theme.el")))
(package! org-roam-ui)

(when (package! lsp-bridge
        :recipe (:host github
                 :repo "aetherspritee/lsp-bridge"
                 :branch "master"
                 :files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
                 ;; do not perform byte compilation or native compilation for lsp-bridge
                 :build (:not compile)))
  (package! markdown-mode)
  (package! yasnippet))


;; (when (package! lsp-bridge
;;         :recipe (:host github
;;                  :repo "manateelazycat/lsp-bridge"
;;                  :branch "master"
;;                  :files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
;;                  ;; do not perform byte compilation or native compilation for lsp-bridge
;;                  :build (:not compile)))
;;   (package! markdown-mode)
;;   (package! yasnippet))

;; (package! dape
;;   :recipe (:host github :repo "svaante/dape"))

;; (unpin! org-roam)
;; (package! org-roam-ui)
;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)
