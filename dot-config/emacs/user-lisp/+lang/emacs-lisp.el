;; -*- lexical-binding: t; -*-

(require '+utils)

;;;; elisp
;;;;; Highlighting
(use-package highlight-defined
  :hook
  ((emacs-lisp-mode) . #'highlight-defined-mode)
)

(use-package highlight-quoted
  :hook
  ((emacs-lisp-mode) . #'highlight-quoted-mode)
)

(use-package macrostep
  :bind (:map emacs-lisp-mode-map
  ("C-c e" . #'macrostep-expand)
  )
)

(use-package outline
  :hook
  ((emacs-lisp-mode) . #'outline-minor-mode)
  :config
  (setopt outline-blank-line true)
  (setopt outline-minor-mode-highlight true)
  (setopt outline-minor-mode-use-buttons 'in-margins)
)

(use-package flycheck
  :config
  (setopt flycheck-emacs-lisp-check-declare true)
  (setopt flycheck-emacs-lisp-load-path 'inherit)
)

(setopt initial-scratch-message ";; -*- lexical-binding: t; -*-\n")

;;;;; Documentation
(use-package helpful
  :bind
  ;; remap the commands, instead of using `defalias', because some
  ;; other commands (eg `corfu-popupinfo') still need to use the old
  ;; `describe-' functions
  ([remap describe-function] . #'helpful-callable)
  ([remap describe-key]      . #'helpful-key)
  ([remap describe-variable] . #'helpful-variable)
  ([remap describe-symbol]   . #'helpful-symbol)
)

(use-package elisp-demos
  :config
  (advice-add 'describe-function-1 :after #'elisp-demos-advice-describe-function-1)
  (advice-add 'helpful-update      :after #'elisp-demos-advice-helpful-update)
)

(use-package elisp-refs)

(use-package eros
  :hook (emacs-lisp . eros-mode)
)

(use-package eros-inspector
)

(use-package emacs
  :config
  (setopt bind-key-describe-special-forms t)
  (setopt describe-bindings-outline t)
  (setopt describe-bindings-show-prefix-commands t)
  (setopt describe-char-unidata-list t)
  (setopt help-enable-symbol-autoload t)
  (setopt help-enable-variable-value-editing t)
  (setopt help-window-keep-selected t)
  (setopt help-window-select t)
  (setopt what-cursor-show-names t)
)

;;;;; Custom
(use-package emacs
  :config
  (setopt custom-face-default-form 'all)
  (setopt custom-magic-show 'long)
  (setopt custom-unlispify-tag-names nil)
  (setopt eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
)

(provide '+lang/emacs-lisp)
