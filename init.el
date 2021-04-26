
(find-file "/home/esko/orkki.org")

(setq use-dialog-box nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))


(require 'package)
(package-initialize)


;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(cider-eldoc-display-context-dependent-info t)
; '(cider-font-lock-dynamically (quote (macro function var deprecated core)))
; '(cider-overlays-use-font-lock nil)
; '(cider-result-use-clojure-font-lock t)
; '(minimap-highlight-line nil)
; '(minimap-minimum-width 20)
; '(minimap-mode t)
; '(minimap-tag-only nil)
; '(minimap-update-delay 0)
; '(minimap-window-location (quote right))
; '(package-selected-packages (quote (cider rainbow-delimiters intero multiple-cursors))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-button-mouse ((t (:background "DarkOrchid2" :foreground "black" :box (:line-width 2 :style released-button)))))
 '(custom-button-pressed ((t (:background "magenta" :foreground "DarkOrchid4" :box (:line-width 2 :style pressed-button)))))
 '(mode-line ((t (:background "SlateBlue4" :foreground "cyan" :box (:line-width -1 :style released-button)))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#54F"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#90F"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#0BF"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#FF3"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#F4F"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#F80"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#0Fa"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "yellow3"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "purple3"))))
 '(region ((t (:background "#402050" :foreground "#e0f0ff")))))


(set-face-attribute 'default nil :height 120)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-clang-executable "/usr/bin/clang-8")
 '(highlight-symbol-colors
   (quote
    ("dark magenta" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab")))
 '(highlight-symbol-foreground-color "cyan")
 '(org-babel-load-languages
   (quote
    ((python . t)
     (shell . t)
     (emacs-lisp . t)
     (haskell . t)
     (http . t))))
 '(org-confirm-babel-evaluate nil)
 '(package-selected-packages
   (quote
    (lsp-ui lsp-mode lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode counsel swiper ivy yasnippet sbt-mode use-package sudo-edit cql-mode ob-http restclient helm-tramp docker-tramp sublimity org cider scala-mode gnu-elpa-keyring-update chess minimap company-c-headers clang-format sr-speedbar function-args ggtags intero flymake-rust rust-mode highlight-symbol dumb-jump syntax-subword magit ## rainbow-delimiters multiple-cursors)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/home/OmatProjektit/BatteryMon/")))))





;; (setq lsp-haskell-process-path-hie "hie-wrapper")

(setq vc-follow-symlinks t)

(find-file "/home/esko/orkki.org")
(find-file "/home/esko/Arkki/arkki.org")

;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-to-list 'eglot-server-programs '(haskell-mode . ("ghcide" "--lsp"))))


;(add-to-list 'package-archives
;             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;;(prefer-coding-system 'utf-8)
;;(set-default-coding-systems 'utf-8)
;;(set-language-environment 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(set-language-environment "UTF-8")

;;(server-start)

;; (require 'calfw)
;; (require 'calfw-ical)
;; (cfw:open-ical-calendar "https://calendar.google.com/calendar/ical/esekkiiii%40gmail.com/public/basic.ics")


;; One of these I quess for haskell
;; (require 'lsp)
;; (require 'lsp-haskell)
;; OR
;; (add-hook 'haskell-mode-hook #'lsp)

;;multiple cursors
(package-install 'multiple-cursors)
(package-initialize)
(require 'multiple-cursors)
;;(list-colors-display)


;;(require 'cc-mode)



(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;where custom elisp files are
(add-to-list 'load-path "~/.emacs.d/stuff")



(load "ob-http/ob-http.el")

;; my own key setup always on top
(load "esko-keys.el")

;; Quick and so dirty hacks
(load "esko-hacks.el")

;; My common settings
(load "esko-config.el")

;; Font settings
(load "esko-font.el")

;; c settings
(load "esko-c.el")

;; general navigation settings .ie ivy
(load "esko-navigation.el")


(load "drsym.el")
(drsym-load)

(load "esko-scala.el")

;; this shit does not work at all???
;; (load "esko-lsp.el")




;;(package-install 'syntax-subword)
;;(require 'syntax-subword)
;;(global-syntax-subword-mode)

;;(setq tramp-verbose 9)
;;(prefer-coding-system 'utf-8-unix)

;; For tramp with my bash config, the prompt of which terminates
;; in a newline. Tell tramp how to detect the end of my prompt.
;;(setq shell-prompt-pattern "((.*\n)*((\└\─\[\d\] \<\> )|(\╰\─\$ \\[\?2004h)|(\╰\─\$ )))")

;;use bash when connecting to remotes using tramp:
;;(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
;;not working?

;;(load "esko-clojure.el")



;(package-install 'magit)
;(require 'magit)

;;(eval-after-load 'flycheck '(flycheck-clojure-setup))

;;(with-eval-after-load 'flycheck
;;  (flycheck-pos-tip-mode))

;;(with-eval-after-load 'flycheck
;;  (flycheck-pos-tip-mode))

;;(evl-after-load 'flycheck '(flycheck-clojure-setup))
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;(eval-after-load 'flycheck
;;  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

;;(package-install ' cider)
;;(require 'cider)

;; intero
;;(package-install 'intero)
;;(add-hook 'haskell-mode-hook 'intero-mode)


;; (defun drawmea-epsilon()
;;   (interactive)
;;   (insert "ε"))

;; (defun drawmea-lambda()
;;   (interactive)
;;   (insert "λ"))

;; (defun drawmea-s-zigma()
;;   (interactive)
;;   (insert "σ"))

;; (defun drawmea-bottom()
;;   (interactive)
;;   (insert "⊥"))

;; (defun drawmea-empty()
;;   (interactive)
;;   (insert "∅"))

;; (defun drawmea-alpha()
;;   (interactive)
;;   (insert "α"))

;; (defun drawmea-beeta()
;;   (interactive)
;;   (insert "β"))

;;hide show
;;(add-hook 'hs-minor-mode 'setHSkeys())

(defun setHSkeys()
          (global-set-key (kbd "C-r") 'hs-toggle-hiding)
;	  (local-set-key (kbd "C-M-r") 'drawmeaepsilon)
	  (global-set-key (kbd "C-S-r") 'hs-hide-all))

   ;; (progn
   ;;  (mapc
   ;;   (lambda (x) (add-to-list 'face-remapping-alist x))
   ;;   '((agda2-highlight-datatype-face              . font-lock-type-face)
   ;;     (agda2-highlight-function-face              . font-lock-type-face)
   ;;     (agda2-highlight-inductive-constructor-face . font-lock-function-name-face)
   ;;     (agda2-highlight-keyword-face               . font-lock-keyword-face)
   ;;     (agda2-highlight-module-face                . font-lock-constant-face)
   ;;     (agda2-highlight-number-face                . nil)
   ;;     (agda2-highlight-postulate-face             . font-lock-type-face)
   ;;     (agda2-highlight-primitive-type-face        . font-lock-type-face)
   ;;     (agda2-highlight-record-face                . font-lock-type-face))))





(set-background-color "#170920")


(load-file (let ((coding-system-for-read 'utf-8))
                 (shell-command-to-string "agda-mode locate")))



;; (require 'sublimity)
;; (require 'sublimity-scroll)
;; (sublimity-mode 1)

;; (setq sublimity-scroll-weight 1
;;       sublimity-scroll-drift-length 1)



(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (haskell . t)
   (http . t)))
