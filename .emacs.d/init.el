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
(require 'init-graphql)
(require 'init-docker)
(require 'init-yaml)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(package-selected-packages
   '(yaml-mode flycheck anzu spaceline graphql-mode color-theme-sanityinc-tomorrow company-flx diminish editorconfig exec-path-from-shell lsp-mode which-key typescript-mode typescript flx treemacs fullframe magit counsel projectile smex company company-mode crux paredit multiple-cursors undo-tree expand-region ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
