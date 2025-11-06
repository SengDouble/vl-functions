(defun pop:assoc ( str value )

    (if (= 'list (type value) (type (car value)))

        (cadr (assoc str value))
    )
)

; 리스트에서 n 번째를 삭제한다.
(defun pop:RemoveNth ( n l / i )

    (setq i -1)

    (vl-remove-if '(lambda ( x ) (= (setq i (1+ i)) n)) l)
)