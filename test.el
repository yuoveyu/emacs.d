  (defun hello()
  "test defun"
  (message "hello world")
  )

(hello)


(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name: ")))
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (insert (format "Hello %s!\n\nI am %s." your-name from-name))
    (other-window 1)))

(greeting "yu")

(setq list-of-names '("Sarah" "Chloe" "Mathilde"))
(car list-of-names)
(cdr list-of-names)
(push "gao" list-of-names)

(defun replace-hello-by-bonjour ()
    (switch-to-buffer-other-window "*test*")
    (goto-char (point-min))
    (while (search-forward "Hello" nil t)
      (replace-match "Bonjour"))
    (other-window 1))

(replace-hello-by-bonjour)


(defun boldify-names ()
    (switch-to-buffer-other-window "*test*")
    (goto-char (point-min))
    (while (re-search-forward "Bonjour \\(.+\\)!" nil t)
      (add-text-properties (match-beginning 1)
                           (match-end 1)
                           (list 'face 'bold)))
    (other-window 1))

(boldify-names)
