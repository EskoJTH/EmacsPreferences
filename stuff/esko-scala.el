;; (require 'package)

;; ;; Add melpa to your packages repositories
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; (package-initialize)

;; ;; Install use-package if not already installed
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (require 'use-package)

;; ;; Enable defer and ensure by default for use-package
;; ;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
;; (setq use-package-always-defer t
;;       use-package-always-ensure t
;;       backup-directory-alist `((".*" . ,temporary-file-directory))
;;       auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;; Enable scala-mode for highlighting, indentation and motion commands
(use-package scala-mode
  :interpreter
    ("scala" . scala-mode))

;; ;; Enable sbt mode for executing sbt commands
;; (use-package sbt-mode
;;   :commands sbt-start sbt-command
;;   :config
;;   ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
;;   ;; allows using SPACE when in the minibuffer
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-command
;;    minibuffer-local-completion-map)
;;    ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
;;    (setq sbt:program-options '("-Dsbt.supershell=false"))
;; )

;; ;; Enable nice rendering of diagnostics like compile errors.
;; (use-package flycheck
;;   :init (global-flycheck-mode))


(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook  (scala-mode . lsp)
         (lsp-mode . lsp-lens-mode)
  :config
  ;; Uncomment following section if you would like to tune lsp-mode performance according to
  ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
  ;;       (setq gc-cons-threshold 100000000) ;; 100mb
  ;;       (setq read-process-output-max (* 1024 1024)) ;; 1mb
  ;;       (setq lsp-idle-delay 0.500)
  ;;       (setq lsp-log-io nil)
  ;;       (setq lsp-completion-provider :capf)
  (setq lsp-prefer-flymake nil))

;; Add metals backend for lsp-mode
(use-package lsp-metals
  ) ;;:config (setq lsp-metals-treeview-show-when-views-received t))

;; Enable nice rendering of documentation on hover
;;   Warning: on some systems this package can reduce your emacs responsiveness significally. 
;;   (See: https://emacs-lsp.github.io/lsp-mode/page/performance/)
;;   In that case you have to not only disable this but also remove from the packages since
;;   lsp-mode can activate it automatically.
(use-package lsp-ui)


;; ;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; ;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;; ;;   to avoid odd behavior with snippets and indentation
;; (use-package yasnippet)


;; Add company-lsp backend for metals.
;;   (depending on your lsp-mode version it may be outdated see:
;;    https://github.com/emacs-lsp/lsp-mode/pull/1983)
;(use-package company-lsp)

;; Use the Debug Adapter Protocol for running tests and debugging
;; (use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  ;;)
;; (use-package dap-mode
;;   :hook
;;   (lsp-mode . dap-mode)
;;   (lsp-mode . dap-ui-mode)
;;   )

;; (require 'package)

;; ;; Add melpa to your packages repositories
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; (package-initialize)

;; ;; Install use-package if not already installed
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (require 'use-package)

;; ;; Enable defer and ensure by default for use-package
;; ;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
;; (setq use-package-always-defer t
;;       use-package-always-ensure t
;;       backup-directory-alist `((".*" . ,temporary-file-directory))
;;       auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; ;; Enable scala-mode for highlighting, indentation and motion commands
;; (use-package scala-mode
;;   :mode "\\.s\\(cala\\|bt\\)$")

;; ;; Enable sbt mode for executing sbt commands
;; (use-package sbt-mode
;;   :commands sbt-start sbt-command
;;   :config
;;   ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
;;   ;; allows using SPACE when in the minibuffer
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-command
;;    minibuffer-local-completion-map)
;;    ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
;;    (setq sbt:program-options '("-Dsbt.supershell=false"))
;; )

;; ;; Enable nice rendering of diagnostics like compile errors.
;; (use-package flycheck
;;   :init (global-flycheck-mode))

;; (use-package lsp-mode
;;   ;; Optional - enable lsp-mode automatically in scala files
;;   :hook  (scala-mode . lsp)
;;          (lsp-mode . lsp-lens-mode)
;;   :config (setq lsp-prefer-flymake nil))

;; ;; Enable nice rendering of documentation on hover
;; (use-package lsp-ui)

;; ;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; ;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;; ;;   to avoid odd behavior with snippets and indentation
;; (use-package yasnippet)

;; ;; Add company-lsp backend for metals
;; (use-package company-lsp)

;; ;; Use the Debug Adapter Protocol for running tests and debugging
;; (use-package posframe
;;   ;; Posframe is a pop-up tool that must be manually installed for dap-mode
;;   )
;; (use-package dap-mode
;;   :hook
;;   (lsp-mode . dap-mode)
;;   (lsp-mode . dap-ui-mode)
;;   )

;; ;; Use the Tree View Protocol for viewing the project structure and triggering compilation
;; (use-package lsp-treemacs
;;   :config

;;   (setq lsp-metals-treeview-show-when-views-received t)
;;   )

;; (insert (string-trim-right (lsp--render-on-hover-content contents t)))
(defun insert-scala-type-at-point-lsp-metals ()
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

(add-hook 'scala-mode-hook 'esko-scala)
(defun esko-scala ()
  (define-key scala-mode-map (kbd "C-t") 'insert-scala-type-at-point-lsp-metals)
  (define-key scala-mode-map (kbd "C-M-å") 'insert-scala-type-at-point-lsp-metals)
  
  )
