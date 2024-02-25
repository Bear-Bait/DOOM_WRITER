;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

(package! evil-tutor)
;;
;;WORD-PROCESSING -- All these especailly usefull packages for word processing:
;;from https://christopherfin.com/writing/emacs-writing.html
;;
(package! langtool)
(package! mw-thesaurus)
(package! org-wc)
(package! dictionary)
(package! writegood-mode)
(package! artbollocks-mode)
(package! auctex)
(package! auctex-latexmk)
(package! pdf-tools)
(package! org-pdftools)
(package! diffpdf)
(package! pdfgrep)
(package! pdf-view-restore)
(package! synosaurus)
(package! wordnut)
(package! wc-mode)
(package! undo-tree)
(package! jinx)


;;a whole writerroom. let's try
(package! writeroom-mode)


;; Readers / file convertors. For reading and exporting various files types
;; used among publishing professors of greatness
(package! nov)
(package! calibredb)
(package! pandoc)
(package! pandoc-mode)
(package! poet-theme)
(package! ox-epub)
(package! neotree)

;; I will now try to learn about the scratch buffer. These pckgs are related to the scratch buffer.
(package! persistent-scratch)
(package! org-super-agenda)
(package! markdown-preview-eww)
(package! tidal)
(package! emms)
(package! chatgpt
  :recipe (:host github :repo "joshcho/ChatGPT.el" :files ("dist" "*.el")))
(package! web-mode) 


;; Translator
(package! go-translate)
(package! txl
  :recipe (:host github
           :repo "tmalsburg/txl.el"
           :files ("*.el" "~/.emacs.d/modules/tools/txl")))


  (package! guess-language)
(package! request)

;; ChatGPT 
(package! gptel)
(package! chatgpt-shell)
;; Mediawiki
(package! mediawiki)
(package! ox-mediawiki)
 
;; CSound
(package! mmm-mode
          :recipe (:local-repo "~/.emacs.d/modules/purcell-mmm-mode"
                   :files ("*.el" "~/.emacs.d/modules/purcell-mmm-mode")))
(package! csound-mode)
(package! skewer-mode)
(package! simple-httpd)
(package! js2-mode)
