
(package-initialize)

; user details
(setq user-full-name "Simon Iversen")
(setq user-mail-address "simon.iversen@protonmail.ch")

(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

; no splash screen, no scratch message, start in org-mode
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

; NOT
(setq org-startup-indented t)

; When editing text files wrap lines
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(load-library "paren")
(show-paren-mode 1)
(transient-mark-mode t)
(require 'paren)

(require 'auto-complete)
(global-auto-complete-mode t)

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

; (require 'journal)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)

(delete-selection-mode t)
(transient-mark-mode t)

; use x clipboard (enabling cutting/pasting from outside emacs)
(setq x-select-enable-clipboard t)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; default indent is 4, spaces NOT tabs
(setq tab-width 4
      indent-tabs-mode nil)

;; don't create automatic backup files
(setq make-backup-files nil)

;; yes is y and no is n
(defalias 'yes-or-no-p 'y-or-n-p)

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org" 
                             "~/org/home.org"))

;; OUTLINE MODE
 ; Outline-minor-mode key map
 (define-prefix-command 'cm-map nil "Outline-")
 ; HIDE
 (define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
 (define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
 (define-key cm-map "o" 'hide-other)        ; Hide other branches
 (define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
 (define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
 (define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
 ; SHOW
 (define-key cm-map "a" 'show-all)          ; Show (expand) everything
 (define-key cm-map "e" 'show-entry)        ; Show this heading's body
 (define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
 (define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
 (define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
 ; MOVE
 (define-key cm-map "u" 'outline-up-heading)                ; Up
 (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
 (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
 (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
 (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
(global-set-key "\M-o" cm-map)
;; OUTLINE MODE END

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)

(global-set-key (kbd "C-x g") 'magit-status)

(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

; flymake ?
;(require 'flymake)
;(defun flymake-get-tex-args (file-name)
;(list "pdflatex"
;(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
;(add-hook 'LaTeX-mode-hook 'flymake-mode)

; trying to run code in org-mode
(org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))

; nice colour time 
(load-theme 'misterioso)

; switch focus in window
(global-set-key (kbd "M-p") 'ace-window)

; quick and neat handling of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
