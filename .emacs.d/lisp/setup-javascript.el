;; JS mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(setenv "PATH" (concat "~/.npm/bin:" (getenv "PATH")))

(show-paren-mode)
(electric-pair-mode)


;; Let flycheck handle parse errors
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

(add-hook 'js2-mode-hook (lambda () (flycheck-mode 1)))

(require 'js2-mode)
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")


;; tern setup, following the default tern setup.
;; http://ternjs.net/doc/manual.html#emacs
;; clone it into code/misc/tern
;; npm install

(add-to-list 'load-path "~/code/misc/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)

;; (with-eval-after-load 'company
;;   (add-to-list 'company-backends 'company-tern))


(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; allow tern process to be killed(and restarted)
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))
;; end of tern
(setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
