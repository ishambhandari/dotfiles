(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell nil)
(setq mac-command-key-is-meta t)
(setq display-line-numbers 'relative)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 150)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(use-package dracula-theme)
(load-theme 'dracula t)




;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-linum-mode 1)
  
  
  
;; Initialize package sources
(require 'package)
(require 'use-package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;;Global custom bindings
(global-set-key (kbd "C-k") (lambda () (interactive) (previous-line 10)))
(global-set-key (kbd "C-j") (lambda () (interactive) (next-line 10)))

;;Nerd tree
(use-package neotree)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq projectile-switch-project-action 'neotree-projectile-action)

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (rune/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file))
  :config
  (setq ivy-initial-inputs-alist nil)) 


(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Documents")
    (setq projectile-project-search-path '("~/Documents")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package forge) 



(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;;json-mode
(use-package json-mode
  :ensure t)
;; web-mode
(setq web-mode-markup-indent=offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(use-package web-mode
  :ensure t
  :mode (("\\.js\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode)
	 ("\\.ts\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode)
	 ("\\.html\\'" . web-mode))
  :commands web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) 
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

;;flycheck

(use-package flycheck)
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))
;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)


;;company
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
(use-package company
  :ensure t
  :config (global-company-mode t))

;;lsp mode

(setq lsp-log-io nil)
(setq lsp-keymap-prefix "C-c l")
(setq lsp-restart 'auto-restart)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-io-sideline-show-hover t)
(setq lst-io-sideline-show-code-actions t)
(use-package lsp-mode
  :commands (lsp-deffered)
  :hook (
	 (web-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration)
	 ))
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  )

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))


(use-package prettier-js
  :ensure t)
(add-hook 'web-mode-hook #'(lambda ()
                            (enable-minor-mode
                             '("\\.jsx?\\'" . prettier-js-mode))
                            (enable-minor-mode
                             '("\\.js?\\'" . prettier-js-mode))))

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

;; (eval-after-load 'js-mode
;;   '(add-hook 'js-mode-hook #'add-node-modules-path))

  (evil-ex-define-cmd "q" 'kill-this-buffer)
;; (use-package rjsx-mode
;;   :ensure t
;;   :mode "\\.js\\'")

;; (defun setup-tide-mode()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (tide-hl-identifier-mode +1)
;;   (company-mode +1))

;; (use-package tide
;;   :ensure t
;;   :after (rjsx-mode company flycheck)
;;   :hook (rjsx-mode . setup-tide-mode))

;; (use-package prettier-js
;;   :commands (prettier-js-mode prettier)
;;   :init (add-hook 'js2-mode-hook 'prettier-js-mode)
;;   :bind (:map js2-mode-map ("M-q" . prettier))
;;   :config
;;   (setq prettier-target-mode "js2-mode")
;;   (setq prettier-js-args '(
;;     "--trailing-comma" "all"
;;     "--bracket-spacing" "false")))

(electric-pair-mode 1)
(use-package highlight-indent-guides)
 (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
 (setq highlight-indent-guides-method 'character)
 (evil-commentary-mode)
;; (use-package typescript-mode
;;   :mode "\\.ts\\'"
;;   :hook (typescript-mode . lsp-deferred)
;;   :config
;;   (setq typescript-indent-level 2))
;; (require 'js2-refactor)
;; (require 'xref-js2)


;; (add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (js2r-add-keybindings-with-prefix "C-c C-r")
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

; ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; ;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

;; (add-hook 'js2-mode-hook (lambda ()
;;   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default))
 '(package-selected-packages
   '(eslint-fix exec-path-from-shell dracula-theme add-node-modules-path prettier evil-commentary highlight-indent-guides typescript-mode lsp-mode forge evil-magit counsel-projectile projectile which-key use-package telephone-line rainbow-delimiters key-chord hydra general evil-collection doom-modeline counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
