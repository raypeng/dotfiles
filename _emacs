;; add load path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/util/")

;; settings for enabling tab completion in M-x shell
(require 'shell-completion)

;;; settings for Interactively Do Things
(require 'ido)
(ido-mode t)
;; snippet to improve ido
;; display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
;; C-n/p is more intuitive in vertical layout
(defun ido-define-keys ()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; settings for package system
(add-to-list 'load-path "~/.emacs.d/package/")
(require 'package)
(add-to-list 'package-archives 
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; load emacs starter kit init file
(load "~/.emacs.d/emacs24-starter-kit/init.el")

;; settings for tuareg mode
(add-to-list 'load-path "~/.emacs.d/ocaml/")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

;; settings for web mode
(add-to-list 'load-path "~/.emacs.d/web/")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; settings for haml mode
(add-to-list 'load-path "~/.emacs.d/haml/")
(require 'haml-mode)

;; settings for rhtml mode
(add-to-list 'load-path "~/.emacs.d/rhtml/")
;; (require 'rhtml-mode)

;; settings for rails rinari minor mode
;; (add-to-list 'load-path "~/.emacs.d/rinari/")
;; (require 'rinari)

;; settings for emacs-rails minor mode
;; (add-to-list 'load-path "~/.emacs.d/rails-minor-mode/")
;; (require 'rails)

;;; settings for ruby related
(add-to-list 'load-path "~/.emacs.d/ruby/")
(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation))))
                               
;; flymake-ruby for syntax checking
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
;; inf-ruby for REPL shell inside emacs
;; (global-set-key (kbd "C-c r r") 'inf-ruby)

;; settings for grizzl for fuzzy find
(add-to-list 'load-path "~/.emacs.d/grizzl/")
(require 'grizzl)

;; settings for projectile project management tool
(add-to-list 'load-path "~/.emacs.d/projectile/")
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

;; settings for emacs color theme
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn    
     (color-theme-initialize)
     (color-theme-robin-hood)))

;; settings indentation width
(setq javascript-indent-level 4)

;; settings for font
;; (set-face-attribute 'default nil :family "Anonymous Pro" :height 120)