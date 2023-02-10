;;; init-treemacs.el --- treemacs config -*- lexical-binding: t -*-
;;; Commentary:

;;; This treemacs file the configuration

;;; Code:
(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-project-follow-mode           t
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         t
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        t
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask" "dist" "target")
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-visibility ;;'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
	  treemacs-expand-after-init             t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-width                         30)
    (treemacs-follow-mode t)
    (treemacs-project-follow-mode t)
    ;;(treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("C-x t 1"       . treemacs-select-window)
        ;("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))


(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))


(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package lsp-treemacs
  :ensure t
  :after (treemacs lsp))

(require 'treemacs)
(require 'all-the-icons)
(require 'icons-in-terminal)
(require 'treemacs-all-the-icons)
(treemacs-load-theme "all-the-icons")

(treemacs-modify-theme "all-the-icons"
  ;;:icon-directory "/other/icons/dir"
  :config
  (progn
   
   ;;(treemacs-create-icon :icon (format "  %s%s" (all-the-icons-octicon "go" :v-adjust 0 :face 'all-the-icons-lsilver) treemacs-all-the-icons-tab) :extensions ("go") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "diropen" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions (root-open root-closed) :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "java" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("java" "jar") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "go" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("go") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "md" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("markdown" "md") :fallback 'same-as-icon)
   
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "diropen" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions (dir-open) :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "dirclosed" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions (dir-closed) :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "emacs" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("el") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "python" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("py" "pyc") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "h5" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("html") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "js" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("js" "babel.config.js") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "vue" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("vue") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "json" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("json" "package.json" "package-lock.json") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "css" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("css" "sass" "less" "scss") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "js" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("rs") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "zap" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("org" "note") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "file-text" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions (fallback) :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "img" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions ("png" "gif" "jpg" "jpeg") :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "other" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions (".gitignore" "cache" "apk" "pptx" "ppt" "xls" "xlsx" "pl" "dmg" "xmind" "desktop" "eld" "dap-breakpoints" ) :fallback 'same-as-icon)
   (treemacs-create-icon :icon (format "  %s%s" (icons-in-terminal-octicon "book" :v-adjust 0 :face 'icons-in-terminal-dblue) treemacs-all-the-icons-tab) :extensions (".lsp-session-v1" "amx-items" "recentf" ) :fallback 'same-as-icon)
   ;;(treemacs-create-icon :file (icons-in-terminal-octicon "book" :v-adjust 0 :face 'icons-in-terminal-red) :extensions ("el"))
))

(provide 'init-treemacs)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-treemacs.el ends here
