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

;; selectrum and prescient
(selectrum-mode +1)
(selectrum-prescient-mode +1)
(prescient-persist-mode +1)

;; projectile
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

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

;; Run the following command before launching a REPL to plot charts with Matplotlib/pandas
(defun elpy-ipython-plot-profile (profile)
    "Use a specified profile for Elpy IPython REPL, enabling the pylab option"
    (interactive "sEnter profile name: ")
    (when (string-empty-p profile)
      (setq profile "plots"))
    (message "Setting elpy ipython profile: %s" profile)
    (setq python-shell-interpreter-args (concat "--profile " profile " --pylab -i"))
    (setq python-shell-interpreter "ipython"))

;; Restore the default options for Elpy IPython REPL
(defun elpy-ipython-default-profile ()
  "Use the default profile for Elpy IPython REPL"
  (interactive)
  (setq python-shell-interpreter "ipython"
	python-shell-interpreter-args "-i"))

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

;; org mode
(setq org-todo-keywords
      '((sequence "TODO" "POSTPONED" "|" "DONE" "ABANDONED" "DUPLICATE" "DELEGATED")))
(setq org-log-done 'time)

;; theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(atom-dark))
 '(custom-safe-themes
   '("2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" default))
 '(package-selected-packages
   '(selectrum selectrum-prescient gnu-elpa-keyring-update projectile uzumaki use-package powerline persistent-scratch parinfer markdown-mode highlight-symbol elpy editorconfig cider atom-one-dark-theme atom-dark-theme ample-zen-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (not (display-graphic-p))
  (disable-theme 'atom-dark))
