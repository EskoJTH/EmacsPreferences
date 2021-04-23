

(global-set-key (kbd "C-x C-a") 'executecommand)

(defun executecommand ()
  (interactive)
  (save-buffer)
  (shell-command "cd /home/esko/elmi && elm make src/Main.elm --output=main.js"))
