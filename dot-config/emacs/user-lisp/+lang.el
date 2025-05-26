;; -*- lexical-binding: t; -*-

(require '+utils)

(use-package flycheck
  :config
  (add-hooks [prog-mode-hook] [flycheck-mode])
  (setopt next-error-recenter '(4))
  (setopt next-error-verbose false)
  (defun km/next-error ()
    "Go to the next error, cycling if no more errors."
    (interactive)
    (condition-case nil (flycheck-next-error 1 false)
      (user-error (flycheck-next-error 1 'reset))
      )
    )
)

(use-package highlight-numbers
  :config
  (add-hooks [prog-mode-hook] [highlight-numbers-mode])
)

(use-package highlight-escape-sequences
  :config
  (add-hooks [prog-mode-hook] [hes-mode])
)

(require '+lang/emacs-lisp)

(provide '+lang)
