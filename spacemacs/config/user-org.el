  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ORG MODE                                                               ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; A great resource: http://doc.norang.ca/org-mode.html#OrgFiles
  (cond ((eq system-type 'darwin)
         (setq deft-directory "~/Documents/org/notes"))
        ((eq system-type 'gnu/linux)
         (setq deft-directory "/media/psf/Home/Documents/work/org/notes/")))


  (setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

  (setq org-todo-keyword-faces
        '(("TODO" . org-warning )
          ("IN-PROGRESS" . "yellow")
          ("WAITING" . "yellow")
          )
        )
  (setq org-time-clocksum-format '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

  (setq org-default-notes-file "~/Documents/org/notes/todo.org")
  (setq org-agenda-files (list "~/Documents/org/notes/todo.org"
                               "~/Documents/org/notes/personal.org"))
  ;; Automatically load files from disk
  (add-hook 'org-mode-hook 'auto-revert-mode)

  ;; Fix table alignment by setting a monospaced font
  (setq default-frame-alist '((font . "Monaco-12")))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; org-mode agenda options                                                ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; open agenda in current window
  (setq org-agenda-window-setup (quote current-window))
  ;;warn me of any deadlines in next 7 days
  (setq org-deadline-warning-days 7)
  ;;show me tasks scheduled or due in next fortnight
  (setq org-agenda-span (quote fortnight))
  ;;don't show tasks as scheduled if they are already shown as a deadline
  (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
  ;;don't give a warning colour to tasks with impending deadlines
  ;;if they are scheduled to be done
  (setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
  ;;don't show tasks that are scheduled or have deadlines in the
  ;;normal todo list
  (setq org-agenda-todo-ignore-deadlines (quote all))
  (setq org-agenda-todo-ignore-scheduled (quote all))
  ;;sort tasks in order of when they are due and then by priority
  ;; (setq org-agenda-sorting-strategy
  ;;   (quote
  ;;   ((agenda deadline-up priority-down)
  ;;     (todo priority-down category-up)
  ;;     (tags priority-down category-keep)
  ;;     (search category-keep))))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Documents/org/notes/todo.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/Documents/org/notes/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")))
