;; -*- lexical-binding: t; -*-

(require '+utils)

(setopt use-short-answers true)

;; Don't leave backup and lock-files everywhere!
(setopt make-backup-files false) ; Don't create backup files (files with a `~` suffix)
(setopt create-lockfiles  false) ; Don't create lock files (files with `.#` prefix)

(use-package autorevert
  :ensure nil
  :config
  (setopt global-auto-revert-mode             true) ; Reload when contents on disk change
  (setopt auto-revert-check-vc-info           true) ; Update VC info if file changed outside of Emacs
  (setopt global-auto-revert-non-file-buffers true) ; Reload when other buffers change too
  (setopt dired-auto-revert-buffer            true) ; Reload dired buffers
)

;;;; Save session
(use-package emacs
  :ensure nil
  :config
  (setopt recentf-mode      true) ; Save recently visited files
  (setopt save-place-mode   true) ; Save place in visited files
  (setopt savehist-mode     true) ; Save minibuffer history between sessions
  (setopt desktop-save-mode true) ; Restore saved session on startup
)

;;;; Encoding
(use-package emacs
  :ensure nil
  :config
  (setopt require-final-newline t) ; Add a newline at the end of the file on save
  ;; TODO: is this needed?
  (set-language-environment "utf-8")
  (set-default-coding-systems 'utf-8-unix)
)

;;;; Cursor
(use-package emacs
  :ensure nil
  :config
  (setopt blink-cursor-mode false) ; Don't blink the cursor
  (setopt cursor-in-non-selected-windows false) ; Don't show cursor in inactive windows
  (setopt cursor-type 'bar) ; Use a bar not a box
  (setopt global-hl-line-mode true) ; Highlight current line
  (setopt x-stretch-cursor true) ; Stretch the cursor on wide characters (eg tabs)
)

;;;; Mouse
(use-package emacs
  :ensure nil
  :config
  (setopt tool-tip-mode           true)   ; Enable tool tips on hover
  (setopt use-system-tooltips     false) ; Use Emacs' widgets for tooltips
  (setopt mouse-autoselect-window true)   ; Select window mouse is over
  (setopt context-menu-mode       true)   ; Enable right-click menus
)

;;; Editing
(use-package emacs
  :ensure nil
  :config
  (setopt parse-sexp-ignore-comments true)
  (setopt read-quoted-char-radix 16)
  (setopt tab-width 4)
  (setopt words-include-escapes true)
  (setopt indent-tabs-mode false)
)

;;;; Selection
(use-package emacs
  :ensure nil
  :config
  (setopt delete-selection-mode true)  ; Inserting while selection is active overwrites
  (setopt mark-even-if-inactive false) ; Don't operate on region unless it's active
)

;;;; Whitespace
(use-package whitespace
  :ensure nil
  :hook
  ((prog-mode conf-mode) . whitespace-mode)
  :config
  (setopt whitespace-style '(face trailing tabs spaces space-mark tab-mark))
  (setopt whitespace-display-mappings '(
    (space-mark   ?\s    [?·])
    (space-mark   ?\xA0  [?¤])
    (newline-mark ?\n    [?↵ ?\n])
    (tab-mark     ?\t    [?» ?\t])
  ))
)

;;;; Delimiters
(use-package emacs
  :ensure nil
  :config
  (setopt show-paren-mode true)
  (setopt show-paren-style 'parenthesis)
  (setopt show-paren-when-point-inside-paren true)
  (setopt show-paren-predicate true)
  (setopt electric-pair-mode true)
)

(use-package rainbow-delimiters
  :hook
  ((prog-mode text-mode conf-mode) . #'rainbow-delimiters-mode)
)

;;;; Word wrap
(use-package emacs
  :ensure nil
  :config
  (setopt global-visual-line-mode true)
  (setopt global-visual-wrap-prefix-mode true)
)

;;;; Scrolling
(use-package emacs
  :ensure nil
  :config
  (setopt pixel-scroll-precision-mode true) ; Scroll by pixels, not lines
  (setopt scroll-conservatively 1001)
  (setopt scroll-margin 0)
)

(setopt window-combination-resize true)

(provide '+vanilla)
