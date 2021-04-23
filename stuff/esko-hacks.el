(add-hook 'intero-mode-hook 'esko-intero)
(defun esko-intero ()
  (define-key intero-mode-map (kbd "<backtab>") 'haskell-move-nested-right)
  (define-key intero-mode-map (kbd "<backtab>") 'haskell-move-nested-right)
  (define-key intero-mode-map (kbd "<C-tab>") 'haskell-move-nested-left)
  (define-key intero-mode-map (kbd "C-t") 'asd)
)


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


;; After some thinking. It seems to me that the problem with my code, was in that I defaulted to thinking that functions can't be used unless they are defined (in haskell this is absolutely necessary). My intero related functions get apparently defined once the major mode is activated. The only "problem" the program had was that in order to circumvent possible problems and get quickly working code I defined the function inside the other function so it would be perhaps only defined under the correct context. And that doesn't even matter at all for the program to work. Not all emacs users have elisp as their main language... How often does a casual user of emacs have to think about this anyway. Doesn't help the community to grow if all you do is intentionally build your ivory tovers higher and higher.


;; I guess you could use this to do rather interesting side effects. I do think your previous requirements for acceptable code are absolutely outrageous unless this channel is actually only allowed to people who have written elisp exclusively for at least a couple of years. There are also those who wish to use emacs without having elisp as their main programming language. This thing doesn't even matter at all for the programs execution and that was the main reason I had left it in there.


