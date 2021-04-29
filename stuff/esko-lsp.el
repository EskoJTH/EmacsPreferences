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

(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (setq lsp-modeline-diagnostics-scope :workspace))

;;code actions ui-feedback
(setq lsp-modeline-code-actions-mode t)
(setq lsp-modeline-code-actions-segments '(count icon name))
;;(setq lsp-keymap-prefix '("M-l"))
