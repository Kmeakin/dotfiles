;; -*- lexical-binding: t; -*-

(add-to-list 'load-path (locate-user-emacs-file "user-lisp"))
(require '+utils)

(section "Debugging"
  (defvar *km/debug* (bound-and-true-p init-file-debug))
  (setopt debug-on-error *km/debug*)
  (setopt force-load-messages *km/debug*)
  (setopt debugger-stack-frame-as-list true)
  (setopt message-log-max true)
)

(section "Shut up!"
  (setopt save-silently true)
  (setopt jka-compr-verbose false)

  ;; Ignore some annoying errors in interactive commands:
  (defconst *km/ignored-command-errors* '(
    beginning-of-buffer end-of-buffer
    beginning-of-line   end-of-line
  ))
  (defun km/command-error-function (data context caller)
    (unless (memq (car data) *km/ignored-command-errors*)
      (command-error-default-function data context caller)
    )
  )
  (setopt command-error-function #'km/command-error-function)
)

(section "Performance"
  (section "Garbage collection"
    (defconst km/gc-cons-threshold--saved  gc-cons-threshold)
    (defconst km/gc-cons-percentage--saved gc-cons-percentage)
    (setq gc-cons-threshold  most-positive-fixnum)
    (setq gc-cons-percentage 0.6)
    (after-init
     (setq gc-cons-threshold  km/gc-cons-threshold--saved)
     (setq gc-cons-percentage km/gc-cons-percentage--saved)
    )
  )

  (section "Processes"
    (setopt read-process-output-max (* 2 1024 1024))
    (setopt process-adaptive-read-buffering true)
  )

  (section "Bidirectional text"
    (setopt inhibit-compacting-font-caches true)
  )
)

(section "Compilation"
  ;; Prefer loading newer compiled files
  (setopt load-prefer-newer true)

  (section "Byte Compilation"
    (setopt byte-compile-verbose  *km/debug*)
    (setopt byte-compile-warnings *km/debug*)
  )

  (section "Native Compilation"
    (setopt package-native-compile true)
    (setopt native-comp-async-report-warnings-errors *km/debug*)
    (setopt native-comp-async-report-warnings-errors (or *km/debug* 'silent))
    (setopt native-comp-verbose (if *km/debug* 1 0))
    (setopt native-comp-warning-on-missing-source *km/debug*)
    (setopt warning-suppress-log-types '((lexical-binding)))

    ;; Setup `exec-path' and `PATH' so that `gcc' is found by the
    ;; native compiler.
    (when (eq system-type 'darwin)
      (setopt exec-path `(
        "/opt/homebrew/opt/binutils/bin"
        "/opt/homebrew/opt/llvm/bin"
        "/opt/homebrew/sbin"
        "/opt/homebrew/bin"
        "/usr/bin"
        "/bin"
        "/usr/sbin"
        "/sbin"
        ,exec-directory
      ))
      (setenv "PATH" (string-join exec-path path-separator))
    )
  )
)

(section "UI"
  (setopt initial-frame-alist `(
    (fullscreen . maximized)
    (ns-transparent-titlebar . ,true)
  ))
)

(section "Startup time"
  (defun km/startup-time ()
    (message "Emacs loaded in %.2f seconds"
      (float-time (time-subtract after-init-time before-init-time))
    )
  )
  (advice-add 'display-startup-echo-area-message :override #'km/startup-time)
)

(section "package.el"
  (setopt use-package-compute-statistics *km/debug*)
  (setopt use-package-expand-minimally (not *km/debug*))
  (setopt use-package-minimum-reported-time 0)
  (setopt use-package-verbose *km/debug*)
  (setopt use-package-always-ensure true)
  (setopt use-package-enable-imenu-support true)
  (setopt package-archives '(
    ("gnu"    . "https://elpa.gnu.org/packages/")
    ("nongnu" . "https://elpa.nongnu.org/nongnu/")
    ("melpa"  . "https://melpa.org/packages/")
  ))
  (setopt package-archive-priorities '(
    ("gnu"    . 99)
    ("nongnu" . 80)
    ("melpa"  . 70)
  ))
)
