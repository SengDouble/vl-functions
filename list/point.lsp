; 좌표평면기준으로 보면 왼쪽-오른쪽 순서이므로 큰값부터 나와서 reverse
; X 축 기준 x 값이 큰 것 부터 정렬
(defun pop:sort:Reverse:X ( revs )

    (if (and (listp revs) (apply 'and (mapcar 'listp revs)))

        (vl-sort revs (function (lambda (e1 e2) (> (car e1) (car e2)))))
    )
)

; 좌표평면기준으로 보면 왼쪽-오른쪽 순서이므로 keep
; X 축 기준 x 값이 작은 것 부터 정렬
(defun pop:sort:Keep:X ( keep )

    (if (and (listp keep) (apply 'and (mapcar 'listp keep)))

        (vl-sort keep (function (lambda (e1 e2) (< (car e1) (car e2)))))
    )
)