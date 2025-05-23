;; -*- lexical-binding: t; -*-

(require '+utils)

(defun km/reload-init-file ()
  "Reload the init file."
  (interactive)
  (load-file user-init-file)
  (normal-mode)
)

(setopt evil-want-keybinding false)
(setopt evil-want-integration true)

(use-package evil
  :config
  (setopt evil-symbol-word-search true)
  (setopt evil-mode true)
  (evil-set-leader nil (kbd "C-SPC"))
  (evil-set-leader '(normal visual motion) (kbd "SPC"))
)

(use-package evil-collection
  :config
  (evil-collection-init)
  (bind-keys :map global-map
    ;; https://lmno.lol/alvaro/hey-mouse-dont-mess-with-my-emacs-font-size
	  ("<pinch>"         . nil)
	  ("<C-wheel-up>"    . nil)
	  ("<C-wheel-down>"  . nil)
	     
	  ("<f5>" . km/reload-init-file)
	  ("s-r"  . execute-extended-command)
	  ("s-,"  . customize-group)
	  ("s-y"  . undo-redo)
	  ("<f8>" . km/next-error)
	)
  (define-key global-map (kbd "<leader>w")  '("Windows"            . (keymap)))
  (define-key global-map (kbd "<leader>wh") '("Focus window left"  . windmove-left))
  (define-key global-map (kbd "<leader>wj") '("Focus window down"  . windmove-down))
  (define-key global-map (kbd "<leader>wk") '("Focus window up"    . windmove-up))
  (define-key global-map (kbd "<leader>wl") '("Focus window right" . windmove-right))
  (define-key global-map (kbd "<leader>wo") '("Focus other window" . other-window))
  (define-key global-map (kbd "<leader>wd") '("Close window"       . delete-window))
  (define-key global-map (kbd "<leader>w/") '("Split window right" . split-window-right))
  (define-key global-map (kbd "<leader>w-") '("Split window below" . split-window-below))
  (define-key global-map (kbd "<leader>wv") '("Split window right" . split-window-right))
  (define-key global-map (kbd "<leader>ws") '("Split window below" . split-window-below))

  (define-key global-map (kbd "<leader>1") '("Focus 1st window" . winum-select-window-1))
  (define-key global-map (kbd "<leader>2") '("Focus 2nd window" . winum-select-window-2))
  (define-key global-map (kbd "<leader>3") '("Focus 3rd window" . winum-select-window-3))
  (define-key global-map (kbd "<leader>4") '("Focus 4th window" . winum-select-window-4))
  (define-key global-map (kbd "<leader>5") '("Focus 5th window" . winum-select-window-5))
  (define-key global-map (kbd "<leader>6") '("Focus 6th window" . winum-select-window-6))
  (define-key global-map (kbd "<leader>7") '("Focus 7th window" . winum-select-window-7))
  (define-key global-map (kbd "<leader>8") '("Focus 8th window" . winum-select-window-8))
  (define-key global-map (kbd "<leader>9") '("Focus 9th window" . winum-select-window-9))

  (define-key global-map (kbd "<leader>f")  '("Files"     . (keymap)))
  (define-key global-map (kbd "<leader>fs") '("Save file" . save-buffer))
  (define-key global-map (kbd "<leader>ff") '("Open file" . find-file))

  (define-key global-map (kbd "<leader>b")  '("Buffers"          . (keymap)))
  (define-key global-map (kbd "<leader>bb") '("Show all buffers" . switch-to-buffer))
  (define-key global-map (kbd "<leader>bn") '("Next buffer"      . next-buffer))
  (define-key global-map (kbd "<leader>bp") '("Previous buffer"  . previous-buffer))

  (define-key global-map (kbd "<leader>g")  '("Git"            . (keymap)))
  (define-key global-map (kbd "<leader>gs") '("Magit status"   . magit-status))
  (define-key global-map (kbd "<leader>gg") '("Magit dispatch" . magit-dispatch))
)

(use-package evil-commentary
  :config
  (setopt evil-commentary-mode true)
)

(provide '+keybindings)
