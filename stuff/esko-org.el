;;; org-mode related things

(define-key (current-global-map) (kbd "C-M-o") 'org-repeat-previous-source-block-without-content)


(defun org-previous-source-block-headers ()
  "Returns the previous source block's headers."
  (save-excursion
    (org-babel-previous-src-block)
    (let ((element (org-element-at-point)))
      (when (eq (car element) 'src-block)
        (let* ((content  (cadr element))
               (lang     (plist-get content :language))
               (switches (plist-get content :switches))
               (parms    (plist-get content :parameters)))
          (delq nil (list lang switches parms)))))))

(defun org-previous-source-block-headers-string ()
  "Returns the previous source block's headers as a string."
  (mapconcat #'identity
             (org-previous-source-block-headers)
              " "))

(defun org-previous-source-block-without-content ()
  "Returns the previous source block, except its contents."
  (format
   (concat "#+BEGIN_SRC %s\n"
           "\n"
           "#+END_SRC\n")
   (org-previous-source-block-headers-string)))

(defun org-repeat-previous-source-block-without-content ()
  "Inserts the previous source block, except the actual code in
the block, into the buffer."
  (interactive)
    (when-let (result (org-previous-source-block-without-content))
      (insert result)
      (previous-line 2)))
