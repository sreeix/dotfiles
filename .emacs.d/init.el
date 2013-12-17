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
(load "setup-mac.el")
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

(projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(setq projectile-indexing-method 'git)

;; Key bindings.

(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-c m") 'magit-status)
;;(setq ns-right-option-modifier ‘super)
(yas-global-mode 1)
;;(load-theme 'solarized-light)
(load-theme 'wombat)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-basic-offset 8 nil nil "For Pulse")
 '(safe-local-variable-values (quote ((zencoding- (insert) ndentation . 8) (sgml-basic-offset . 8) (js2-strict-inconsistent-return-warning)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
