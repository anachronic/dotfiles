;; write lisp like a decent human being with paredit ;)
(use-package paredit
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  :config
  (define-key paredit-mode-map (kbd "C-<left>") nil)
  (define-key paredit-mode-map (kbd "C-<right>") nil)
  (define-key paredit-mode-map (kbd "C-<up>") nil)
  (define-key paredit-mode-map (kbd "C-<down>") nil)

  ;; make paredit work with delete-selection-mode
  ;; see http://whattheemacsd.com/setup-paredit.el-03.html
  (put 'paredit-forward-delete 'delete-selection 'supersede)
  (put 'paredit-backward-delete 'delete-selection 'supersede)
  (put 'paredit-open-round 'delete-selection t)
  (put 'paredit-open-square 'delete-selection t)
  (put 'paredit-doublequote 'delete-selection t)
  (put 'paredit-newline 'delete-selection t)
  )


(provide 'init-elisp)
