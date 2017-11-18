
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (## company-tern ag xref-js2 js2-refactor js2-mode indium nlinum multiple-cursors intero cl-lib-highlight)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 90 :width normal)))))

;;When I start using this I have to have loaded:
;;cl-lib
;;intero
;;multiple-cursors
;;js2-mode

;;Be sure that those extra libraries in the beginning can be found



(load-theme 'wheatgrass t)

;;js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(require 'js2-refactor)
(require 'xref-js2)


(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))


;;(require 'company)
;;(require 'company-mode)
;;(require 'company-tern)
;;(add-to-list 'company-backends 'company-tern)
;;(add-hook 'js2-mode-hook (lambda ()
;;                           (tern-mode)
;;                           (company-mode)))
                           
;; Disable completion keybindings, as we use xref-js2 instead
;;(define-key tern-mode-keymap (kbd "M-.") nil)
;;(define-key tern-mode-keymap (kbd "M-,") nil)
;;js2-mode

;; indium
(unless (package-installed-p 'indium)
  (package-install 'indium))
;; indium



;;multiple cursors
(require 'multiple-cursors)
;;multiple cursors

;;poistaa toolbarin käytöstä
(tool-bar-mode -1)
;;hävittää äänikellon kai ehkä
(setq visible-bell 1)
;;maalatuna alueen päälle voi suoraan kirjoittaa
(delete-selection-mode 1)
;;Windows keyboard 



;;Hotkey Related Functions
;(defun mySearch()
;  (interactive)
;  (isearch-forward (buffer-substring (region-beginning) (region-end))));;doesn't work

(defun myControlAll()
  (interactive)
  (beginning-of-buffer nil)
  (set-mark-command nil)
  (end-of-buffer nil)
  (setq deactivate-mark nil))

;;testifunktio 
(defun myFunction()
  (interactive)
  (insert "Hello World!!!"))
;;testifunktio

(defun deduction()
  (interactive)
  (insert "⊢"))

(defun epsilon()
  (interactive)
  (insert "ε"))

(defun drawLambda()
  (interactive)
  (insert "λ"))


;;minor mode omilla nappuloille.
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;;Hotkeys
    ;;(global-set-key (kbd "M-a") 'backward-char)
    (define-key map (kbd "M-4") 'split-window-right)
    (define-key map (kbd "M-3") 'split-window-below)
    (define-key map (kbd "M-2") 'delete-other-windows)
    (define-key map (kbd "M-1") 'delete-window)

    (define-key map (kbd "M-x") 'execute-extended-command)
    (define-key map (kbd "C-b") 'switch-to-buffer)
    (define-key map (kbd "C-o") 'find-file)
    (define-key map (kbd "C-s") ctl-x-map)
    (define-key map (kbd "C-s a") 'write-file)

    ;;(glo bal-set-key (kbd "C-s s") 'save-buffer)
    ;;(define-key map (kbd "C-s a") 'write-file map)
    ;;Custom Emacs

    ;;Custom keyboard
    (define-key map (kbd "M-d") 'forward-char)
    (define-key map (kbd "M-a") 'backward-char)
    (define-key map (kbd "M-s") 'next-line)
    (define-key map (kbd "M-w") 'previous-line)
    
    (define-key map (kbd "M-l") 'forward-char)
    (define-key map (kbd "M-j") 'backward-char)
    (define-key map (kbd "M-k") 'next-line)
    (define-key map (kbd "M-i") 'previous-line)
    
    (define-key map (kbd "M-C-d") 'forward-word)
    (define-key map (kbd "M-C-a") 'backward-word)
    (define-key map (kbd "M-C-s") 'next-line)
    (define-key map (kbd "M-C-w") 'previous-line)
    
    (define-key map (kbd "M-C-l") 'forward-word)
    (define-key map (kbd "M-C-j") 'backward-word)
    (define-key map (kbd "M-C-k") 'next-line)
    (define-key map (kbd "M-C-i") 'previous-line)
    
    (define-key map (kbd "M-q") 'move-beginning-of-line)
    (define-key map (kbd "M-e") 'move-end-of-line)

    (define-key map (kbd "M-C-c") 'backward-kill-word)
    (define-key map (kbd "M-c") 'delete-backward-char)
    (define-key map (kbd "M-v") 'delete-char)
    ;;Custom keyboard
    
    ;;Windows keyboard
;;;Absolutely necessary
    (define-key map (kbd "C-z") 'undo)
    (define-key map (kbd "C-x") 'kill-region)
    (define-key map (kbd "C-c") 'kill-ring-save)
    (define-key map (kbd "C-e") 'eval-last-sexp)
    (define-key map (kbd "C-v") 'yank)
    (define-key map (kbd "C-a") 'myControlAll)
;;;Absolutely necessary
    
    ;;TODO tee oma parempi searchi kun osaat
    ;; pistä tämä toimimaan: (global-set-key (kbd "C-w") 'isearch-repeat-backward)
    (define-key map (kbd "C-f") 'isearch-forward)
    (define-key map (kbd "C-M-f") 'isearch-backward)

    ;;Multiple Cursor
    (define-key map (kbd "M-<") 'mc/mark-next-like-this)
    (define-key map (kbd "M->") 'mc/mark-more-like-this-extended)
    (define-key map (kbd "M-z") 'mc/mark-all-like-this)
    ;;Multiple Cursor)
    map)
  "My own key map")
    

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)

(add-hook 'after-load-functions 'my-keys-have-priority)

(defun my-keys-have-priority (_file)
  "Try to ensure that my keybindings retain priority over other minor modes.

Called via the `after-load-functions' special hook."
  (unless (eq (caar minor-mode-map-alist) 'my-keys-minor-mode)
    (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
      (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
      (add-to-list 'minor-mode-map-alist mykeys))))
;;minor mode omilla nappuloille.


;;hide show
(add-hook 'LaTeX-mode-hook
          (local-set-key (kbd "M-n") 'hs-toggle-hiding)
	    (local-set-key (kbd "C-M-n") 'hs-hide-all)
	    (local-set-key (kbd "C-M-m") 'hs-show-all))
;;hide show
