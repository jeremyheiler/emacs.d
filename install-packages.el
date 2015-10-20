;; Run as: emacs --script install-packages.el

(require 'package)

;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(package-refresh-contents)

(defvar jh-packages
  '(cider
    clojure-mode
    racket-mode
    company
    paredit
    go-mode
    slime
    yaml-mode
    color-theme-sanityinc-solarized
    color-theme-sanityinc-tomorrow))

(dolist (p jh-packages)
  (when (not (package-installed-p p))
    (package-install p)))
