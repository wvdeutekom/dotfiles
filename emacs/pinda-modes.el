;; show column numbers
(column-number-mode t)

;; don't show the menubar
(menu-bar-mode -1)

;; highlight the current line
(global-hl-line-mode t)

;; projectile for project management
(projectile-global-mode)
(setq projectile-ack-function 'ag)

;; deletes region when starting typing
(pending-delete-mode t)

;; auto revert changes on disk
(global-auto-revert-mode t)

;; enable powerline mode
(setq powerline-arrow-shape 'curve)
(powerline-default-theme)

;; indent after newline
(electric-indent-mode t)

;; recently opened files
(recentf-mode 1)
(setq recentf-max-saved-items 30)
(add-to-list 'recentf-exclude "\\/tmp\\'" "~/.ido.last")

;; javascript and json
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(custom-set-variables  
 '(js2-basic-offset 4)  
 '(js2-bounce-indent-p t)  
)

;; whitespace
(setq whitespace-style
      '(face tabs spaces trailing lines space-before-tab
             newline indentation space-after-tab tab-mark newline-mark)
      whitespace-display-mappings
      '((space-mark   ?\    [?\xB7]     [?.])     ; space
        (space-mark   ?\xA0 [?\xA4]     [?_])     ; hard space
        (newline-mark ?\n   [?\xAB ?\n] [?$ ?\n]) ; end-of-line
        ))

;; auto completion
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)    ; don't automatically trigger auto-complete
(ac-set-trigger-key "TAB")  ; only trigger auto-completion on TAB

;; ack
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; ag (the silver searcher)
(require 'ag)
(setq ag-highlight-search t)

;; websites
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("django"    . "\\.html\\'"))
)

;; dired
(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)

;; ido-mode
(ido-mode t)
(ido-ubiquitous-mode t)
(flx-ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-use-faces nil                ; don't use faces because we have flx
      ido-use-filename-at-point nil
      ido-max-prospects 10
      ido-ignore-buffers
      '("\\` " "^\\*ESS\\*" "^\\*Messages\\*" "^\\*Help\\*" "^\\*Buffer"
        "^\\*.*Completions\\*$" "^\\*Ediff" "^\\*tramp" "^\\*cvs-"
        "_region_" " output\\*$" "^TAGS$" "^\*Ido")
      ido-ignore-directories
      '("\\`auto/" "\\`auto-save-list/" "\\`backups/" "\\`semanticdb/"
        "\\`target/" "\\`\\.git/" "\\`\\.svn/" "\\`CVS/" "\\`\\.\\./"
        "\\`\\./")
      ido-ignore-files
      '("\\`auto/" "\\.prv/" "_region_" "\\.class/"  "\\`CVS/" "\\`#"
        "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.hi$" "\\.org_archive$"))

; auto-fill
(add-hook 'html-mode-hook 'turn-off-auto-fill)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'clojure-mode-hook 'my-auto-fill-prog)

;; flyspell
(add-hook 'clojure-mode-hook 'flyspell-prog-mode)
(add-hook 'haskell-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'git-commit-mode-hook 'turn-on-flyspell)
(setq flyspell-issue-message-flag nil)             ; don't show a message, slows things down.

;; PO
(setq auto-mode-alist
      (cons '("\\.po\\'\\|\\.po\\." . po-mode) auto-mode-alist))
(autoload 'po-mode "po-mode" "Major mode for translators to edit PO files" t)

;; markdown
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.page" . markdown-mode) auto-mode-alist))
(add-hook 'markdown-mode-hook 'turn-on-pandoc)

;; edit rest documentation
(add-to-list 'auto-mode-alist '("\\.http$" . restclient-mode))

;; window movement
(setq windmove-wrap-around t)

;; nice visualation of undo's
(global-undo-tree-mode t)

;; jump to the last place you were in the file
(require 'saveplace)
(setq save-place-file "~/.emacs.d/saved-places")
(setq-default save-place t)

;; smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(sp-use-paredit-bindings)
(sp-local-pair 'web-mode "{%" "%}")
(sp-local-pair 'web-mode "{{" "}}")
(sp-local-pair 'web-mode "{" nil :actions nil)
(smartparens-global-mode t)

;; cleanup modeline
(diminish 'projectile-mode)
(diminish 'auto-complete-mode)
(diminish 'undo-tree-mode)

(provide 'pinda-modes)
