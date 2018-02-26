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
    clj-refactor
    clojure-mode
    ;;color-theme-sanityinc-solarized
    ;;color-theme-sanityinc-tomorrow
    company
    ;;erlang
    git-gutter
    go-mode
    gruvbox-theme
    ;;haskell-mode
    helm
    magit
    markdown-mode
    paredit
    ;;ponylang-mode
    python-mode
    racket-mode
    ;;slime
    sublime-themes
    ;;warm-night-theme
    yaml-mode))

(dolist (p jh-packages)
  (when (not (package-installed-p p))
    (package-install p)))
