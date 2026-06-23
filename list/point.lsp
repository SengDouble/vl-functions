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

; (SD:point-centroid (list (getpoint)(getpoint)))
; Return the average center point of a point list.
; Returns a 3D point when every input point has a numeric Z coordinate.
; Example:
; (SD:point-centroid '((0.0 0.0 0.0) (10.0 0.0 0.0) (10.0 10.0 0.0) (0.0 10.0 0.0)))
; => (5.0 5.0 0.0)
(defun SD:point-centroid ( lst / pt count sum-x sum-y sum-z has-z )

    (if (and (SD:point-p lst) lst)

        (progn

            (setq count 0)
            (setq sum-x 0.0)
            (setq sum-y 0.0)
            (setq sum-z 0.0)
            (setq has-z T)

            (foreach pt lst

                (setq count (1+ count))
                (setq sum-x (+ sum-x (car pt)))
                (setq sum-y (+ sum-y (cadr pt)))

                (if (numberp (caddr pt))
                    (setq sum-z (+ sum-z (caddr pt)))
                    (setq has-z nil)
                )
            )

            (if has-z
                (list (/ sum-x count) (/ sum-y count) (/ sum-z count))
                (list (/ sum-x count) (/ sum-y count))
            )
        )
    )
)