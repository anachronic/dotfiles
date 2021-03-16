;; init-ivy.el
;; Ivy, counsel, etc. You know the drill

(use-package ivy
  :diminish
  :init
  (ivy-mode 1)
  :config
  :config
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (counsel-git-grep . ivy--regex-plus)
          (counsel-ag . ivy--regex-plus)
          (counsel-rg . ivy--regex-plus)
          (t . ivy--regex-fuzzy)))
  (setq ivy-initial-inputs-alist
        '((counsel-M-x . "^")
          (man . "^")
          (woman . "^"))))

(use-package counsel
  :ensure t
  :demand
  :bind (("M-x" . counsel-M-x))
  )

;; I had a mix of stuff before. So it's nice to decide on
;; counsel-projectile after all. I don't even projectile that much,
;; but using counsel makes it way more consistent than it was before
(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :bind (("s-p" . 'counsel-projectile-find-file)
	 ("C-c a" . 'counsel-projectile-rg))
  :init
  (counsel-projectile-mode))

;; flx makes everything work better apparently
;; Not sure where to put it though
(use-package flx
  :ensure t)

;; smex makes counsel have order everything
(use-package smex
  :ensure t)

(provide 'init-ivy)
