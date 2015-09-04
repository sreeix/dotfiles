;; mac specific settings

(when (eq system-type 'darwin)
  (setq delete-by-moving-to-trash t
        trash-directory "~/.Trash/emacs")

  (add-to-list 'ido-ignore-files "\\.DS_Store")

  (setq mac-option-key-is-meta nil
        mac-command-key-is-meta t
        mac-command-modifier 'meta
        mac-option-modifier 'none)

  (setq ack-executable "ack")

 ;; Enable copy and pasting from clipboard
 (setq x-select-enable-clipboard t)


 (autoload 'dash-at-point "dash-at-point"
            "Search the word at point with Dash." t nil)
  (global-set-key "\C-cd" 'dash-at-point)


  ;; set the PATH properly
  (let* ((path (shell-command-to-string "/bin/zsh -c 'source ~/.zshrc && printf $PATH'")))
    (setenv "PATH" path)
    (mapc (lambda (p)
         (add-to-list 'exec-path p))
         (split-string path ":")))

  (setq browse-url-browser-function 'browse-url-default-macosx-browser)

  (when (boundp 'ns-toggle-fullscreen)
    (ns-toggle-fullscreen)))

;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)



;; (set-face-attribute 'default nil
;;                     :family "Inconsolata"
;;                     :height 120
;;                     :weight 'normal
;;                     :width 'normal)

;; (when (functionp 'set-fontset-font)
;;   (set-fontset-font "fontset-default"
;;                     'unicode
;;                     (font-spec :family "DejaVu Sans Mono"
;;                                :width 'normal
;;                                :size 12.4
;;                                :weight 'normal)))


(provide 'init-mac)
