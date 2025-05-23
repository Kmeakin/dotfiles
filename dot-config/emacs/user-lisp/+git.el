;; -*- lexical-binding: t; -*-

(require '+utils)

(use-package magit
  :config
  (setopt evil-collection-magit-want-horizontal-movement t)
  (setopt magit-section-initial-visibility-alist '((t . show)))
  (setopt magit-section-visibility-indicator '(magit-fringe-bitmap+ . magit-fringe-bitmap-))
  (setopt magit-status-goto-file-position nil)
  (setopt magit-status-headers-hook '(
    magit-insert-error-header
    magit-insert-diff-filter-header
    magit-insert-repo-header
    magit-insert-remote-header
    magit-insert-head-branch-header
    magit-insert-upstream-branch-header
    magit-insert-push-branch-header
    magit-insert-tags-header
  ))
)

(use-package diff-hl
  :config
  (setopt diff-hl-update-async true)
  (add-hooks [prog-mode-hook text-mode-hook conf-mode-hook]
             [diff-hl-mode diff-hl-flydiff-mode diff-hl-show-hunk-mouse-mode])
  (add-hooks [dired-mode-hook] [diff-hl-dired-mode])
  (add-hooks [magit-post-refresh-hook] [diff-hl-magit-post-refresh])
)

(provide '+git)
