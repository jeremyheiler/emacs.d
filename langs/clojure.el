(require 'clojure-mode)
(require 'cider)

(setq cider-repl-display-help-banner nil)

(add-hook 'clojure-mode-hook #'enable-paredit-mode)

(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-mode-hook #'company-mode)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'enable-paredit-mode)

(defun op-clojure-sort-ns ()
  "Internally sort each sexp inside the ns form."
  (interactive)
  (comment-normalize-vars)
  (if (clojure-find-ns)
      (save-excursion
        (goto-char (match-beginning 0))
        (let ((beg (point))
              (ns))
          (forward-sexp 1)
          (setq ns (buffer-substring beg (point)))
          (forward-char -1)
          (while (progn (forward-sexp -1)
                        (looking-at "(:[a-z]"))
            (save-excursion
              (forward-char 1)
              (forward-sexp 1)
              (clojure--sort-following-sexps)))
          (goto-char beg)
          (if (looking-at (regexp-quote ns))
              (message "ns form is already sorted")
            (message "ns form has been sorted")
            (sleep-for 0.1))))
    (user-error "Namespace not found")))

(defun jhi-clojure-sort-ns ()
  "Internally sort each sexp inside the ns form."
  (interactive)
  (comment-normalize-vars)
  (if (clojure-find-ns)
      (save-excursion
        (goto-char (match-beginning 0))
        ;;(redisplay)
        (let ((beg (point))
              (ns))
          (forward-sexp 1)
          (setq ns (buffer-substring beg (point)))
          (forward-char -1)
          (while (progn (forward-sexp -1)
                        (looking-at "(:[a-z]"))
            (save-excursion
              (forward-char 1)
              (forward-sexp 1)
              (clojure--sort-following-sexps)))
          (goto-char beg)
          (if (looking-at (regexp-quote ns))
              (message "ns form is already sorted")
            (sleep-for 0.1)
            ;;(redisplay)
            (message "ns form has been sorted")
            (sleep-for 0.1))))
    (user-error "Can't find ns form")))

(add-hook
 'clojure-mode-hook
 (lambda ()
   (add-hook 'before-save-hook 'jhi-clojure-sort-ns)))

(eval-after-load 'clojure-mode
  '(sayid-setup-package))

(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljc$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("\\.cljx$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

(define-clojure-indent
  (defroutes 'defun)
  (defroutes 'defun)
  (for-all   'defun)
  (fact      'defun)
  (facts     'defun)
  (future-fact 'defun)
  (future-facts 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (Given 2)
  (When  2)
  (Then  2)
  (context 2)
  (describe 'defun)
  (context 'defun)
  (it 2)
  (should 2))

(global-set-key (kbd "C-c r") 'cider-ns-refresh)
