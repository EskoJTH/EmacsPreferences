;;When I start using this I have to have loaded:
;;cl-lib ?
;;intero
;;multiple-cursors
;;js2-mode
;;lots of clojure stuff

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://stable.melpa.org/packages/")))
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(require 'package)
(package-initialize)

;;where custom elisp files are
(add-to-list 'load-path "~/.emacs.d/stuff")

;; my own key setup always on top
(load "esko-keys.el")

;; My common settings
(load "esko-config.el")

;;multiple cursors
(package-install 'multiple-cursors)
(require 'multiple-cursors)

;; intero
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)

;;testifunktio
(defun drawmeaepsilon()
  (interactive)
  (insert "ε"))

;;testifunktio
(defun drawmealambda()
  (interactive)
  (insert "λ"))

;;hide show
(add-hook 'LaTeX-mode-hook
          (local-set-key (kbd "C-r") 'hs-toggle-hiding)
	    (local-set-key (kbd "C-S-r") 'hs-hide-all)
	    (local-set-key (kbd "C-M-r") 'hs-show-all))
;;hide show
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (intero multiple-cursors))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
