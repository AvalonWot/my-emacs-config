;;����evil-mode������ʱ������

;;��evil������ǰ���õı���
(setq evil-want-C-u-scroll t)

(eval-after-load "evil-autoloads" 
  '(progn 
     (evil-mode 1)
     ))

(provide 'init-evil)
