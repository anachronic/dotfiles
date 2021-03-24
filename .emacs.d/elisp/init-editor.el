;; I'm gonna go ahead and set up my old editor fonts here
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;; Undo-Tree for real undo/redo commands
;; Also required by evil
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode 1)
  :bind (("C-/" . nil)
	 ("C-z" . undo-tree-undo)
	 ("s-Z" . undo-tree-redo)
	 ("s-z" . undo-tree-undo))
  )

;; autopairs always a must for me
(electric-pair-mode)

;; Pending delete mode.
(delete-selection-mode 1)

;; hl line
(global-hl-line-mode 1)

;; display line numbers
(global-display-line-numbers-mode 1)

;; No dired. Instead use it for multiple cursors
(global-unset-key (kbd "s-D"))

;; Might need to change this
(use-package multiple-cursors
  :ensure t
  :bind
  (("s-d"         . mc/mark-next-like-this)
   ("s-D"         . mc/mark-previous-like-this)
   ("C-c C-<"     . mc/mark-all-like-this)
   ("C-S-c C-S-c" . mc/edit-lines)))

;; WLR is really a must. Can't do without this
(use-package whole-line-or-region
  :ensure t
  :diminish whole-line-or-region-local-mode
  :bind (("s-S-<backspace>" . whole-line-or-region-kill-region)
	 ("s-c" . whole-line-or-region-kill-ring-save))
  :init
  (add-hook 'after-init-hook 'whole-line-or-region-global-mode)
  )

;; Handling annoying buffers
(global-set-key (kbd "C-q") 'bury-buffer)
(global-set-key (kbd "C-c C-k") 'kill-this-buffer)

;; Author's URL: http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
;; With this we can remap M-m to something else. We'll see
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Fix macos navigation keys
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "s-<backspace>") 'crux-kill-line-backwards)

;; Rather have crux define the functions than have to write them myself
(use-package crux
  :ensure t
  :bind (("s-S-<return>" . crux-smart-open-line-above)
	 ("s-<return>" . crux-smart-open-line)))

;; Everything seems cluttered without this
(setq-default line-spacing 2)

;; Editorconfig
(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

;; anzu search
(use-package anzu
  :diminish anzu-mode
  :ensure t
  :init
  (global-anzu-mode)
  :config
  (setq anzu-cons-mode-line-p nil))


(provide 'init-editor)
