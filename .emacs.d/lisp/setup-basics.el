(set-face-attribute 'trailing-whitespace nil :background "red1" :weight 'bold)
(whitespace-cleanup)
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(setq column-number-mode t)
(global-linum-mode 1)
;;(global-hl-line-mode 1)


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(setq inhibit-startup-screen +1)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(when (window-system)
  (require 'git-gutter-fringe))

(global-git-gutter-mode +1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)

'(powerline-center-theme)
