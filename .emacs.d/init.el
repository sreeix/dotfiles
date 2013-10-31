;; path constants
(defvar emacs-home "~/dotfiles/.emacs.d/")
(add-to-list 'exec-path "~/dotfiles/bin/")
(add-to-list 'exec-path "/opt/local/bin")

(defvar vendor (concat emacs-home "vendor/"))

(defun vendor-require (feature &optional dir)
  (if dir
      (add-to-list 'load-path (concat vendor dir))
    (add-to-list 'load-path (concat vendor (symbol-name feature))))
  (require feature))

;; load the files in emacs home
(add-to-list 'load-path emacs-home)

(load "betterdefaults.el")
(load "setup-sml.el")
(load "setup-javascript.el")
(load "setup-ido.el")
;;(require 'ui)
;;(vendor-require 'cl-lib)

;;(load-theme 'zenburn t)

(defvar elpa-dir (concat emacs-home "elpa"))
(setq package-user-dir elpa-dir)
(add-to-list 'load-path elpa-dir)


(require 'package)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


 ;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
 (windmove-default-keybindings)

 ;; Enable copy and pasting from clipboard
 (setq x-select-enable-clipboard t)


 (autoload 'dash-at-point "dash-at-point"
            "Search the word at point with Dash." t nil)
  (global-set-key "\C-cd" 'dash-at-point)


(set-face-attribute 'default nil
                :family "Inconsolata" :height 145 :weight 'normal)
