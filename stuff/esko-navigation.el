(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))) ;; scroll amount

;;(scroll-preserve-screen-position t)
;;(setq scroll-margin 5)
(setq next-screen-context-lines 15)


(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")


;;(global-set-key (kbd "C-å") 'helm-find-files)


(global-set-key (kbd "C-c C-s") 'swiper-isearch)
(global-set-key (kbd "C-c sC-r") 'swiper-isearch-backward)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-r") 'ivy-reverse-i-search)
(global-set-key (kbd "C-'") 'ivy-avy)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-å") 'ivy-insert-current) ;; C-i == tab
(global-set-key (kbd "C-å") 'ivy-resume) ;; C-i == tab
;;(global-set-key (kbd "C-å") 'ivy-resume)
;;
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "C-x f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)




;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
;(setq recentf-save-file (concat user-emacs-directory ".recentf"))
;(require 'recentf)
;(recentf-mode 1)
;(setq recentf-max-menu-items 40)
;;not working

;; ido-mode allows you to more easily navigate choices. For example,
;; when you want to switch buffers, ido presents you with a list
;; of buffers in the the mini-buffer. As you start to type a buffer's
;; name, ido will narrow down the list of buffers to match the text
;; you've typed in
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(ido-mode t)
;;(ido-vertical-mode nil)
;;(setq ido-use-virtual-buffers nil)

(define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil)

(setq ido-auto-merge-work-directories-length -1)
;;dont't jump to some other directory when I mistype a filename

(setq ido-default-buffer-method 'selected-window)
;;With emacs daemon don't jumpt to buffer open in other emacs

;; Includes buffer names of recently open files, even if they're not
;; open now

;; Shows a list of buffers
;;(global-set-key (kbd "C-x C-b") 'ibuffer)

