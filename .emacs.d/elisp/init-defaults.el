;; First, set a decent UI for 2021
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)            ; Disable the menu bar

;; Then use a sensible garbage collection value
(setq gc-cons-threshold 20000000)

;; get rid of those pesky emacs temp files
(setq backup-directory-alist `((".*" . ,(expand-file-name (concat user-emacs-directory "tmp/backups")))))

;; The transform seems to be ok in macos. Prolly don't need to do anything
;;(setq auto-save-file-name-transforms '((".*" (concat user-emacs-directory "tmp/backups"))))

;; Set up the visible bell
(setq visible-bell t)

;; Avoid having to type 'yes'
(fset 'yes-or-no-p 'y-or-n-p)

;; Use Dank Mono
(set-face-attribute 'default nil :font "Dank Mono" :height 170)

;; Not sure about this one
(load-theme 'wombat)

;; Then, initialize packages
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(package-install 'diminish)

(require 'diminish)
(require 'use-package)

(diminish 'eldoc-mode)

(setq use-package-always-ensure t)

(provide 'init-defaults)
