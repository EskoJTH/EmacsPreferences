(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-ini-mode t)
 '(ergoemacs-keyboard-layout "us")
 '(ergoemacs-mode nil)
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-theme "standard")
 '(ergoemacs-theme-options nil)
 '(ergoemacs-use-menus t)
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.
")
 '(scroll-error-top-bottom nil)
 '(set-mark-command-repeat-pop nil)
 '(shift-select-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(package-initialize)
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)

;(autoload 'wcheck-mode "wcheck-mode"
 ; "Toggle wcheck-mode." t)
;(autoload 'wcheck-change-language "wcheck-mode"
;  "Switch wcheck-mode languages." t)
;(autoload 'wcheck-actions "wcheck-mode"
;  "Open actions menu." t)
;(autoload 'wcheck-jump-forward "wcheck-mode"
;  "Move point forward to next marked text area." t)
;(autoload 'wcheck-jump-backward "wcheck-mode"
;  "Move point backward to previous marked text area." t)

(setq ispell-program-name "C:\Devel\Tools\hunspell_UNO_1.1.2_OOo_2.0_Windows/hunspell680mi.dll")
;; "en_US" is key to lookup in `ispell-local-dictionary-alist`, please note it will be passed to hunspell CLI as "-d" parameter
(setq ispell-local-dictionary "english") 
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))

(add-to-list 'exec-path "C:\Devel\Tools\ispell\ispell\bin")
(setq ispell-program-name "ispell")
(setq ispell-personal-dictionary "C:\Devel\Tools\ispell\ispell\.ispell")
(require 'ispell)


(defun myFunction()
  ;testifunktio
  (interactive)
  (insert "Hello World!!!")
  )

;;hävittää äänikellon kai ehkä
(setq visible-bell 1)

					;Σ√∊⊆∅

(defun sigma()
  (interactive)
  (insert "Σ"))

(defun kuuluu()
  (interactive)
  (insert "∊"))

(defun osajoukko()
  (interactive)
  (insert "⊆"))

(defun tyhjamerkki()
  (interactive)
  (insert "∅"))

(defun epsilon()
  (interactive)
  (insert "ε"))

(defun neliojuuri()
  (interactive)
  (insert-char 8730))

					;Σ√∊⊆∅
