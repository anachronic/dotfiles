(windmove-default-keybindings 'control)

;; better ui
(use-package fullframe
  :ensure t
  :config
  (fullframe magit-status magit-mode-quit-window)
  (fullframe magit-status-internal magit-mode-quit-window)
  (fullframe ibuffer ibuffer-quit)
  (fullframe package-list-packages quit-window)
  (fullframe list-packages quit-window))

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (color-theme-sanityinc-tomorrow-night)
  )

(use-package spaceline
  :ensure t
  :init
  (spaceline-spacemacs-theme))

(provide 'init-ui)
