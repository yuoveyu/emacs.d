(setq org-directory "~/dir/yulove/org/")

(setq org-startup-indented t)

(setq org-log-done 'time)
(setq org-log-done 'note)


(use-package evil-org
  :ensure t
  :hook (org-mode . evil-org-mode)
  :after org
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
  
(use-package org-superstar
  :ensure t
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
    ( with-eval-after-load  'org-superstar)
    (org-superstar-headline-bullets-list '("☰" "☷" "✿" "☭"))
    (org-superstar-cycle-headline-bullets nil )
    ;; This is usually the default, but keep in mind it must be nil
    (setq org-hide-leading-stars nil)
    ;; This line is necessary.
    (setq org-superstar-leading-bullet ?\s)
    ;; If you use Org Indent you also need to add this, otherwise the
    ;; above has no effect while Indent is enabled.
    (setq org-indent-mode-turns-on-hiding-stars nil)

  )

(use-package org-appear
  :ensure t
  :after org
  :hook (org-mode . org-appear-mode)
  :custom
    ;; allow to toggle links
    (org-appear-autolinks t)
    ;; allow to toggle subscripts and superscripts
    (org-appear-autosubmarkers t)
    ;; toggle Org entitites
    (org-appear-autoentities t)
    ;; toggle keywords in org-hidden-keywords
    (org-appear-autokeywords t)
    ;; if greater than 0, toggle with an idle delay
    (org-appear-delay 0.5)
  )
;; (add-hook 'org-mode-hook 'org-appear-mode)

(use-package org-ol-tree
  :commands org-ol-tree)

;; 设置任务流程(这是我的配置)
(setq org-todo-keywords
      '((sequence "TODO(t!)" "DOING(t!)" "WAIT(w!)" "|" "DONE(d!)" "CANCEL(a@/!)")))

;; 设置任务样式
(setq org-todo-keyword-faces
   '(("TODO" .   (:foreground "red" :weight bold))
    ("WAIT" .   (:foreground "red" :weight bold))
    ("DOING" .      (:foreground "orange" :weight bold))
    ("DONE" .      (:foreground "green" :weight bold))
    ("CANCEL" .     (:background "gray" :foreground "black"))
))

;; Collect all .org from my Org directory and subdirs
(load-library "find-lisp")
(setq org-agenda-files (find-lisp-find-files "~/dir/yulove/org/" "\.org$"))


(setq org-agenda-inhibit-startup t) ;; ~50x speedup
(setq org-agenda-span 'day)
(setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
(setq org-agenda-window-setup 'current-window)
(setq org-log-done t)



(provide 'init-org)
