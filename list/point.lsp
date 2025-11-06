; Descending
; xAxis
; 큰값 - 작은값
(defun pop:sort:Descending:X ( des )

    (if (and (listp des) (apply 'and (mapcar 'listp des)))

        (vl-sort des (function (lambda (e1 e2) (> (car e1) (car e2)))))
    )
)

; ascending
; xAxis
; 작은값 - 큰값
(defun pop:sort:ascending:X ( asc )

    (if (and (listp asc) (apply 'and (mapcar 'listp asc)))

        (vl-sort asc (function (lambda (e1 e2) (< (car e1) (car e2)))))
    )
)

; Descending
; yAxis
; 큰값 - 작은값
(defun pop:sort:Descending:Y ( des )

    (if (and (listp des) (apply 'and (mapcar 'listp des)))

        (vl-sort des (function (lambda (e1 e2) (> (cadr e1) (cadr e2)))))
    )
)

; ascending
; yAxis
; 작은값 - 큰값
(defun pop:sort:ascending:Y ( asc )

    (if (and (listp asc) (apply 'and (mapcar 'listp asc)))

        (vl-sort asc (function (lambda (e1 e2) (< (cadr e1) (cadr e2)))))
    )
)

