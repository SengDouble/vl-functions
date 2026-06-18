; Sort point list by X coordinate in descending order.
; Example:
; (SD:sort-x-descending '((3.0 0.0 0.0) (9.0 0.0 0.0) (6.0 0.0 0.0)))
; => ((9.0 0.0 0.0) (6.0 0.0 0.0) (3.0 0.0 0.0))
(defun SD:sort-x-descending ( lst )

    (if (SD:point-p lst)

        (vl-sort lst
            (function
                (lambda (e1 e2)
                    (> (car e1) (car e2))
                )
            )
        )
    )
)

; Sort point list by X coordinate in ascending order.
; Example:
; (SD:sort-x-ascending '((3.0 0.0 0.0) (9.0 0.0 0.0) (6.0 0.0 0.0)))
; => ((3.0 0.0 0.0) (6.0 0.0 0.0) (9.0 0.0 0.0))
(defun SD:sort-x-ascending ( lst )

    (if (SD:point-p lst)

        (vl-sort lst
            (function
                (lambda (e1 e2)
                    (< (car e1) (car e2))
                )
            )
        )
    )
)

; Sort point list by Y coordinate in descending order.
; Example:
; (SD:sort-y-descending '((0.0 3.0 0.0) (0.0 9.0 0.0) (0.0 6.0 0.0)))
; => ((0.0 9.0 0.0) (0.0 6.0 0.0) (0.0 3.0 0.0))
(defun SD:sort-y-descending ( lst )

    (if (SD:point-p lst)

        (vl-sort lst
            (function
                (lambda (e1 e2)
                    (> (cadr e1) (cadr e2))
                )
            )
        )
    )
)

; Sort point list by Y coordinate in ascending order.
; Example:
; (SD:sort-y-ascending '((0.0 3.0 0.0) (0.0 9.0 0.0) (0.0 6.0 0.0)))
; => ((0.0 3.0 0.0) (0.0 6.0 0.0) (0.0 9.0 0.0))
(defun SD:sort-y-ascending ( lst )

    (if (SD:point-p lst)

        (vl-sort lst
            (function
                (lambda (e1 e2)
                    (< (cadr e1) (cadr e2))
                )
            )
        )
    )
)

; Check whether all items in the list are valid points.
; Example:
; (SD:point-p '((0.0 3.0 0.0) (0.0 9.0 0.0)))
; => T
(defun SD:point-p ( est )

    (and
        (= 'list (type est))
        (apply 'and
            (mapcar
                '(lambda ( pt )
                    (and
                        (= 'list (type pt))
                        (numberp (car  pt))
                        (numberp (cadr pt))
                    )
                ) est
            )
        )
    )
)
