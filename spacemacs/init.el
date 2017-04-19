;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
;   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   ;; ----------------------------------------------------------------
   ;; List of useful layers to have in Spacemacs. This should only list
   ;; layers to be loaded on /every/ system I install Spacemacs to. If a
   ;; layer should be loaded only on some of the systems, or loaded
   ;; everywhere but configured differently, then it belongs in /each/ of the
   ;; /other/ lists as appropriate, which follow.
   ;; ----------------------------------------------------------------
   dotspacemacs-configuration-layers
   '(
     better-defaults
     (colors :variables
             colors-enable-nyan-cat-progress-bar (display-graphic-p))
     deft
     emacs-lisp
     emoji
     git
     javascript
     markdown
     ;php   MJL20161218 Recursive Load issue (ACK'd on package's home page)
     (shell :variables
            shell-default-shell 'eshell
            shell-default-full-span nil
            shell-default-height 66
            shell-default-position 'top)
     spell-checking
     syntax-checking
     version-control
     xkcd
     yaml
     )
   )

  ;; ----------------------------------------------------------------
  ;; These list layers to load on specific platforms or systems
  ;; ----------------------------------------------------------------
  (setq
   ;; Layers to be loaded only on Macintosh
   mjl--darwin-layers
   '(
     osx
     (mjl :variables
          mjl-bind-osx-keys nil ; bound by osx layer
          mjl-bind-unix-keys nil ; don't exist on a Mac
          mjl-work-initials "MLo") ; Squiz-style initials
     )
   ;; Layers to be loaded only on GNU/Linux
   mjl--gnu/linux-layers
   '(
     (mjl :variables
          mjl-bind-osx-keys t
          mjl-bind-unix-keys t)
     )
   ;; Layers common to Unix systems
   mjl--nix-layers
   '(
     (clojure :variables
              clojure-enable-fancify-symbols t)
     graphviz
     scheme
     )
   )
  ;; ----------------------------------------------------------------
  ;; now append the layers lists depending on what the system is
  ;; ----------------------------------------------------------------

  ;; arrange layers lists first
  (setq  mjl--layers dotspacemacs-configuration-layers)
  (setq mjl--darwin-layers
        (append mjl--darwin-layers mjl--nix-layers)
        mjl--gnu/linux-layers
        (append mjl--gnu/linux-layers mjl--nix-layers))

  (cond ((eq system-type 'darwin)
         (setq mjl--layers (append mjl--layers mjl--darwin-layers)))
        ((eq system-type 'gnu/linux)
         (setq mjl--layers (append mjl--layers mjl--gnu/linux-layers))))

  (setq-default
   ;; ----------------------------------------------------------------
   ;; Now just set the master layers list from `mjl-layers' appended above
   ;; ----------------------------------------------------------------
   dotspacemacs-configuration-layers mjl--layers
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      idle-highlight-mode
                                      imenu-list
                                      minimap
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    php-extras ; MJL20151220 compilation errors
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

;; (defun dotspacemacs/layers ()
;;   "Configuration Layers declaration.
;; You should not put any user code in this function besides modifying the variable
;; values."
;;   (setq-default
;;    ;; Base distribution to use. This is a layer contained in the directory
;;    ;; `+distribution'. For now available distributions are `spacemacs-base'
;;    ;; or `spacemacs'. (default 'spacemacs)
;;    dotspacemacs-distribution 'spacemacs
;;    ;; Lazy installation of layers (i.e. layers are installed only when a file
;;    ;; with a supported type is opened). Possible values are `all', `unused'
;;    ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
;;    ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
;;    ;; lazy install any layer that support lazy installation even the layers
;;    ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
;;    ;; installation feature and you have to explicitly list a layer in the
;;    ;; variable `dotspacemacs-configuration-layers' to install it.
;;    ;; (default 'unused)
;;    dotspacemacs-enable-lazy-installation 'unused
;;    ;; If non-nil then Spacemacs will ask for confirmation before installing
;;    ;; a layer lazily. (default t)
;;    dotspacemacs-ask-for-lazy-installation t
;;    ;; If non-nil layers with lazy install support are lazy installed.
;;    ;; List of additional paths where to look for configuration layers.
;;    ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
;;    dotspacemacs-configuration-layer-path '()
;;    ;; List of configuration layers to load.
;;    dotspacemacs-configuration-layers
;;    '(
;;      html
;;      ansible
;;      auto-completion
;;      better-defaults
;;      deft
;;      emacs-lisp
;;      git
;;      github
;;      go
;;      helm
;;      markdown
;;      nginx
;;      org
;;      osx
;;      rust
;;      semantic
;;      syntax-checking
;;      version-control
;;      yaml
;;      javascript
;;      )
;;    ;; List of additional packages that will be installed without being
;;    ;; wrapped in a layer. If you need some configuration for these
;;    ;; packages, then consider creating a layer. You can also put the
;;    ;; configuration in `dotspacemacs/user-config'.
;;    dotspacemacs-additional-packages '(vcl-mode
;;                                       jinja2-mode
;;                                       molokai-theme
;;                                       org-alert
;;                                       gotham-theme
;;                                       gnuplot-mode
;;                                       )
;;    ;; A list of packages that cannot be updated.
;;    dotspacemacs-frozen-packages '()
;;    ;; A list of packages that will not be installed and loaded.
;;    dotspacemacs-excluded-packages '()
;;    ;; Defines the behaviour of Spacemacs when installing packages.
;;    ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
;;    ;; `used-only' installs only explicitly used packages and uninstall any
;;    ;; unused packages as well as their unused dependencies.
;;    ;; `used-but-keep-unused' installs only the used packages but won't uninstall
;;    ;; them if they become unused. `all' installs *all* packages supported by
;;    ;; Spacemacs and never uninstall them. (default is `used-only')
;;    dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(gotham
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.5
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."


  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq alert-default-style 'notifier)

  (setq exec-path-from-shell-arguments (list "-i" "-l"))
  (setq exec-path-from-shell-check-startup-files nil)


  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

  (setq deft-directory "~/Documents/org/notes")

  (setq golden-ratio-mode t
        helm-follow-mode-persistent t
        global-linum-mode t
        projectile-enable-caching t
        require-final-newline t
        mode-require-final-newline t
        )

  (setq-default dotspacemacs-configuration-layers
                '((shell
                   :variables
                   shell-default-shell 'ansi-term
                   shell-default-term-shell "bin/zsh")))

  (setq-default dotspacemacs-configuration-layers
                '((shell :variables
                         shell-default-position 'bottom
                         shell-default-height 30)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; MAGIT                                                                  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq magit-commit-show-diff nil
        magit-revert-buffers 1)

  ;; ;; ORG MODE -------------------------------------------------------------------------------
  ;; A great resource: http://doc.norang.ca/org-mode.html#OrgFiles
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


  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist
        `(("." . ,(concat spacemacs-cache-directory "undo"))))
  (unless (file-exists-p (concat spacemacs-cache-directory "undo"))
    (make-directory (concat spacemacs-cache-directory "undo")))


  ;; fontify code in code blocks
  (setq org-src-fontify-natively t)


  ;; default xemacs configuration directory
  (defconst my:emacs-config-dir "/Users/wijnand/dotfiles/spacemacs/config/" "")

  ;; utility function to auto-load my package configurations
  (defun my:load-config-file (filelist)
    (dolist (file filelist)
      (load (expand-file-name
             (concat my:emacs-config-dir file)))
      (message "Loaded config file:%s" file)
      ))
  ;; (my:load-config-file '("slack.el"))

)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "5b24babd20e58465e070a8d7850ec573fe30aca66c8383a62a5e7a3588db830b" default)))
 '(deft-auto-save-interval 10.0)
 '(deft-directory "~/Documents/org/notes" t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#232A2F")
 '(helm-source-names-using-follow (quote ("Grep")))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-custom-commands
   (quote
    (("z" "Personal" agenda ""
      ((org-agenda-start-on-weekday 1)
       (org-agenda-span 7)
       (org-agenda-category-filter-preset
        (quote
         ("+personal")))))
     ("x" "Work" agenda ""
      ((org-agenda-start-on-weekday nil)
       (org-agenda-span 2)))
     ("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-agenda-files nil)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down time-up priority-down category-keep)
     (todo priority-down category-down)
     (tags priority-down category-keep)
     (search category-keep))))
 '(org-agenda-todo-ignore-scheduled (quote all))
 '(package-selected-packages
   (quote
    (gh marshal logito pcache winum unfill powerline pcre2el
 spinner hydra parent-mode projectile request fuzzy pkg-info epl
 flx smartparens iedit anzu evil goto-chg undo-tree highlight
 diminish company-ansible bind-map bind-key packed f dash s helm
 avy helm-core async popup tern toml-mode racer seq cargo
 rust-mode base16-ocean-dark-theme go-guru swift-mode org-alert
 gnuplot-mode haml-mode web-completion-data color-theme-solarized
 sql-indent nginx-mode yapfify pyvenv pytest pyenv-mode py-isort
 pip-requirements live-py-mode hy-mode helm-pydoc cython-mode
 company-anaconda anaconda-mode pythonic slack emojify circe
 oauth2 websocket ht nyan-mode company-emacs-eclim eclim
 solarized-theme skewer-mode simple-httpd json-snatcher
 json-reformat multiple-cursors js2-mode dash-functional
 markdown-mode go-mode company inf-ruby yasnippet auto-complete
 org alert log4e gntp mwim gitignore-mode fringe-helper
 git-gutter+ git-gutter flyspell-correct-helm flyspell-correct
 pos-tip flycheck magit magit-popup git-commit with-editor
 auto-dictionary define-word zonokai-theme zenburn-theme
 zen-and-art-theme yaml-mode xterm-color ws-butler
 window-numbering which-key web-mode web-beautify
 volatile-highlights vi-tilde-fringe vcl-mode uuidgen use-package
 underwater-theme ujelly-theme twilight-theme
 twilight-bright-theme twilight-anti-bright-theme tronesque-theme
 toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme
 tango-2-theme tagedit sunny-day-theme sublime-themes
 subatomic256-theme subatomic-theme stickyfunc-enhance
 stekene-theme srefactor spacemacs-theme spaceline
 spacegray-theme soothe-theme soft-stone-theme soft-morning-theme
 soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop
 seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode
 rubocop rspec-mode robe reverse-theme reveal-in-osx-finder
 restclient restart-emacs rbenv rake rainbow-delimiters
 railscasts-theme quelpa purple-haze-theme pug-mode
 professional-theme popwin planet-theme phoenix-dark-pink-theme
 phoenix-dark-mono-theme persp-mode pbcopy pastels-on-dark-theme
 paradox ox-gfm osx-trash osx-dictionary orgit
 organic-green-theme org-projectile org-present org-pomodoro
 org-plus-contrib org-download org-bullets open-junk-file
 omtose-phellack-theme oldlace-theme occidental-theme
 obsidian-theme ob-http noctilux-theme niflheim-theme neotree
 naquadah-theme mustang-theme multi-term move-text monokai-theme
 monochrome-theme molokai-theme moe-theme mmm-mode minitest
 minimal-theme material-theme markdown-toc majapahit-theme
 magit-gitflow magit-gh-pulls macrostep lush-theme lorem-ipsum
 livid-mode linum-relative link-hint light-soap-theme
 less-css-mode launchctl json-mode js2-refactor js-doc
 jinja2-mode jbeans-theme jazz-theme ir-black-theme
 insert-shebang inkpot-theme info+ indent-guide ido-vertical-mode
 hungry-delete htmlize hl-todo highlight-parentheses
 highlight-numbers highlight-indentation hide-comnt heroku-theme
 hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile
 helm-mode-manager helm-make helm-gitignore helm-flx
 helm-descbinds helm-css-scss helm-company helm-c-yasnippet
 helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme
 grandshell-theme gotham-theme google-translate golden-ratio
 go-eldoc gnuplot github-search github-clone github-browse-file
 gitconfig-mode gitattributes-mode git-timemachine git-messenger
 git-link git-gutter-fringe git-gutter-fringe+ gist gh-md
 gandalf-theme flycheck-pos-tip flx-ido flatui-theme
 flatland-theme fish-mode firebelly-theme fill-column-indicator
 farmhouse-theme fancy-battery eyebrowse expand-region
 exec-path-from-shell evil-visualstar evil-visual-mark-mode
 evil-unimpaired evil-tutor evil-surround
 evil-search-highlight-persist evil-numbers evil-nerd-commenter
 evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus
 evil-iedit-state evil-exchange evil-escape evil-ediff evil-args
 evil-anzu eval-sexp-fu espresso-theme eshell-z
 eshell-prompt-extras esh-help emmet-mode elisp-slime-nav
 dumb-jump dracula-theme django-theme diff-hl deft
 darktooth-theme darkokai-theme darkmine-theme darkburn-theme
 dakrone-theme cyberpunk-theme company-web company-tern
 company-statistics company-shell company-go column-enforce-mode
 colorsarenice-theme color-theme-sanityinc-tomorrow
 color-theme-sanityinc-solarized coffee-mode clues-theme
 clean-aindent-mode chruby cherry-blossom-theme busybee-theme
 bundler bubbleberry-theme birds-of-paradise-plus-theme
 badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile
 aurora-theme apropospriate-theme anti-zenburn-theme ansible-doc
 ansible ample-zen-theme ample-theme alect-themes
 aggressive-indent afternoon-theme adaptive-wrap ace-window
 ace-link ace-jump-helm-line ac-ispell)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values
   (quote
    ((org-todo-keyword-faces
      ("ANSWER" . "orange")
      ("ARCHIVED" . "blue")
      ("DATE" . "red")
      ("DOING" . "yellow")
      ("DONE" . "green")
      ("HPSM" . "red")
      ("JIRA" . "red")
      ("TODO" . org-warning)
      ("WAITING" . "orange")))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#2B3B40")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#74CBC4")
     (40 . "#74CBC4")
     (60 . "#C2E982")
     (80 . "#FFC400")
     (100 . "#C792EA")
     (120 . "#C792EA")
     (140 . "#546D7A")
     (160 . "#546D7A")
     (180 . "#FF516D")
     (200 . "#9FC59F")
     (220 . "#859900")
     (240 . "#F77669")
     (260 . "#FF516D")
     (280 . "#82B1FF")
     (300 . "#82B1FF")
     (320 . "#82B1FF")
     (340 . "#D9F5DD")
     (360 . "#FFCB6B"))))
 '(vc-annotate-very-old-color "#FFCB6B")
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
