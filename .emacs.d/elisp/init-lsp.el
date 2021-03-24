(use-package company
  :ensure t
  :diminish company-mode
  :init
  (global-company-mode 1)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  (setq company-tooltip-align-annotations 1)
  (define-key company-mode-map [remap indent-for-tab-command] 'company-indent-or-complete-common)
  (dolist (backend '(company-eclim company-semantic company-dabbrev))
      (delq backend company-backends))
  )

(use-package flycheck
  :ensure t)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((typescript-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)


(provide 'init-lsp)
