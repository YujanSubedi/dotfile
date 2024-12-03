;; Set custom file location
(setq custom-file "~/.cache/emacs_custom.el")

;; Disable autosave and backup files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Initialize package system
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

;; Install and configure packages using use-package (for lazy loading)
(eval-when-compile
  (require 'use-package))

;; Looks and themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-dracula t))

;; Disable toolbar and menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Set line numbers and wrap text like Vim
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(global-visual-line-mode t)

;; Font settings
(set-face-attribute 'default nil :font "JetBrains Mono-12")

;; Org mode
(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :custom
(org-modern-star '("◉" "○" "✸" "✿"))
  (org-modern-label-border 0.2))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.1))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

;; Enable recentf-mode to keep track of recently opened files
(use-package recentf
  :ensure t
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 10)
  (add-hook 'emacs-startup-hook 'recentf-open-files)
  (setq initial-buffer-choice 'recentf-open-files))

(setq-default left-margin-width 2) ;; Adds left padding to the window

;; Vim keybindings
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; Key bindings
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
