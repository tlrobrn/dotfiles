;; Package Management
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Install Packages
(defun ensure-package-installed (package)
  (unless (package-installed-p package)
    (package-install package)))

(ensure-package-installed 'alchemist)
(ensure-package-installed 'company)
(ensure-package-installed 'ensime)
(ensure-package-installed 'find-file-in-project)
(ensure-package-installed 'find-file-in-repository)
(ensure-package-installed 'flx-ido)
(ensure-package-installed 'lua-mode)
(ensure-package-installed 'magit)
(ensure-package-installed 'markdown-mode)
(ensure-package-installed 'multiple-cursors)
(ensure-package-installed 'smex)
(ensure-package-installed 'bubbleberry-theme)

;; Auto-Save files stored in /tmp
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; Parens
(show-paren-mode t)
(electric-pair-mode t)

;; Whitespace
(setq tab-width 2)
(setq-default indent-tabs-mode nil)
(setq require-final-newline t)
(setq-default highlight-tabs t)
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Fuzzy Finding
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces t)
(global-set-key (kbd "C-x f") 'find-file-in-repository)

;; Company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Ensime
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Multiple Cursors
(global-set-key (kbd "C-c C-r") 'mc/edit-lines)
(global-set-key (kbd "C-c C-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c C-s") 'mc/mark-all-like-this)

;; Appearnace
(load-theme 'bubbleberry t)
(menu-bar-mode -1)
(column-number-mode t)
(global-linum-mode t)
(setq linum-format "%d ")

;; Startup
(setq inhibit-splash-screen t
      inhibit-startup-message t
      initial-scratch-message nil)

;; Buffers
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c h") 'windmove-left)
