(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((typescript-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

;; I'm gonna move this here since it should pretty only use LSP
(use-package company
  :ensure t
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  (dolist (backend '(company-eclim company-semantic company-dabbrev))
      (delq backend company-backends))
  )

;; Will be trying company-flx for a while.
(use-package company-flx
  :ensure t
  :after flx
  :init
  (company-flx-mode +1)
  :config
  (setq company-flx-limit 75))



(provide 'init-lsp)
