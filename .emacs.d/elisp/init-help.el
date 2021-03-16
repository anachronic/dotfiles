;; Help (mostly just describing key bindings)
(require 'help-fns+)

;; Add which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  :demand
  :diminish which-key-mode)


(provide 'init-help)
