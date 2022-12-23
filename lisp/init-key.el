

(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切


(use-package general
  :ensure t
  :init
  (with-eval-after-load 'evil
    (general-add-hook 'after-init-hook
                      (lambda (&rest _)
                        (when-let ((messages-buffer (get-buffer "*Messages*")))
                          (with-current-buffer messages-buffer
                            (evil-normalize-keymaps))))
                      nil
                      nil
                      t))


  (general-create-definer global-definer
    :keymaps 'override
    :states '(insert emacs normal hybrid motion visual operator)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (defmacro +general-global-menu! (name infix-key &rest body)
    "Create a definer named +general-global-NAME wrapping global-definer.
Create prefix map: +general-global-NAME. Prefix bindings in BODY with INFIX-KEY."
    (declare (indent 2))
    `(progn
       (general-create-definer ,(intern (concat "+general-global-" name))
         :wrapping global-definer
         :prefix-map ',(intern (concat "+general-global-" name "-map"))
         :infix ,infix-key
         :wk-full-keys nil
         "" '(:ignore t :which-key ,name))
       (,(intern (concat "+general-global-" name))
        ,@body)))

  (general-create-definer global-leader
    :keymaps 'override
    :states '(emacs normal hybrid motion visual operator)
    :prefix ","
    "" '(:ignore t :which-key (lambda (arg) `(,(cadr (split-string (car arg) " ")) . ,(replace-regexp-in-string "-mode$" "" (symbol-name major-mode)))))))



(use-package which-key
  :hook (after-init . which-key-mode)
  :ensure t
  :init
  (setq which-key-side-window-location 'bottom))


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)




(global-set-key (kbd "C-c a") 'org-agenda)
;; r aka remember
(global-set-key (kbd "C-c r") 'org-capture)




(use-package general
  :init
  (general-emacs-define-key 'global [remap imenu] 'consult-imenu)
  (general-emacs-define-key 'global [remap apropos] 'consult-apropos)
  (global-definer
    "!" 'shell-command
    ":" 'counsel-M-x
    "SPC" 'execute-extended-command
    "x" 'scratch-buffer
    "TAB" 'spacemacs/alternate-buffer
    "'" 'vertico-repeat
    "=" 'indent-buffer
    "u" 'universal-argument
    "v" 'er/expand-region
    ";" 'vterm
    "`" 'multi-vterm-project
   )


  (+general-global-menu! "buffer" "b"
    "d" 'kill-current-buffer
    "b" '(switch-to-buffer :which-key "switch buffer")
    "B" '(consult-buffer :which-key "consult buffer")
    "p" 'previous-buffer
    "R" 'rename-buffer
    "M" '((lambda () (interactive) (switch-to-buffer "*Messages*"))
          :which-key "messages-buffer")
    "n" 'next-buffer
    "i" 'ibuffer
    "f" 'my-open-current-directory
    "k" 'kill-buffer
    "y" 'copy-buffer-name
    "K" 'kill-other-buffers
    )

  (+general-global-menu! "layout" "l"

    "l" 'avy-goto-line
    "c" 'avy-goto-char

    "l" 'persp-switch
    "L" 'persp-state-load
    "TAB" 'persp-switch-last
    "A" 'persp-add-buffer
    "s" 'persp-state-save
    "b" 'persp-switch-to-buffer
    "R" 'persp-remove-buffer
    "k" 'persp-kill)

  (+general-global-menu! "file" "f"
    "f" 'find-file
    "r" 'consult-recent-file
    "L" 'consult-locate
    "d" 'consult-dir
    "ed" 'open-my-init-file
    "s" 'save-buffer
    "w" 'sudo-edit
    "S" 'save-some-buffers
    "j"  'dired-jump
    "y" 'copy-file-name
    "R" 'my/rename-current-buffer-file
    "k" 'my/delete-file-and-buffer
    "!" 'my/exec-shell-on-buffer)

  (+general-global-menu! "window" "w"
    "0" 'select-window-0
    "1" 'select-window-1
    "2" 'select-window-2
    "3" 'select-window-3
    "4" 'select-window-4
    "5" 'select-window-5
    "/" 'split-window-right
    "-" 'split-window-below
    "m" 'delete-other-windows
    "u" 'winner-undo
    "z" 'winner-redo
    "w" 'esw/select-window
    "s" 'esw/swap-two-windows
    "d" 'esw/delete-window
    "=" 'balance-windows-area
    "r" 'esw/move-window
    "x" 'resize-window
    "H" 'buf-move-left
    "L" 'buf-move-right
    "J" 'buf-move-down
    "K" 'buf-move-up)

  (+general-global-menu! "toggle" "t"

    "s" 'flycheck-mode
    "S" 'flyspell-prog-mode
    "e" 'toggle-corfu-english-helper
    "n" 'my-toggle-line-numbber
    "w" 'distraction-free
    "l" 'my/enable-lsp-bridge
    "k" '+toggle-keycast
    "c" 'global-corfu-mode
    "m" 'consult-minor-mode-menu)

  (+general-global-menu! "toggle" "T"

    "t"  'treemacs
    "p"  'treemacs-projectile
    "r"  'treemacs-remove-project-from-workspace
    "a"  'treemacs-add-project)


  (+general-global-menu! "project" "p"

    "f"  'counsel-projectile-find-file
    "p"  'counsel-projectile-switch-project
    "s"  'counsel-projectile-ag
    "a"  'projectile-add-known-project
    "d"  'projectile-remove-known-project

    "r" 'consult-recent-file
    "D" 'project-dired
    "b" 'consult-project-buffer
    "e" 'project-eshell
    "c" 'project-compile
    "x" 'project-forget-project)

  )


(provide 'init-key)