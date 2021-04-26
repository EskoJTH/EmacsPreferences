(add-hook 'intero-mode-hook 'esko-intero)
(defun esko-intero ()
  (define-key intero-mode-map (kbd "<backtab>") 'haskell-move-nested-right)
  (define-key intero-mode-map (kbd "<backtab>") 'haskell-move-nested-right)
  (define-key intero-mode-map (kbd "<C-tab>") 'haskell-move-nested-left)
  (define-key intero-mode-map (kbd "C-t") 'asd)
  )



;; (setq ivy-use-virtual-buffers t)
;; (setq ivy-count-format "(%d/%d) ")

;; (global-set-key (kbd "C-s") 'swiper-isearch)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "M-y") 'counsel-yank-pop)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "<f2> j") 'counsel-set-variable)
;; (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;; (global-set-key (kbd "C-c v") 'ivy-push-view)
;; (global-set-key (kbd "C-c V") 'ivy-pop-view)



(defun my-babel-to-buffer ()
  "A function to efficiently feed babel code block result to a separate buffer"
  (interactive)
  (org-open-at-point)
  (org-babel-remove-result)
  
)

(defun my-org-mode-config ()
  "To use with `org-mode-hook'"
  (local-set-key (kbd "C-c h") 'my-babel-to-buffer)
)

(add-hook 'org-mode-hook 'my-org-mode-config)



(defun asd ()
  (interactive)
  (intero-type-at "INSERT"))

;; (defun remove-every-other ()
;;   (interactive)
;;   (if (not(= (point) (point-max)))
;;       (progn (kill-line)
;; 	     (next-line)
;; 	     (remove-every-other)))
;;   )


(defun remove-every-other ()
  (interactive)
  (while (null (progn (kill-line) (next-line)))))
      ;; (progn (kill-line)
      ;; 	     (next-line)))





(defun runStuff ()
  (interactive)
  (shell-command "cd /home/esko/demo/lmad1_workshop_Instanssi2020/eskoDemo && make example.debug.html && firefox example.debug.html")
  )




(defun arkki-down ()
  (interactive)
  (shell-command "rsync -vr /run/user/1000/740857fcc4adcf94/Kdeconnect_Storage/ /home/esko/")
  (find-file "/home/esko/arkki/arkki.org"))

(defun arkki-up ()
  (interactive)
  (shell-command "cp -rf /home/esko/arkki /run/user/1000/740857fcc4adcf94/Kdeconnect_Storage/"))

  

;; (defun type-to-begin ()
;;   (interactive)
;;   (intero-type-at "INSERT")
;;   (defvar type (format "-- %S" ))
;;   (backward-sentence)
;;   (prevuous-line)
;;   (insert type))

;; (defun funktion ()
;;   (interactive)
;;   (insert (format "%s" (intero-type-at))))

;; asdasdifNume  567567   1   -2 29




(defun ifNumber-remove-line ()
  (interactive)
  (if (< (string-to-number (substring-no-properties (car kill-ring))) 0)
    nil
    (progn
      (beginning-of-line)
      (kill-line))
    )
  )


(defun kaanna-latex ()
  (interactive)
  (shell-command "pdflatex -interaction batchmode kandi.tex")
  )


