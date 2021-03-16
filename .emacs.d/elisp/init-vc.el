;; Dired conf
(global-set-key (kbd "C-x j") 'dired-jump)

(use-package projectile
  :init
  (projectile-mode 1)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq-default projectile-keymap-prefix (kbd "C-c p"))
  (setq projectile-completion-system 'ivy)
  (defun projectile-magit-action ()
    "Switch to magit status action when invoking projectile."
    (magit-status-internal (projectile-project-root)))
  (setq projectile-switch-project-action 'projectile-magit-action)
  (global-set-key (kbd "C-S-o") 'projectile-switch-project))


(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package treemacs
  :defer t
  :ensure t
  :bind (("s-\\" . treemacs))
  )

(provide 'init-vc)
