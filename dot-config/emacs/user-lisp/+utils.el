;; -*- lexical-binding: t; -*-

(defmacro section (_name &rest body)
  "Define a section of code.

Just a simple wrapper around `progn', but allows you to attatch a name.
"
  (declare (indent defun))
  `(progn ,@body)
)

(defmacro after-init (&rest body)
  "Run BODY after initialization."
  (declare (indent defun))
  `(add-to-list 'after-init-hook #'(lambda () ,@body))
)

(defmacro comment (&rest _body)
  "Ignore BODY."
  (declare (indent defun))
)

(defconst true t)
(defconst false nil)
(defconst none nil)

(defun add-hooks (hooks funs)
  "Add each of FUNS to each of HOOKS."
  (seq-doseq (hook hooks)
    (seq-doseq (fun funs)
      (add-hook hook fun)
    )
  )
)

(provide '+utils)
