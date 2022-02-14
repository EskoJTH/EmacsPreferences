;; (use-package lsp-mode
;;   :ensure t
;;   :defer t
;;   :hook (lsp-mode . (lambda ()
;;                       (let ((lsp-keymap-prefix "m-s l"))
;;                         (lsp-enable-which-key-integration))))
;;   :init
;;   (setq lsp-keep-workspace-alive nil
;;         lsp-signature-doc-lines 5
;;         lsp-idle-delay 0.5
;;         lsp-prefer-capf t
;;         lsp-client-packages nil)
;;   :config
;;   (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(setq lsp-headerline-breadcrumb-enable nil)

(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (setq lsp-modeline-diagnostics-scope :workspace))

;;code actions ui-feedback
(setq lsp-modeline-code-actions-mode t)
(setq lsp-modeline-code-actions-segments '(count icon name))
;;(setq lsp-keymap-prefix '("M-l"))


(defun insert-haskell-type-at-point-lsp ()
    "function to insert type over point in scala"
    (interactive)

    (let ((contents (-some->> (lsp--text-document-position-params)
		      (lsp--make-request "textDocument/hover")
		      (lsp--send-request)
		      (lsp:hover-contents))))
	(progn
	  (previous-line)
	  (move-end-of-line nil)
	  (newline)
	  (insert (string-trim-right (lsp--render-on-hover-content contents t)))
	
      )
      )
    )



(add-hook 'haskell-mode-hook 'esko-types-haskell)
(add-hook 'haskell-mode-hook 'esko-wants-documentation)
;;(define-key lsp-keymap (kbd "C-å") #'lsp-ui-doc-glance)
;; toimii
(defun esko-types-haskell ()
  (define-key haskell-mode-map (kbd "C-t") 'insert-haskell-type-at-point-lsp)
  )
(defun esko-wants-documentation ()
  (interactive)
  (define-key haskell-mode-map (kbd "C-å") 'lsp-ui-doc-glance)
  (define-key haskell-mode-map (kbd "C-ä") 'flycheck-list-errors)
  )



