(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
;; config

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq visible-bell 1)

(global-display-line-numbers-mode 1)
(column-number-mode 1)
(setq display-line-numbers-type 'relative)

(recentf-mode 1)
(setq history-length 25)
(savehist-mode 1)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

(ido-mode 1)
(setq-default dired-listing-switches "-alh")
(ido-everywhere 1)

(set-face-attribute 'default nil
                    :family "JetBrainsMono"
                    :height 130
                    :weight 'normal
                    :width 'normal)

;; packages

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Make sure use-package exists
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package tokyonight-themes
  :vc (:url "https://github.com/xuchengpeng/tokyonight-themes")
  :config
  (tokyonight-themes-load-theme 'tokyonight-moon)
  (keymap-global-set "<f5>" #'tokyonight-themes-toggle))

;; Download Evil

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (evil-org-set-key-theme
   '(textobjects insert navigation additional shift todo heading))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

  ;;

;; Keybinds
(global-set-key (kbd "C-x w") #'save-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(evil-define-key '(normal visual) 'global
  (kbd "g l") #'evil-end-of-line
  (kbd "g h") #'evil-beginning-of-line)
(evil-set-undo-system 'undo-redo)

(with-eval-after-load 'evil
  (evil-define-key 'normal global-map
    (kbd "C-s") #'save-buffer
    (kbd "C-j") #'other-window
    (kbd "C-k") #'other-window
    (kbd "C-l") #'evil-window-prev
    (kbd "SPC") 'org-toggle-checkbox))


;; org mode

(require 'org)

(setq org-directory "~/dox/org")
(setq org-agenda-include-diary t)
(setq org-ellipsis " ▾")

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
