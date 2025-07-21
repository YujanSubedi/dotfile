;; Enable Evil mode for having behaviour like vi
(require 'evil)
(evil-mode 1)

;; General for keybindings
(require 'general)

;; Set number, relative number and wrap like on vim
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(global-visual-line-mode t)

;; Color theme and little transparency
(load-theme 'doom-dracula t)
;;(set-frame-parameter (selected-frame) 'alpha '(97 100))

;; Change font to JetBrains Mono
(set-face-attribute 'default nil :font "JetBrains Mono-12")

;; Disable Autosave and backup files
(setq auto-save-default nil)
(setq make-backup-files nil)
;; (setq backup-directory-alist '((".*" . "~/.local/Emacs_dump/")))


;; Automatic load pdf from latex file
;;(latex-preview-pane-mode)

;; Display dashboard
(use-package dashboard
  :ensure t 
  :init
  (setq initial-buffer-choice 'dashboard-open)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-center-content t)
  ;; (setq dashboard-vertically-center-content t)
  ;; (setq dashboard-navigation-cycle t)
  (setq dashboard-banner-logo-title "Emacs Is A Great Operating System, Lacking Only A Decent Editor.")
  ;; (setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.config/emacs/logo.png")  ;; use custom image as banner
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          (projects . 3)
                          (registers . 3)))

  :custom
 (dashboard-modify-heading-icons '((recents . "file-text") (bookmarks . "book")))
  :config
  (dashboard-setup-startup-hook))

;; Use nerd fonts
(use-package nerd-icons-dired
  :ensure t
  :hook (dired-mode . nerd-icons-dired-mode))
