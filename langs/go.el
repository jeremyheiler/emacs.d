(defun jh-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq tab-width 4 indent-tabs-mode 1))
(add-hook 'go-mode-hook 'jh-go-mode-hook)
