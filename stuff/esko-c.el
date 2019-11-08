(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)


(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

;;.dir-locals.el file needed.
;;example content:
;;((nil . (("-Ipath1/asdta", company-clang-arguments . ( "-I/home/OmatProjektit/BatteryMon/")))))

(add-to-list 'company-backends 'company-c-headers)
;;paths to header files need to be also added as follows.
;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
;;locals to .dir-locals files wiht company-c-headers-path-user

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
;;(semantic-add-system-include "~/linux/kernel") to add new paths
(semantic-mode 1)

