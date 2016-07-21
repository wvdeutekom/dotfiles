(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; Make linums relative by default
  ;; (global-linum-mode nil)
  ;; (linum-relative-toggle)
  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.post\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

  (setq helm-follow-mode-persistent t
    global-linum-mode t
    golden-ratio-mode t
    require-final-newline t
    mode-require-final-newline t
  )
  (with-eval-after-load 'org
    ;; here goes your Org config :)
    ;; ....
    'org (setq org-agenda-files
               '("~/Dropbox/orgmode/notes/"))
  )

  (spacemacs|define-custom-layout "dotfiles"
    :binding "d"
    :body
    (find-file "~/.spacemacs.d/config/user-config.el")
    (split-window-right)
    (find-file "~/dotfiles/spacemacs/init.el")
    )

  (spacemacs|define-custom-layout "infra"
    :binding "i"
    :body
    (find-file "~/Documents/Blendle/infrastructure/production/inventory")
    (split-window-right)
    (find-file "~/Documents/Blendle/infrastructure/playbook.yml")
  )

  (spacemacs|define-custom-layout "clippingtool"
    :binding "c"
    :body
    (find-file "~/Documents/Blendle/clippingtool2/Dockerfile")
    (split-window-right)
    (find-file "~/Documents/Blendle/clippingtool2/docker-compose.yml")
    )

  (spacemacs|define-custom-layout "brom"
    :binding "b"
    :body
    (find-file "~/go/src/github.com/wvdeutekom/brom/monitor/datadog.go")
    (split-window-right)
    (find-file "~/go/src/github.com/wvdeutekom/brom/main.go")
    )

  (spacemacs|define-custom-layout "restclient"
    :binding "r"
    :body
    (find-file "~/Documents/restclient")
    )
)
