;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(defconst true  t)
(defconst false nil)
(defconst none   nil)
(defalias 'set-option 'setq!)

(set-option shell-file-name (executable-find "bash"))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(set-option user-full-name    "Karl Meakin")
(set-option user-mail-address "karl.meakin@arm.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setopt doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light))
;; (setopt doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(set-option doom-font "Fira Code 15")
(set-option custom-safe-themes true)
(set-option doom-theme 'doom-solarized-dark)
(load-theme doom-theme)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(set-option display-line-numbers-type true)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(set-option org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! which-key
  (set-option which-key-idle-delay 0.25)
  (set-option which-key-max-description-length none)
  (set-option which-key-show-docstrings false)
)

(map! :leader
      :desc "Commands" "SPC" #'execute-extended-command
      :desc "Focus 0th window" "0" #'winum-select-window-0
      :desc "Focus 1st window" "1" #'winum-select-window-1
      :desc "Focus 2nd window" "2" #'winum-select-window-2
      :desc "Focus 3rd window" "3" #'winum-select-window-3
      :desc "Focus 4th window" "4" #'winum-select-window-4
      :desc "Focus 5th window" "5" #'winum-select-window-5
      :desc "Focus 6th window" "6" #'winum-select-window-6
      :desc "Focus 7th window" "7" #'winum-select-window-7
      :desc "Focus 8th window" "8" #'winum-select-window-8
      :desc "Focus 9th window" "9" #'winum-select-window-9

      :prefix "w"
      :desc "Split vertically"   "/" #'evil-window-vsplit
      :desc "Split horizontally" "-" #'evil-window-split

      :prefix "f"
      :desc "Save all files"           "a" (cmd! (save-some-buffers 'noconfirm))
      :desc "Save file w/o formatting" "S" (cmd! (let ((current-prefix-arg 2)) (call-interactively #'save-buffer)))
      :desc "Search files with `fd'"   "/" #'consult-fd
)

