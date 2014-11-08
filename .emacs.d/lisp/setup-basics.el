(set-face-attribute 'trailing-whitespace nil :background "red1" :weight 'bold)
(whitespace-cleanup)
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(setq column-number-mode t)
(global-linum-mode 1)
;;(global-hl-line-mode 1)


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
