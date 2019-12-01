;; Run as: emacs --script install-packages.el

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-pinned-packages '((cider . "melpa-stable") (clj-refactor . "melpa-stable")))

(package-initialize)
(package-refresh-contents)

(defvar jh/packages
  '(better-defaults
    cider
    ;;clj-refactor
    clojure-mode
    company
    git-gutter
    ;;go-mode
    gruvbox-theme
    helm
    js2-mode
    js2-refactor
    magit
    markdown-mode
    paredit
    projectile
    ;;pony-mode
    racket-mode
    ;;rustic
    sayid
    slime
    slime-company
    sublime-themes
    terraform-mode
    web-mode
    xref-js2
    yaml-mode))

(dolist (p jh/packages)
  (when (not (package-installed-p p))
    (package-install p)))
