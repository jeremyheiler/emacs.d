(add-to-list 'load-path "~/.emacs.d/ponylang-mode")

(require 'ponylang-mode)

(add-hook 'ponylang-mode-hook
	  (lambda ()
	    (set-variable 'indent-tabs-mode nil)
	    (set-variable 'tab-width 2)))
