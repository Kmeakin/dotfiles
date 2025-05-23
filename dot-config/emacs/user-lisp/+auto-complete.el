;; -*- lexical-binding: t; -*-

(require '+utils)

(use-package corfu
  :config
  (setopt corfu-auto true)
  (setopt corfu-preview-current false)
  (add-hooks [prog-mode-hook] [corfu-mode corfu-popupinfo-mode])
)

;;;; corfu
(comment
(use-package corfu
  :config
  ; (setopt tab-always-indent 'complete ) ; TAB key indents, then completes
  (setopt corfu-auto t ) ; Popup with completions

  ;; Don't update the text in the buffer while scrolling through the list of completions
  (setopt corfu-preview-current nil)
  (setopt corfu-auto-prefix 1)
  (setopt corfu-count 10)
  (setopt corfu-cycle t)
  (setopt corfu-on-exact-match 'show)
  (setopt corfu-preselect 'prompt)
  (setopt global-corfu-minibuffer nil)
  (setopt corfu-popupinfo-delay '(0.5 . 1.0))
  :hook
  ((prog-mode conf-mode) . #'corfu-mode)
  ((prog-mode conf-mode) . #'corfu-popupinfo-mode)
  :bind (:map corfu-map
    ("RET" . #'corfu-insert) ; Accept the completion, if selected. If not selected, quit completion
    ("TAB" . #'corfu-next)   ; Select the next completion
  )
)
)

(provide '+auto-complete)