; Backups annoy me
(setq backup-inhibited t)
(setq auto-save-default nil)

; No longer need hand-holding
(setq inhibit-startup-message t)
(menu-bar-mode -1)

; Basic editor settings
(setq kill-whole-line t)
(setq column-number-mode t)
(setq hs-minor-mode t)
(setq-default tab-width 3)
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

; add new package sources:
(require 'package)
(add-to-list
 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

; Find custom downloaded themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'deeper-blue' t)

; C/C++ settings
(setq c-default-style "ellemtel"
      c-basic-offset 3
      tab-width 3)
(c-set-offset 'case-label'+)  ; fix case indentation
; Make hpp files indent in c++ mode:
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))

; Javascript settings
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js-indent-level 3)
(setq js-switch-indent-offset 3)
(setq js2-indent-switch-body t)
(add-hook 'js-mode-hook 'js2-minor-mode)

; Python settings
(add-hook 'python-mode-hook
   (lambda()
     (setq tab-width 4)
     (setq python-indent 4)))

; Use nxml-mode for xml, xsl, rng, svg, html variations
(setq auto-mode-alist
   (cons '("\\.\\(xml\\|xsl\\|rng\\|svg\\|x?html?\\)\\'" . nxml-mode)
      auto-mode-alist))

(require 'generic-x)
(define-generic-mode
  ;; mode name parameter:
  'sfw-mode
  ;; comments parameter:
  '("#")
  ;; keywords parameter:
  '("schema" "type" "procedure" "schema-proc" "$database" "$xml-stylesheet"
    "$default-mode" "autoload_tag" "button" "label" "tag" "task" "title"
     "on_line_click" "form-action" "filename" "url" "result" "confirm")
  ;; other highlighting parameter:
  '(("form-\\(new\\|edit\\|view\\|submit\\)" . font-lock-constant-face)
    ("\\(delete\\|update\\|add\\|export\\)" . font-lock-constant-face)
   )
  ;; filename templates parameter (files that activate this mode):
  '("\\.srm$")
  ;; other functions parameter:
  nil
  ;; description string parameter:
  "A mode for Schema Framework SRM files"
)

;; Failed attempt to get Shift-tab to unindent:
;; (add-hook 'sfw-mode-hook
;;           (lambda () (local-set-key (kbd "<backtab>") 'backward-to-indentation)))


; Highlight <xsl:template for ease of scanning in XSL file:
;; (defun xsl_highlight_templates()
;;   (interactive "p")
;;   (highlight-regexp "<xsl:template[^>]+>" 'trailing-whitespace))
;; (add-hook 'nxml-mode-hook 'xsl_highlight_templates)

(defun xsl_highlight_templates()
  (interactive "p")
  (highlight-regexp "<xsl:template" 'show-paren-mismatch))
(add-hook 'nxml-mode-hook 'xsl_highlight_templates)

(require 'man)
(set-face-attribute 'Man-overstrike nil :inherit 'bold :foreground "brightcyan")
(set-face-attribute 'Man-underline nil :inherit 'underline :foreground "brightgreen")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f01c338c47894a1bea1f1dbd8254d749818dcd977b17f0efeca9a8648b079543" "9d3b8018f0410431a914e2daa66f92b9d2c644b6b3648ea3cc3040cf651cd1be" "53baec177cd4b21dbc313e2db38c2f5914277c3da82b5a5da818a465dc8f8927" "97238fc1d27662e5a531d312827157c2e99478e4ab519eff5524c3f22485ed11" "adb0eb34b5da695f09ed34295139afd5469f22a337f9291685e85e6fbd764e5f" "bc2d81333f7cfafc97178e76e3ed41689b3639bbd08adc7717478036a5c0b52f" "da54d392eff55fe55e64211909ae4cb884a0026d1abcc3e0678281879386030f" "5990b62c6624b397fb2a2f81b76d4513a872c24bc4ee1c6a89ff043c53c8fa77" "0ea887653f15029547cfa0374d2df5d036c59eba888d85533d421c1db8e3c349" "368a4cb8be09d0a3602da59daff92360000552369df6b5bb0e3fac9ff6fe203f" "07aeaeacbaa24e79fede98764a7a98f9311df39b97cd979ad305197a0aebd603" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "#AA0033"))))
 '(font-lock-comment-face ((t (:foreground "#AA0033"))))
 '(font-lock-constant-face ((t (:foreground "color-226"))))
 '(font-lock-doc-face ((t (:foreground "color-46"))))
 '(font-lock-function-name-face ((t (:background "color-166" :foreground "brightwhite" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#EE4400"))))
 '(font-lock-type-face ((t (:foreground "color-99"))))
 '(font-lock-variable-name-face ((t (:foreground "color-40"))))
 '(isearch ((t (:background "color-166" :foreground "brightwhite"))))
 '(lazy-highlight ((t (:background "magenta" :foreground "brightwhite"))))
 '(trailing-whitespace ((t (:background "brightblue")))))
