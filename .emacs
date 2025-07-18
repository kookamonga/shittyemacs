;; ~/.emacs

;; Disable unnecessary UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Set up package.el and install use-package
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; Load xref for nim-mode
(require 'xref)

;; Gruvbox Light Hard theme
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-light-hard t))

;; Rust support
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save t))

;; Zig support
(use-package zig-mode
  :ensure t
  :mode "\\.zig\\'")

;; OCaml support
(use-package tuareg
  :ensure t
  :mode ("\\.ml\\'" . tuareg-mode))

;; Nim support
(use-package nim-mode
  :ensure t
  :hook ((nim-mode . company-mode))
  :config
  (setq nim-nimsuggest-path (executable-find "nimsuggest"))
  (setq nim-suggest-use-evil nil)) ;; Disable evil-mode integration


;; Install flycheck for error checking
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; File associations for Nim
(add-to-list 'auto-mode-alist '("\\.nim\\'" . nim-mode))
(add-to-list 'auto-mode-alist '("\\.nims\\'" . nim-mode))

;; Minimal settings
(setq inhibit-startup-screen t
      initial-scratch-message nil
      visible-bell t
      make-backup-files nil
      auto-save-default nil)

;; Enable line numbers
(global-display-line-numbers-mode 1)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil
              tab-width 2)

;; Show matching parentheses
(show-paren-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company company-nim flycheck gruvbox-theme nim-mode rust-mode tuareg
             zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
