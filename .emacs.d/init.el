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

(defconst *is-a-mac* (eq system-type 'darwin))

(load "betterdefaults.el")
(load "setup-basics.el")
(load "setup-sml.el")
(load "setup-javascript.el")
(load "setup-ido.el")
(when *is-a-mac*
  (load "setup-mac.el"))

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
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(magit-commit-arguments nil)
 '(package-selected-packages
   (quote
    (zenburn-theme yaml-mode whitespace-cleanup-mode solarized-theme sml-mode shm rainbow-delimiters powerline paradox nrepl multi-web-mode mocha-snippets markdown-mode magit-push-remote magit-filenotify magit-commit-training-wheels json-mode js2-refactor helm-projectile guide-key-tip groovy-mode grizzl git-gutter-fringe gist flycheck-tip flycheck-hdevtools flycheck-haskell flycheck-color-mode-line fish-mode f erlang dash-at-point company-tern company-ghc auto-complete ack-and-a-half)))
 '(safe-local-variable-values
   (quote
    ((zencoding-
      (insert)
      indentation . 8)
     (sgml-basic-offset . 8)
     (js2-strict-inconsistent-return-warning))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))
