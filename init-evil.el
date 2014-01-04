;;设置evil-mode在启动时被开启

;;在evil被加载前设置的变量
(setq evil-want-C-u-scroll t)

(eval-after-load "evil-autoloads" 
  '(progn 
     (evil-mode 1)
     ))

(provide 'init-evil)
