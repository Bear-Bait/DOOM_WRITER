;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-itch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-opera-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Nextcloud/Writing/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;; Here I will enter my special little thesaurus api from Webster, whcih can be accessed using M-x mw-thesaurus.
(setq mw-thesaurus-api-key "3896b6e2-1e27-4e5a-bc0f-036a25074588")
;;
;; Olivetti: the tool that does beautiful centering of text.
(add-to-list 'load-path "~/.emacs.d/modules/editor/olivetti/")
(require 'olivetti)
;;
;; Native PDF Settings to be used without LaTex (chatgpt)
;;
(pdf-tools-install)
(require 'ox-epub)
(setq org-pdftools-pdf-style "modern")
(setq org-export-pdf-text-markup-alist
      '((bold . "\\textbf{%s}")
        (code . "\\texttt{%s}")
        (italic . "\\emph{%s}")
        (strike-through . "\\sout{%s}")
        (underline . "\\underline{%s}")
        (verbatim . "\\verb|%s|")
        (verbatim-subscript . "\\textsubscript{\\verb|%s|}")))
(setq org-latex-title-command "\\maketitle")
(setq org-latex-pdf-title "Your Title")
(setq org-latex-pdf-author "Your Name")

(setq org-latex-packages-alist
      '(("AUTO" "babel" t)
        ("AUTO" "polyglossia" t)
        ("AUTO" "csquotes" t)
        ("TOPLEVEL" "fontspec" t)))
(after! org
  (add-to-list 'org-export-backends 'latex))
;;
;;some configs inspired by  https://zzamboni.org/post/my-doom-emacs-configuration-with-commentary/
;;genreally just trying to make orgmode look better for writing and edditng.
;;
(setq doom-modeline-enable-word-count t)
(setq auto-save-default t
      make-backup-files t)

(defun toggle-line-spacing ()
  "toggle line spacing between no extra space to extra half line height.
url `http://xahlee.info/emacs/emacs/emacs_toggle_line_spacing.html'
version 2017-06-02"
  (interactive)
  (if line-spacing
         (setq line-spacing nil)
       (setq line-spacing .75))
     (redraw-frame (selected-frame)))


;; Distraction-free screen
;;
;;
(use-package olivetti
  :init
  (setq olivetti-body-width 0.67)
  (setq olivetti-recall-visual-line-mode-entry-state t)
  :config
  (defun distraction-free ()
    "Distraction-free writing environment"
    (interactive)
    (if (equal olivetti-mode nil)
        (progn
          (window-configuration-to-register 1)
          (delete-other-windows)
          (text-scale-increase 2)
          (toggle-line-spacing)
          (display-line-numbers-mode 0)
          (olivetti-mode t))
      (progn
        (jump-to-register 1)
        (olivetti-mode 0)
        (display-line-numbers-mode 1)
        (toggle-line-spacing)
        (text-scale-decrease 1))))

  :bind
  (("<f9>" . (lambda ()
               (interactive)
               (distraction-free)
               (writegood-mode)
               (auto-save-visited-mode)
               (wc-mode)
               (turn-on-flyspell)
               (wordnut-lookup-current-word)
               (oxford-dictionary-lookup-current-word)
               (magit-mode)
               (undo-tree-mode)
               (synosaurus-mode))))  ;; Add these lines

  )

(use-package writegood-mode)
(use-package synosaurus)
(use-package wordnut)
(use-package wc-mode)
(use-package magit)
(use-package undo-tree)
;;(setq auto-save-visited-interval 1)
;;(setq auto-save-visited-file-name-format
  ;    (concat auto-save-visited-directory-prefix
   ;;          (if auto-save-visited-duration
   ;;               (format-time-string "-%Y-%m-%dT%H:%M:%S" nil t)
    ;;            "-no-duration")
      ;;        ".autosave"))




;; LaTex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)

;; EXWM STUFF
;;
(setq display-time-24hr-format 1)
(setq display-time-day-and-date 1)
(display-time-mode 1)



;; Load exwm
;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)
;
;
;
;;(require 'exwm-systemtray)
;;(exwm-systemtray-enable)
;


;;(require 'exwm-randr)
;;(add-hook 'exwm-randr-screen-change-hook
;;          (lambda ()
;;           (start-process-shell-command
;;             "xrandr" nil "xrandr --output DP-1 connected primary 1440x900+1365+0 (normal left inverted right x axis y axis) 408mm x 255mm --output eDP-1 connected 1366x768+0+0 (normal left inverted right x axis y axis) 293mm x 165mm")))
;;(setq exwm-randr-workspace-output-plist '(0 "DP-1" 1 "DP-1" 2 "eDP-1" 3 "eDP-1"))
;;(setq exwm-randr-workspace-output-plist (seq-reduce (lambda (acc s) (cons s (cons "HDMI-2" acc))) (number-sequence 8 0 -2) '()))
;;(setq exwm-workspace-number 9)
;;(exwm-randr-enable)

;;(exwm-enable)

;;  auto-save-default makes copies of your files in ~/.emacs.d/.local/cache/{autosave,backup}, then deletes them when you save the buffer. After a crash, they can be restored with M-x and recover-file, recover-session, or recover-this-file.#
(setq auto-save-default t)




(setq tidal-boot-script-path "/home/forrest/.cabal/store/ghc-8.8.4/tidal-1.9.4-68a9272203dd68c2f382ee1bb0a71d8bd852d873af75856ab2533dea6cb56d7b/share/BootTidal.hs")



;;https://github.com/joshcho/ChatGPT.el
(use-package! chatgpt
  :defer t
  :config
  (unless (boundp 'python-interpreter)
   (defvaralias 'python-interpreter 'python-shell-interpreter))
  (setq chatgpt-repo-path (expand-file-name "straight/repos/ChatGPT.el/" doom-local-dir))
(set-popup-rule! (regexp-quote "*ChatGPT*")
  :side 'bottom :size .5 :ttl nil :quit t :modeline nil )
  :bind ("C-c q" . chatgpt-query))


;;
;;https://github.com/emacs-openai/chatgpt API: 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
;;(use-package! chatgpt :ensure t)
;;(add-to-list 'load-path "~/.emacs.d/modules/tools/chatgpt/")
;;(require 'chatgpt)
;; Define a new keybinding for changing the theme to gruvbox-light
;;(map! :leader
;;    :desc "Switch to Gruvbox Light theme"
;;     "<f8>" #'(lambda () (interactive) (load-theme 'gruvbox-light t)))

;; Load any other packages and configuration you need below this line


;;ChatGPT suggested for global undo-tree
;; undo-tree mode globally at startup
(add-hook 'after-init-hook 'undo-tree-mode)
(after! undo-tree
  (global-undo-tree-mode +1))

;; ChatGPT suggests
;;(use-package opera-light
;;  :ensure t
;;  :config
;;  (setq doom-theme 'opera-light))
;;
;;
;; your languages pair used to translate
;;
(add-to-list 'load-path "~/.emacs.d/modules/tools/go-translate")
(require 'go-translate)

(setq gts-translate-list '(("fr" "en")))

;; (setq gts-default-translator (gts-translator :engines (gts-bing-engine)))

(setq gts-default-translator
      (gts-translator
       :picker (gts-prompt-picker)
       :engines (list (gts-deepl-engine :auth-key "695247c2-5937-1ab7-312b-47b9401d02f3:fx")(gts-google-engine))
       :render (gts-buffer-render)))


;; txl for deepl https://github.com/tmalsburg/txl.el

(require 'txl)
(setq txl-languages '(FR . EN-US))
(setq txl-deepl-api-key "695247c2-5937-1ab7-312b-47b9401d02f3:fx")
(setq txl-deepl-api-url "https://api-free.deepl.com/v2/translate")
(global-set-key (kbd "C-x t")   'txl-translate-region-or-paragraph)


;; Enable tramp mode for remote file editing
(setq tramp-default-method "ssh")

;; Set undo tree global


;; Map or ReMap Keybindings according chatgpt and https://discourse.doomemacs.org/t/how-to-re-bind-keys/56
(map! "C-c t" #'gts-do-translate)
(map! "C-c j" #'evil-join)

;; ChatGPT GPTel: https://github.com/karthink/gptel API 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
;; (load! "/home/forrest/.emacs.d/.local/elpa/gptel-20240205.623/gptel-ollama.el")
(use-package! gptel
 :config)
;; (setq! gptel-api-key "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"))


;; Configs for JINX spell checker https://elpa.gnu.org/packages/jinx.html1
;;(use-package jinx
;;  :defer t  ; Defer loading until it's needed
;;  :init
;;/  (add-hook 'emacs-startup-hook #'global-jinx-mode)
;;  :bind
;;  (:map jinx-mode-map
 ;;       ("M-$" . jinx-correct)
;;:        ("C-M-$" . jinx-languages)))


;; Mediawiki
(after! mediawiki
  (setq mediawiki-site-alist
        '(("BookClub" "https://deadmall.llc/mediawiki/" "forrest" "Angel1516AOC"))))

(after! ox-mediawiki
  (setq org-mediawiki-server-url "https://deadmall.llc/mediawiki/"
        org-mediawiki-user "forrest"
        org-mediawiki-publish-url "https://deadmall.llc/mediawiki/index.php"))

;; Add your custom function
(defun my-whats-that-squiggle ()
  (interactive)
  (let* ((interesting-properties '(flycheck-error flyspell-overlay flymake-overlay))
         (present-properties (cl-remove-if-not
                              (lambda (p) (get-char-property (point) p))
                              interesting-properties)))
    (if present-properties
        (message "This squiggle represents: %s"
                 (mapconcat 'symbol-name present-properties ", "))
      (message "No interesting properties present"))))
