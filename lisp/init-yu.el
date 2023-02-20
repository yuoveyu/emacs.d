;;; init-yu.el --- yu config -*- lexical-binding: t -*-
;;; Commentary:

;;; This file org the configuration

;;; Code:
(defun open-org-key()
  (interactive)
  (find-file "/opt/dir/yuorg/code/soft/key/org-key.md"))


(defun open-tmux-key()
  (interactive)
  (find-file "/opt/dir/yuorg/code/soft/key/tmux-key.md"))
(defun open-chrome-key()
  (interactive)
  (find-file "/opt/dir/yuorg/code/soft/key/chrome-key.md"))


(defun open-org-inbox()
  (interactive)
  (find-file "/opt/dir/yuorg/org/inbox.org"))

(defun open-org-todo()
  (interactive)
  (find-file "/opt/dir/yuorg/org/todo.org"))
(defun open-org-todo-often()
  (interactive)
  (find-file "/opt/dir/yuorg/org/todo-often.org"))
(defun open-org-todo-back()
  (interactive)
  (find-file "/opt/dir/yuorg/org/todo.org_archive"))
(defun open-org-finsh()
  (interactive)
  (find-file "/opt/dir/yuorg/org/finished.org"))
(provide 'init-yu)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-yu.el ends here
