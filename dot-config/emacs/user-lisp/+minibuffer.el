;; -*- lexical-binding: t; -*-

(require '+utils)

(use-package vertico
  :config
  (setopt vertico-mode true)

  ;; https://github.com/minad/vertico/wiki#prefix-current-candidate-with-arrow
  (cl-defmethod vertico--format-candidate :around (cand prefix suffix index start)
    (setq cand (cl-call-next-method cand prefix suffix index start))
    (if (= vertico--index index)
        (concat #("» " 0 0 (face vertico-current)) cand)
        (concat #("  " 0 0 (display " ")) cand)
    )
  )
)

(use-package orderless
  :config
  (setopt orderless-component-separator " +\\|[-/]" ) ; Split components by space, hypen or slash
  (setopt completion-cycle-threshold t)
  (setopt completion-styles '(orderless basic partial-completion emacs22))
)

(use-package marginalia
  ; Has to go in `:init' rather than `:config'
  :init
  (setopt marginalia-mode true)
  :bind
  (:map minibuffer-local-map ("M-A" . marginalia-cycle))
)

(use-package embark
  :config
  (setopt embark-indicators '(
    embark-verbose-indicator
    embark-highlight-indicator
    embark-isearch-highlight-indicator
  ))
  (setopt embark-prompter #'embark-keymap-prompter)
  (setopt eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
  :bind
  ("s-." . embark-act)
  (:map embark-symbol-map
    ("h" . #'helpful-symbol)
  )
)

(use-package consult
  :bind
  ([remap switch-to-buffer] . #'consult-buffer)
)

(use-package embark-consult
  :after embark
)

(use-package which-key
  :config
  (setopt which-key-mode true)
  (setopt which-key-idle-delay 0.25)
  (setopt which-key-max-description-length none)
  (setopt which-key-show-docstrings true)
  (setopt which-key-show-prefix 'top)
  (setopt which-key-popup-type 'side-window)
  (setopt which-key-side-window-location 'bottom)
  (setopt which-key-sort-uppercase-first false)
  (setopt which-key-show-remaining-keys t)
  (setopt which-key-separator " : ")
  (setopt which-key-use-C-h-commands t)
)

(use-package nerd-icons)
(use-package nerd-icons-completion
  :after marginalia
  :config
  (setopt nerd-icons-completion-mode true) ;; in minibuffer
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup)
)
(use-package nerd-icons-corfu
  :config
  (add-hook 'corfu-margin-formatters #'nerd-icons-corfu-formatter)  ;; in capf
)
(use-package nerd-icons-dired
  :config
  (add-hooks [dired-mode-mode-hook] [nerd-icons-dired-mode]) ;; in dired
)

(provide '+minibuffer)
