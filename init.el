(setq *win32* (eq system-type 'windows-nt))
(if *win32*
    (progn (setenv "HOME" "D:/Tool/emacs-24.3")
	   (setenv "PATH" "D:/Tool/emacs-24.3")))

(setq default-directory "~/")

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(print load-path)


;;禁止初始化界面
(setq inhibit-startup-message t)

;;设置elpa的源
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;set English font
(if *win32* 
    (set-face-attribute 'default nil :font "Consolas 12"))

;;set Chinese font "Microsoft Yahei"
(if *win32*
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset "-outline-幼圆-normal-normal-normal-mono-16-*-*-*-c-*-gb2312.1980-0")))

(print (fontset-font (frame-parameter nil 'font) ?我))

;;设置行号
(global-linum-mode 1)

(require 'init-elpa)
(require 'init-evil)
(require 'init-scheme)

;;初始化smex
(eval-after-load "smex-autoloads"
  '(progn (smex-initialize)
	  (global-set-key "\M-x" 'smex)))

;;将highlight-parentheses设置成为全局mode
;;http://www.emacswiki.org/emacs/HighlightParentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
;;关闭备份 (不生成 filename~)
(setq backup-inhibited 1)

;;设置窗口为最大化
(if *win32*
    (w32-send-sys-command 61488))

;;开启括号匹配, 关闭输入括号时候跳一下的设置
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

;;设置lisp用的ParEdit模式
(autoload 'paredit-mode "paredit"
            "Minor mode for pseudo-structurally editing Lisp code."
              t)
