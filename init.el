;; --- package ---
(require 'package) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; You might already have this line
;; ---------------

;; don't pop up a new frame for a new window
(setq ns-pop-up-frames nil)

;; stop dislaying the startup message
(setq inhibit-startup-message t)

;; get rid of the toolbar
(tool-bar-mode -1)

;; enable line numbers by default
(require 'linum)
(global-linum-mode 1)

;; show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; company ("auto complete"-like feature)
(add-hook 'after-init-hook 'global-company-mode)

;; parinfer (lisp editing mode)
;; (use-package parinfer
;;   :ensure t
;;   :bind
;;   (("C-," . parinfer-toggle-mode))
;;   :init
;;   (progn
;;     (setq parinfer-extensions
;;           '(defaults))       ; should be included.
;;     ;;pretty-parens  ; different paren styles for different modes.
;;     ;;evil           ; If you use Evil.
;;     ;;lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
;;     ;;smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
;;     ;;smart-yank     ; Yank behavior depend on mode.
    
;;     (add-hook 'clojure-mode-hook #'parinfer-mode)
;;     (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)))

;; powerline (better looking mode line)
(require 'powerline)
(powerline-default-theme)

;; uzumaki (for cycling through buffers)
(require 'uzumaki)
(defun my:uzumaki-mode-keys ()
  "my keybindings for 'uzumaki-minor-mode'."
  ;;(define-key uzumaki-minor-mode-map (kbd "s-{") (lambda () (uzumaki-cycle-to-prev-buffer 'all)))
  ;;(define-key uzumaki-minor-mode-map (kbd "s-}") (lambda () (uzumaki-cycle-to-next-buffer 'all)))
  (define-key uzumaki-minor-mode-map (kbd "C-{") 'uzumaki-cycle-to-prev-buffer)
  (define-key uzumaki-minor-mode-map (kbd "C-}") 'uzumaki-cycle-to-next-buffer)
  
  ;; If there is a conflicting key, unbind the uzumaki-minor-mode respective one.
  (define-key uzumaki-minor-mode-map (kbd "C-,") nil)
  (define-key uzumaki-minor-mode-map (kbd "C-.") nil))
(add-hook 'uzumaki-minor-mode-hook 'my:uzumaki-mode-keys)
(uzumaki-minor-mode 1)
(uzumaki-set-cycle-mode 'all-no-hidden)

;; persistent-scratch persistent *scratch* buffer
(persistent-scratch-setup-default)

;; Python environment
(elpy-enable)
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
;; interpreter setting compatible with old version of ipython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")
;; interpreter setting for newer version of ipython
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i --simple-prompt")
;;(elpy-clean-modeline) ;; <-- broken as of 2017 03 30, emacs version 25.1.1

;; editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;; Personal key bindings
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-z") 'undo)

;; iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; highlight-symbol
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; theme
(when (display-graphic-p)
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(custom-enabled-themes (quote (atom-dark)))
   '(custom-safe-themes
     (quote
      ("e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" default))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))
