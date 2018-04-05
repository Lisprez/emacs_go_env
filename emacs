(setq inhibit-splash-screen t)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(setq frame-title-format
      '("Deepin Emacs " " >_ " (:eval (if (buffer-file-name)
                                          (abbreviate-file-name (buffer-file-name))
                                        "%b"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (flycheck-ocaml tuareg company-ycmd ycmd fzf monokai-theme evil go-autocomplete auto-complete exec-path-from-shell go-mode)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "IBM Plex Mono" :foundry "nil" :slant normal :weight light :height 180 :width normal)))))


(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))


(setenv "GOPATH" "/Users/lampo/work-dir/go")

(add-to-list 'exec-path "/usr/local/bin")
(add-hook 'before-save-hook 'gofmt-before-save)


(defun my-go-mode-hook ()
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding                                                      
  ;(local-set-key (kbd "M-.") 'godef-jump)
  ;(local-set-key (kbd "M-*") 'pop-tag-mark))
  (define-key evil-normal-state-map (kbd "M-.") 'godef-jump)
  (define-key evil-normal-state-map (kbd "M-*") 'pop-tag-mark))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

(require 'evil)
(evil-mode 1)

(electric-pair-mode t)
(setq make-backup-files nil)
(setq backup-by-copying t)
(show-paren-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)

(define-key evil-normal-state-map (kbd "<backtab>") 'evil-prev-buffer)

;;(load-theme 'monokai t)

(setq c-default-style "linux"  
      c-basic-offset 4)  
(setq-default indent-tabs-mode nil)  
(setq default-tab-width 4)  
(setq tab-width 4)  
(setq tab-stop-list ())

 ;;;;;;;;;;;;;;;;;;;;;;;company;;;;;;;;;;;;;;;;;;  
(add-hook 'after-init-hook #'global-company-mode)  
;;;;;;;;;;;;;;;;;;;;;;;;;;;flycheck;;;;;;;;;;;;;;;;  
(add-hook 'after-init-hook #'global-flycheck-mode)  
;;;;;;;;;;;;;;;;;;;emacs-ycmd;;;;;;;;;;;;;;;;;;;  
(require 'ycmd)  
(add-hook 'after-init-hook #'global-ycmd-mode)  
(set-variable 'ycmd-server-command (quote ("python" "/home/lispre/ycmd/ycmd/")))  
(set-variable 'ycmd-global-config "/home/lispre/.ycm_extra_conf.py")  
(require 'company-ycmd)  
(company-ycmd-setup)  
(require 'flycheck-ycmd)  
(flycheck-ycmd-setup) 
