;; -*- lexical-binding: t; -*-

(require '+utils)

(set-frame-font "Fira Code 15")

(use-package doom-themes
  :config
  (setopt custom-safe-themes        true)
  (setopt doom-themes-enable-italic false)
  (setopt doom-themes-enable-bold   false)
  (defun km/set-theme (&optional kind)
    (interactive)
    (let* ((kind (or kind ns-system-appearance)))
      (pcase kind
        ('light (load-theme 'doom-solarized-light))
        ('dark  (load-theme 'doom-solarized-dark-high-contrast))
      )
    )
  )
  (add-hook 'ns-system-appearance-change-functions #'km/set-theme)
)

(use-package doom-modeline
  :config
  (setopt column-number-mode   true)
  (setopt line-number-mode     true)
  (setopt size-indication-mode true)
  (setopt visible-bell         false)
  (setopt ring-bell-function   #'doom-themes-visual-bell-fn)
  (setopt doom-modeline-mode   true)
)

(use-package emacs
  :ensure nil
  :config
  (setopt frame-resize-pixelwise true)  ; Don't round frame size to line height
  (setopt menu-bar-mode          true)  ; Enable menu bar
  (setopt ns-use-proxy-icon      false) ; Disable document icon in titlebar
  (setopt scroll-bar-mode        false) ; Disable scroll bar
  (setopt tool-bar-mode          false) ; Disable tool bar
  (setopt frame-title-format "GNU Emacs: %b")
)

;; Set frame title text colour correctly:
(use-package ns-auto-titlebar
  :when (eq system-type 'darwin)
  :config
  (setopt ns-auto-titlebar-mode true)
)

(use-package winum
  :config
  (setopt winum-mode              true) ; Number windows
  (setopt window-resize-pixelwise true) ; Don't round window sizes to whole character
  (setopt split-window-preferred-direction 'horizontal)
)

(use-package keycast
  :config
  (defconst km/keycast-format "%k%c%R")
  (defconst km/keycast-ignore [
    "<up>"   "<down>"
    "<left>" "<right>"
    "<wheel-up>"   "<wheel-down>"
    "<wheel-left>" "<wheel-right>"
    "<double-wheel-up>"   "<double-wheel-down>"
    "<double-wheel-left>" "<double-wheel-right>"
    "<triple-wheel-up>"   "<triple-wheel-down>"
    "<triple-wheel-left>" "<triple-wheel-right>"
    self-insert-command
  ])

  (setopt keycast-tab-bar-format km/keycast-format)
  (setopt tab-bar-format '(tab-bar-separator))
  (setopt keycast-tab-bar-location 'end)
  (setopt keycast-substitute-alist
    (mapcar (lambda (key) (list key none none)) km/keycast-ignore)
  )
  (setopt keycast-tab-bar-mode true)
  (add-hooks [post-command-hook] [tab-bar--update-tab-bar-lines])
)

;; Line numbers
(use-package emacs
  :ensure nil
  :config
  (setopt display-line-numbers-width-start true)
  (setopt global-display-line-numbers-mode true)
)

(use-package indent-bars
  :config
  (setopt indent-bars-depth-update-delay 0.0)
  (setopt indent-bars-display-on-blank-lines true)
  (setopt indent-bars-pattern "|")
  (setopt indent-bars-starting-column 0)
  (setopt indent-bars-treesit-support true)
  (setopt indent-bars-width-frac 0.1)
  (add-hooks [prog-mode-hook] [indent-bars-mode])
)

(use-package treemacs
  :config
  (setopt treemacs-file-extension-regex
          treemacs-first-period-regex-value)
  (setopt treemacs-indicate-top-scroll-mode false)
  (setq   treemacs-hide-dot-git-directory false)
  (setopt treemacs-silent-filewatch true)
  (setopt treemacs-user-mode-line-format 'none)
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)

  (setopt treemacs-indent-guide-mode true)
  (setopt treemacs-indent-guide-style 'line)
  (setopt treemacs-indentation-string
          #(" " 0 1 (face indent-bars-face)))
  (setopt treemacs-indentation 1)

  (setopt doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (treemacs)
)

;;; Flash on editing changes
(use-package evil-goggles
  :hook
  ((evil-mode) . #'evil-goggles-mode)
)

;;; Flash line on jump
(use-package pulsar
  :config
  (setopt pulsar-global-mode true)
)

(provide '+ui)
