;; Run as: emacs --script install-packages.el

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-pinned-packages '((cider . "melpa-stable")
                                (clj-refactor . "melpa-stable")))

(package-initialize)
(package-refresh-contents)

(defvar jh-packages
  '(;;avy
    better-defaults
    cider
    ;;clj-refactor
    clojure-mode
    ;;haskell-mode
    racket-mode
    company
    paredit
    ;;go-mode
    ;;ponylang-mode
    ;;slime
    ;;yaml-mode
    markdown-mode
    ;;color-theme-sanityinc-solarized
    ;;color-theme-sanityinc-tomorrow
    ;;warm-night-theme
    sublime-themes))

(dolist (p jh-packages)
  (when (not (package-installed-p p))
    (package-install p)))
