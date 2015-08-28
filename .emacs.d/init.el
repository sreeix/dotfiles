;; path constants
(defvar emacs-home "~/.emacs.d/")
(add-to-list 'exec-path "~/code/dotfiles/bin/")
(add-to-list 'exec-path "/opt/local/bin")

(defvar vendor (concat emacs-home "vendor/"))
(defvar my-lisp (concat emacs-home "lisp/"))
(defun vendor-require (feature &optional dir)
  (if dir
      (add-to-list 'load-path (concat vendor dir))
    (add-to-list 'load-path (concat vendor (symbol-name feature))))
  (require feature))

;; load the files in emacs home
 (add-to-list 'load-path  my-lisp)

(when window-system (set-frame-size (selected-frame) 200 80))

(defvar elpa-dir (concat emacs-home "elpa"))
(setq package-user-dir elpa-dir)
(add-to-list 'load-path elpa-dir)


(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(server-start)

(load "betterdefaults.el")
(load "setup-basics.el")
(load "setup-sml.el")
(load "setup-javascript.el")
(load "setup-ido.el")
(load "setup-mac.el")
(load "setup-erlang.el")
(load "setup-haskell.el")
(load "setup-keybindings.el")
;;(require 'ui)
(vendor-require 'cl-lib)

(load-theme 'zenburn t)

(projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(setq projectile-indexing-method 'git)

;;(setq ns-right-option-modifier ‘super)
(yas-global-mode 1)
;;(load-theme 'solarized-light)
(load-theme 'wombat)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((zencoding- (insert) ndentation . 8) (sgml-basic-offset . 8) (js2-strict-inconsistent-return-warning))))
 '(show-paren-mode t)

 '(tool-bar-mode nil))
