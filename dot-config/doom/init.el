;;; $DOOMDIR/init.el -*- lexical-binding: t; apheleia-inhibit: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :completion
       ;;company
       (corfu +orderless +icons)
       ;;helm
       ;;ido
       ;;ivy
       (vertico +icons +childframe)

       :ui
       ;;deft                                ; notational velocity for Emacs
       doom                                  ; what makes DOOM look the way it does
       doom-dashboard                        ; a nifty splash screen for Emacs
       ;;doom-quit                           ; DOOM quit-message prompts when you quit Emacs
       ;;(emoji +unicode)                    ; 🙂
       hl-todo                               ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides                         ; highlighted indent columns
       ligatures                             ; ligatures and symbols to make your code pretty again
       ;;minimap                             ; show a map of the code on the side
       modeline                              ; snazzy, Atom-inspired modeline, plus API
       nav-flash                             ; blink cursor line after big motions
       ;; neotree                            ; a project drawer, like NERDTree for vim
       ophints                               ; highlight the region an operation acts on
       ;; (popup +defaults)                  ; tame sudden yet inevitable temporary windows
       (smooth-scroll +interpolate)          ; So smooth you won't believe it's not butter
       tabs                                  ; a tab bar for Emacs
       (treemacs +lsp)                       ; a project drawer, like neotree but cooler
       ;;unicode                             ; extended unicode support for various languages
       (vc-gutter +pretty)                   ; vcs diff in the fringe
       ;;vi-tilde-fringe                     ; fringe tildes to mark beyond EOB
       (window-select +numbers)              ; visually switch windows
       ;;workspaces                          ; tab emulation, persistence & separate workspaces
       ;;zen                                 ; distraction-free coding or writing

       :editor
       (evil +everywhere)                    ; come to the dark side, we have cookies
       file-templates                        ; auto-snippets for empty files
       fold                                  ; (nigh) universal code folding
       (format +onsave +lsp)                 ; automated prettiness
       ;;god                                 ; run Emacs commands without modifier keys
       ;;lispy                               ; vim for lisp, for people who don't like vim
       multiple-cursors                      ; editing in many places at once
       ;;objed                               ; text object editing for the innocent
       ;;parinfer                            ; turn lisp into python, sort of
       rotate-text                           ; cycle region at point between text candidates
       snippets                              ; my elves. They type so I don't have to
       word-wrap                             ; soft wrapping with language-aware indent

       :emacs
       (dired +icons)                        ; making dired pretty [functional]
       electric                              ; smarter, keyword-based electric-indent
       ;;eww                                 ; the internet is gross
       ibuffer                               ; interactive buffer management
       (undo +tree)                          ; persistent, smarter undo for your inevitable mistakes
       vc                                    ; version-control and Emacs, sitting in a tree

       :term
       eshell                                ; the elisp shell that works everywhere
       shell                                 ; simple shell REPL for Emacs
       term                                  ; basic terminal emulator for Emacs
       vterm                                 ; the best terminal emulation in Emacs

       :checkers
       (syntax +icons)                       ; tasing you for every semicolon you forget
       ;;(spell +flyspell)                   ; tasing you for misspelling mispelling
       ;;grammar                             ; tasing grammar mistake every you make

       :tools
       ;;ansible
       ;;biblio                              ; Writes a PhD for you (citation needed)
       ;;collab                              ; buffers with friends
       debugger                              ; FIXME stepping through code, to help you add bugs
       direnv
       ;;docker
       editorconfig                          ; let someone else argue about tabs vs spaces
       ;;ein                                 ; tame Jupyter notebooks with emacs
       (eval +overlay)                       ; run code, run (also, repls)
       lookup                                ; navigate your code and its documentation
       ;;llm                                 ; when I said you needed friends, I didn't mean...
       lsp                                   ; M-x vscode
       (magit +forge)                        ; a git porcelain for Emacs
       make                                  ; run make tasks from Emacs
       pass                                  ; password manager for nerds
       ;;pdf                                 ; pdf enhancements
       ;;terraform                           ; infrastructure as code
       ;;tmux                                ; an API for interacting with tmux
       tree-sitter                           ; syntax and parsing, sitting in a tree...
       upload                                ; map local to remote projects via ssh/ftp

       :os
       (:if (featurep :system 'macos) macos) ; improve compatibility with macOS
       tty                                   ; improve the terminal Emacs experience

       :lang
       ;;agda
       ;;beancount
       (cc +lsp +tree-sitter)
       ;;clojure
       ;;common-lisp
       ;;coq
       ;;crystal
       ;;csharp
       data
       ;;(dart +flutter)
       ;;dhall
       ;;elixir
       ;;elm
       emacs-lisp
       ;;erlang
       ;;ess
       ;;factor
       ;;faust
       ;;fortran
       ;;fsharp
       ;;fstar
       ;;gdscript
       ;;(go +lsp)
       ;;(graphql +lsp)
       ;;(haskell +lsp)
       ;;hy
       ;;idris
       (json +lsp +tree-sitter)
       ;;janet
       ;;(java +lsp)
       ;;javascript
       ;;julia
       ;;kotlin
       ;;latex
       ;;lean
       ;;ledger
       (lua +lsp +tree-sitter)
       markdown
       ;;nim
       (nix +lsp +tree-sitter)
       ;;ocaml
       org
       ;;php
       ;;plantuml
       ;;graphviz
       ;;purescript
       (python +lsp +tree-sitter)
       ;;qt
       ;;racket
       ;;raku
       ;;rest
       rst
       ;;(ruby +rails)
       (rust +lsp +tree-sitter)
       ;;scala
       ;;(scheme +guile)
       (sh +fish +lsp +tree-sitter)
       ;;sml
       ;;solidity
       ;;swift
       ;;terra
       ;;web
       (yaml +lsp +tree-sitter)
       ;;zig

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere
       ;;irc
       ;;(rss +org)

       :config
       (default +bindings +smartparens)
       ;;literate
)
