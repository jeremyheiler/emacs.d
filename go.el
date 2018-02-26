;;(require 'go-mode-autoloads)

(defun jh-go-mode-hook ()

  ;; set tab width
  ;;(setq tab-width 4 indent-tabs-mode 1)
  (setq tab-width 4)

  ;; call gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command) "go build -v && go test -v && go vet"))

  ;; godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)

  )

(add-hook 'go-mode-hook 'jh-go-mode-hook)
