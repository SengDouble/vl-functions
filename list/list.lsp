(defun pop:assoc ( str value )

    (if (= 'list (type value) (type (car value)))

        (cadr (assoc str value))
    )
)