;; set backup directory to ~/.backups
(setq backup-directory-alist (quote (("." . "~/.backups"))))
;; close welcome page
(setq inhibit-startup-message t)
;; font
(set-frame-font "Fira Code Light 16" nil t)
;; show line number
(global-linum-mode 1)
(setq linum-format "%d")
;; disable scroll bar
(set-scroll-bar-mode nil)
;; default theme
(load-theme 'dracula t)
;; markdown mode
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(markdown-mode dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
