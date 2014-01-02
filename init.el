(setenv "HOME" "D:/Tool/emacs-24.3")
(setenv "PATH" "D:/Tool/emacs-24.3")

(setq default-directory "~/")

;;设置elpa的源
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;set English font
(set-face-attribute 'default nil :font "Consolas 12")
;;
;;set Chinese font "Microsoft Yahei"
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset "-outline-幼圆-normal-normal-normal-mono-16-*-*-*-c-*-gb2312.1980-0"))

(print (fontset-font (frame-parameter nil 'font) ?我))

;;设置行号
(linum-mode 1)

;;设置evil-mode在启动时被开启
(eval-after-load "evil-autoloads" 
  '(evil-mode 1))

;;初始化smex
(eval-after-load "smex-autoloads"
  '(progn (smex-initialize)
	  (global-set-key "\M-x" 'smex)))

;;关闭备份 (不生成 filename~)
(setq backup-inhibited 1)
