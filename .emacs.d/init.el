;; First load paths from elisp and site-lisp
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "elisp/")))
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "site-lisp/")))

(require 'init-defaults)

(require 'init-ivy)

(require 'init-editor)

(require 'init-vc)

(require 'init-help)

(require 'init-shell)

(require 'init-ui)

;; This file is for internal emacs setup
(require 'init-dev)


;; Languages
(require 'init-lsp)
(require 'init-elisp)
(require 'init-typescript)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(exec-path-from-shell lsp-mode which-key typescript-mode typescript flx treemacs fullframe magit counsel projectile smex company company-mode crux paredit multiple-cursors undo-tree expand-region ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
