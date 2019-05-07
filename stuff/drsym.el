;; Allows adding new symbols or strings and calling them later with a command. Saves the symbols over sessions.

;; Saving enabled in this file!
;; save location is ~/.emacs.d/drsymfile
;; Running:
;; M-x eval-buffer
;; M-x drsymTestHashMap
;; M-x drsym <RET> symbol_name  tab also works for autofill
;; M-x drsym-add asks a symbol name, symbol and adds that to use. If saving is enabled this also saves the current symbols in use.
;; M-x drsym-remove removes a symbol from use and saves.
;; M-x drsym-load loads saved settings if drsymfile exists.
;;There shouldn't be any effects that last over one emacs session currently. Only possible one is the creation of ~/.emasc.d/drsymfile.
;; drsymfile is defnitely not safe from code injection. But onlyone who should have access to it is you.


(defun drsymTestHashMap ()
  "A test version of the hashmap used.
Can be saved to file by running drsym-add and then loaded in next session with drsym-load."
   (setq drsymlist #s(hash-table
		     test equal
		     data ("lambdaL" "λ" "sizgmaU" "Σ" "gammaU" "Γ" "gammaL" "γ" "delatU" "Δ" "deltaL" "δ" "lamdaU" "Λ" "pii" "π" "rho" "ρ" "phiU" "Φ" "phiL" "φ" "epsilonL" "ε" "psiU" "Ψ" "psiL" "ψ" "omegaU" "Ω" "omegaL" "ω" "sigmaL" "σ" "thetaU" "Θ" "thetaL" "θ" "alpha" "α" "beta" "β" "idk" "¯\\_(ツ)_/¯" "dunno" "¯\\(°_o)/¯" "sqrt" "√" "integral" "∫" "therefore" "∴" "because" "∵" "neg" "¬" "square" "■" "inference" "⊢" "dot" "•" "forall" "∀" "exists" "∃" "in" "∈" "notin" "∉" "inR" "∋" "notinR" "∌" "pallo" "∘" "circle" "○" "emptyset" "∅" "union" "∪" "intersection" "∩" "lor" "∨" "land" "∧" "cartesian" "×" "lightning" "↯" "box" "□" "subset" "⊂" "subsetEq" "⊆" "subsetR" "⊃" "subsetEqR" "⊇" "infinity" "∞")
		     )))

(require 'subr-x) ;;needed for hash-table-keys
(defun drsym (k)
  "Asks the user for a name of a symbol and prints it to the cursor. 
With autofill"
  (interactive
   (list (completing-read
	  "Symbol to insert: "
	  (hash-table-keys drsymlist)
	  nil
	  t)
	 ))
  (insert (format "%s" (gethash k drsymlist))))

(defun drsym-add (name sym)
  "Add a new symbol that will be saved to a file at ~/.emacs.d/drsymfile"
  (interactive
   (list (completing-read
	  "Name for insert: "
	  nil
	  nil
	  nil)
	 (completing-read
	  "symbol(s) to insert: "
	  nil
	  nil
	  nil)))
  (progn (puthash name sym drsymlist)
	 (message "%s" drsymlist)
	 (with-temp-file "~/.emacs.d/drsymfile"
	   (prin1 (mystringifyH drsymlist) (current-buffer))
	   )))

;; concat
;; 		  "(setq drsymlist #s(hash-table
;; 		   test equal
;; 		   data ("



(defun combinelist (l1 l2)
  "Somewhat related to zip. takes two lists and makes a list where elements are interlocked."
  (if l1 (cons (car l1) (cons (car l2) (combinelist (cdr l1) (cdr l2))))
    '()))

(defun mystringifyH (s)
  "takes a hashmap and forms a list of keys and values"
  (let  ((k (hash-table-keys s))
	 (v (hash-table-values s)))
    (combinelist k v))
  )

(defun map (fun l)
  "takes fun and applies it to all elements in l"
  (if l
      (cons (funcall fun (car l)) (map fun (cdr l)))
    '()))

(defmacro mystringify (s)
  "macro form for the one below."
  (mystringify1 s))

(defun mystringify1 (s)
  "takes a function and escapes all double quotes on strings.
I ended not using this."
  (format "%s"
	  (map
	   ;;(lambda (x) (insert (string x)))
	   (lambda (myelm) (if myelm
			       (if (atom myelm)
				   (if (stringp myelm)
				       (format "\"%s\"" myeml)
				     myelm)
				 (mystringify1 myelm))
			     '()))
	   s)
	  ))


(defun drsym-load ()
  "Loads the saved key symbol pairs from file. Designed to be mainly run when emacs starts."
  (interactive)
  ;;(load "~/.emacs.d/drsymfile")
  (message "%s" (with-current-buffer
		    
		    (find-file-noselect "~/.emacs.d/drsymfile")
		  (setq values (read-from-string (save-restriction
						   (widen)
						   (buffer-substring-no-properties
						    (point-min)
						    (point-max)))))
		  ;;(format "%s" (car values))
		  (setq drsymlist (make-hash-table
		  		   :test 'equal))
		  (pieceTogether (car values))
		  ))
  )

(defun pieceTogether (l)
  "Adds all kwy symbol pairs from l to the drsymlist hashmap as side effects."
  (if l
      (let* ((k (car l))
	     (r (cdr l))
	     (v (car r))
	     (out (cdr r)))
	(puthash k v drsymlist)
	(pieceTogether out)
	)
    ))


(defun drsym-remove (k)
  "remove a symbol from the table of symbols and save."
  (interactive
   (list (completing-read
	  "Key to remove: "
	  (hash-table-keys drsymlist)
	  nil
	  t)
	 ))
  (progn (remhash k drsymlist)
	 (message "%s" drsymlist)
	 (with-temp-file "~/.emacs.d/drsymfile"
	   (prin1 (mystringifyH drsymlist) (current-buffer))
	   )))



