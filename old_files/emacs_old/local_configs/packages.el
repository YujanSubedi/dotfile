(require 'package)
(add-to-list 'package-archives
     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
;;(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Org mode


;; Tools for latex
(unless (package-installed-p 'auctex)
  (package-install 'auctex))
(unless (package-installed-p 'latex-preview-pane)
  (package-install 'latex-preview-pane))

;; Pdf tools
;;(unless (package-installed-p 'pdf-tools)
;;  (package-install 'pdf-tools))

;; autothemer-deftheme
;;(unless (package-installed-p 'autothemer)
;;  (package-install 'autothemer))

;; Doom theme
(unless (package-installed-p 'doom_themes)
  (package-install 'doom-themes))

;; Dashboard
(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))

;; Icons
(unless (package-installed-p 'nerd-icons)
  (package-install 'nerd-icons))

;; Genaral for keybindings
(unless (package-installed-p 'general)
  (package-install 'general))
