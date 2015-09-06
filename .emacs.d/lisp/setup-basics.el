;; Setup the fonts
(set-face-attribute 'trailing-whitespace nil :background "red1" :weight 'bold)
(set-default-font "Consolas 12")


(whitespace-cleanup)
(global-auto-complete-mode t)
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(setq column-number-mode t)
(global-linum-mode 1)
;;(global-hl-line-mode 1)

(setq user-full-name "V Sreekanth")
(setq user-mail-address "sreeix@gmail.com")

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; start full screen.
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;This ensures that if you are editing a readonly file it will ask for sudo password for editing it.
;; not useful all the time but useful when you open a file and want to edit it in sudo mode
(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(setq inhibit-startup-screen +1)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;; Highlight tabulations
(setq-default highlight-tabs t)

;; Show trailing white spaces
(setq-default show-trailing-whitespace t)

;; Remove useless whitespace before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))



(when (window-system)
  (require 'git-gutter-fringe))

(global-git-gutter-mode +1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)

(require 'powerline)
(powerline-default-theme)

(add-hook 'after-init-hook 'global-company-mode)

;; Setup recentf-mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
