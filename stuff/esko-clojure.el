;(eval-after-load 'flycheck '(flycheck-clojure-setup))

;(with-eval-after-load 'flycheck
;  (flycheck-pos-tip-mode))

(package-install 'paredit)
(require 'paredit)

;(package-install 'clojure-mode)
;(require 'clojure-mode)

(package-install 'cider)
(require 'cider)

;(package-install 'clojure-mode-extra-font-locking)
;(require 'clojure-mode-extra-font-locking)

(package-install 'projectile)
(require 'projectile)

(package-install 'rainbow-delimiters)
(require 'rainbow-delimiters)

;(package-install 'ido-completing-read+)
;(require 'ido-completing-read+)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; syntax hilighting for midje
;;(add-hook 'clojure-mode-hook
;;          (lambda ()
;;            (setq inferior-lisp-program "lein repl")
;;            (font-lock-add-keywords
;;             nil
;;             '(("(\\(facts?\\)"
;;                (1 font-lock-keyword-face))
;;               ("(\\(background?\\)"
;;                (1 font-lock-keyword-face))))
;;            (define-clojure-indent (fact 1))
;;            (define-clojure-indent (facts 1))))


;; provides minibuffer documentation for the code you're typing into the repl
;;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)



;; Use clojure mode for other extensions
;;(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
;;(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
;;(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
;;(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))


;;(defun cider-refresh ()
;;  (interactive)
;;  (cider-interactive-eval (format "(user/reset)")))

;;(defun cider-user-ns ()
;;  (interactive)
;;  (cider-repl-set-ns "user"))

;(eval-after-load 'cider
;  '(progn
;     (define-key clojure-mode-map (kbd "C-s C-v") 'cider-start-http-server)
;     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
;     (define-key clojure-mode-map (kbd "C-s u") 'cider-user-ns)
;     (define-key cider-mode-map (kbd "C-s u") 'cider-user-ns)
;     (define-key clojure-mode-map (kbd "C-s C-e") 'cider-load-buffer)))
