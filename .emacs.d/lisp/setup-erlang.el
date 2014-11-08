(add-to-list 'load-path (car (file-expand-wildcards "/usr/local/Cellar/erlang/latest/lib/erlang/lib/tools-*/emacs")))
(setq erlang-root-dir "/usr/local/Cellar/erlang/latest")
(setq exec-path (cons "/usr/local/Cellar/erlang/latest/bin" exec-path))

(require 'erlang-start)

(global-set-key (kbd "C-c m") #'erlang-man-function)
(global-set-key (kbd "C-c M") #'erlang-man-module)


(setq inferior-erlang-machine-options '("-sname" "emacs"))



(setq auto-mode-alist (append
		       '(("rebar.config$" . erlang-mode)
			 ("Emakefile$" . erlang-mode)
			 ("\\.app.src$" . erlang-mode)
			 ("\\.app$" . erlang-mode))
		       auto-mode-alist))

(require 'erlang-flymake)
