;; --- package ---
(require 'package) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; You might already have this line
;; ---------------

(if (display-graphic-p)
    (custom-set-variables
     ;; custom-set-variables was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(ansi-color-names-vector
       ["#212121" "#CC5542" "#6aaf50" "#7d7c61" "#5180b3" "#DC8CC3" "#9b55c3" "#bdbdb3"])
     '(custom-enabled-themes (quote (atom-dark)))
     '(custom-safe-themes
       (quote
	("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "6254372d3ffe543979f21c4a4179cd819b808e5dd0f1787e2a2a647f5759c1d1" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" default)))
     '(fci-rule-color "#2e2e2e")
     '(package-selected-packages
       (quote
	(highlight-symbol markdown-mode elpy editorconfig uzumaki persistent-scratch powerline ample-zen-theme atom-dark-theme atom-one-dark-theme use-package parinfer company cider clojure-mode)))
     '(vc-annotate-background "#3b3b3b")
     '(vc-annotate-color-map
       (quote
	((20 . "#dd5542")
	 (40 . "#CC5542")
	 (60 . "#fb8512")
	 (80 . "#baba36")
	 (100 . "#bdbc61")
	 (120 . "#7d7c61")
	 (140 . "#6abd50")
	 (160 . "#6aaf50")
	 (180 . "#6aa350")
	 (200 . "#6a9550")
	 (220 . "#6a8550")
	 (240 . "#6a7550")
	 (260 . "#9b55c3")
	 (280 . "#6CA0A3")
	 (300 . "#528fd1")
	 (320 . "#5180b3")
	 (340 . "#6380b3")
	 (360 . "#DC8CC3"))))
     '(vc-annotate-very-old-color "#DC8CC3"))

  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))

;; don't pop up a new frame for a new window
(setq ns-pop-up-frames nil)

;; stop dislaying the startup message
(setq inhibit-startup-message t)

;; get rid of the toolbar
(tool-bar-mode -1)

;; show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; company ("auto complete"-like feature)
(add-hook 'after-init-hook 'global-company-mode)

;; enable auto-fill for text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

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
(elpy-use-ipython)
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
