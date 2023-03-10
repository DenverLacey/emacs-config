(setq user-emacs-directory "~/.emacs.d")

(defvar --backup-directory (concat user-emacs-directory "/backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory))

(defvar --auto-saves-directory (concat user-emacs-directory "/auto-save-list"))
(if (not (file-exists-p --auto-saves-directory))
    (make-directory --auto-saves-directory))

(setq backup-directory-alist `((".*" . ,--backup-directory)))
(setq make-backup-files t          ; backup of a file the first time it is saved
      backup-by-copying t          ; don't clobber symlinks
      version-control t            ; version numbers for backup files
      delete-old-versions t        ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6          ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9          ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t          ; auto-save every buffer that visits a file
      auto-save-timeout 20         ; number of seconds idle time before save (default: 30)
      auto-save-interval 200       ; number of keystrokes between auto-saves (default: 300)
      )

(setq auto-save-file-name-transforms `((".*" ,--auto-saves-directory t)))

;; make emacs startup in a maximised frame
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; setup theme and font
(defvar --theme-directory (concat user-emacs-directory "/themes"))
(if (not (file-exists-p --theme-directory))
    (make-directory --theme-directory))
(add-to-list 'custom-theme-load-path --theme-directory)
(load-theme 'brin t)

(add-to-list 'default-frame-alist '(font . "Fira Code Light"))
(set-face-attribute 'default t :font "Fira Code Light")

(require 'package)
(require 'use-package)

(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))

(use-package org
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4363ac3323e57147141341a629a19f1398ea4c0b25c79a6661f20ffc44fdd2cb" default))
 '(package-selected-packages '(use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
