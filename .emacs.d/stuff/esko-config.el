(setq-default frame-title-format "%b (%f)") ;; full path in title bar
(setq create-lockfiles nil) ;; No need for ~ files when editing
(setq inhibit-startup-message t) ;; Go straight to scratch buffer on startup
(load-theme 'wheatgrass t) ;; color to be right
(global-linum-mode t) ;; enable line numbers globally
;;(setq inhibit-startup-message t) ;; hide the startup message
(setq show-paren-delay 0) ;; no delay on showing pairing parenthesis
(show-paren-mode t) ;; show pairing parenthesis
(tool-bar-mode -1) ;; poistaa toolbarin kÃ¤ytÃ¶stÃ¤
(setq visible-bell 1) ;; hÃ¤vittÃ¤Ã¤ Ã¤Ã¤nikellon kai ehkÃ¤
(delete-selection-mode 1) ;; maalattuna alueen pÃ¤Ã¤lle voi suoraan kirjoittaa

