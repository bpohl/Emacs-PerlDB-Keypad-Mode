;;; Emacs PerlDB Keypad Control
;;; $Id: 6607d711ce2bc86ddcdac27e99234faaa38bc983$
;;; $Revision: Sun Apr 12 09:54:50 2020 -0500 on branch Ubuntu$
;;; $Tags: v1.0.1$
;;;
;;; The Three Laws of Robotics
;;; 1. A robot may not injure a human being or, through inaction, 
;;;    allow a human being to come to harm.
;;; 2. A robot must obey orders given it by human beings except 
;;;    where such orders would conflict with the First Law.
;;; 3. A robot must protect its own existence as long as such 
;;;    protection does not conflict with the First or Second Law.
;;;                                                -- Isaac Asimov
;;;
;;; Buffer specific minor mode that takes control of the numeric
;;; keypad to navigate when using the Perl debugger in Emacs.
;;;
;;; It can be added to any buffer with 'M-x perldb-keypad-mode' or
;;; automatically by adding this, likely within a perl-mode-hook to
;;; the .emacs file:
;;;
;;;   (autoload 'perldb-keypad-mode "perldb-keypad-mode"
;;;     "Use keypad to navigate Perl debugger." t)
;;;   (add-hook 'perldb-mode-hook 'perldb-keypad-mode t)
;;;


;; Load gud so gud-def is available
(require 'gud)

;;;###autoload
(define-minor-mode perldb-keypad-mode
  "Use keypad to navigate Perl debugger."
  nil " PerlDB-KP" nil

  ;; A No-Op to quiet unset keys
  (defun unused-key () "Quietly undefined key" (interactive) '(nil))

  ;; The current gud.el(c) has the definition of gud-finish commented
  ;; out and the command to send wrong ('finish', not 'r')
  (if (not (fboundp 'gud-finish))
      (progn
        (message
         "Still having to define our own gud-finish in perldb-keypad-mode.")
        (gud-def gud-finish "r" "\C-f"
                 "Run current function until it returns.")))

  ;; Active keys
  (define-key (current-local-map) (kbd "<kp-insert>")   'gud-cont)   ;0/INS
  (define-key (current-local-map) (kbd "<kp-delete>")   'unused-key) ;./DEL
  (define-key (current-local-map) (kbd "<kp-end>")      'gud-finish) ;1/END
  (define-key (current-local-map) (kbd "<kp-down>")     'gud-next)   ;2/DN arw
  (define-key (current-local-map) (kbd "<kp-next>")     'gud-step)   ;3/PG DN

  ;; Let ENTER keep its meaning
  ;(define-key (current-local-map) (kbd "<kp-enter>")   'unused-key) ;ENTER

  ;; Available to use
  (define-key (current-local-map) (kbd "<kp-left>")     'unused-key) ;4
  (define-key (current-local-map) (kbd "<kp-begin>")    'unused-key) ;5
  (define-key (current-local-map) (kbd "<kp-right>")    'unused-key) ;6
  (define-key (current-local-map) (kbd "<kp-home>")     'unused-key) ;7
  (define-key (current-local-map) (kbd "<kp-up>")       'unused-key) ;8
  (define-key (current-local-map) (kbd "<kp-prior>")    'unused-key) ;9
  (define-key (current-local-map) (kbd "<kp-add>")      'unused-key) ;+
  (define-key (current-local-map) (kbd "<kp-divide>")   'unused-key) ;/
  (define-key (current-local-map) (kbd "<kp-multiply>") 'unused-key) ;*
  (define-key (current-local-map) (kbd "<kp-subtract>") 'unused-key) ;-
  )

(provide 'perldb-keypad-mode)

;;; perldb-keypad-mode.el ends here
