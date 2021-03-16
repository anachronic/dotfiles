;; jeez. executing anything with a correct PATH is still a pain in the ass
(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(provide 'init-shell)
