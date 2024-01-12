
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))) ;; scroll amount
(setq mouse-wheel-progressive-speed t) ;;nil)
(setq jit-lock-defer-time 0.15)
(setq mouse-wheel-follow-mouse 't)
;;(global-auto-revert-mode t)

(menu-bar-mode -1);; Turn off the menu bar at the top
(setq-default frame-title-format "%b (%f)") ;; full path in title bar
(setq create-lockfiles nil) ;; No need for ~ files when editing
(setq inhibit-startup-message t) ;; Go straight to scratch buffer on startup
(load-theme 'wheatgrass t) ;; colors to be right
(global-linum-mode t) ;; enable line numbers globally
(setq show-paren-delay 0) ;; no delay on showing pairing parenthesis
(show-paren-mode t) ;; show pairing parenthesis
(tool-bar-mode -1) ;; poistaa toolbarin kÃ¤ytÃ¶stÃ¤ Tämä vekotin on kuin kamalalta kivikaudelta.
(setq visible-bell 1) ;; hÃ¤vittÃ¤Ã¤ Ã¤Ã¤nikellon kai ehkÃ¤
(delete-selection-mode 1) ;; maalattuna alueen pÃ¤Ã¤lle voi suoraan kirjoittaa

;;quickert tips
(setq tooltip-delay 0.2)
(setq tooltip-hide-delay 3000)

;; Highlight current line
(global-hl-line-mode 1)
(set-face-foreground 'highlight nil)
(set-face-background hl-line-face "gray10")

(setq isearch-allow-scroll  t)
(setq hlt-auto-faces-flag t)


;; Don't show native OS scroll bars for buffers because they're redundant
;;(when (fboundp 'scroll-bar-mode)
;;  (scroll-bar-mode -1))

;; yay rainbows!
(package-install 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

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



;; (require 'sublimity-map) ;; experimental
;; (require 'sublimity-attractive)


