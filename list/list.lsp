; Return the value associated with the key in a key-value list.
; Supports both list pairs and dotted pairs when the value is not a list.
; Use a consistent dotted-pair format when list values must be stored.
; Example:
; (SD:assoc-value "name" '(("name" "Alice") ("age" 30)))
; => "Alice"
; (SD:assoc-value "age" '(("name" . "Alice") ("age" . 30)))
; => 30
(defun SD:assoc-value ( key alist / pair value )

    (if (= 'list (type alist))

        (progn

            (setq pair (assoc key alist))

            (if pair

                (progn

                    (setq value (cdr pair))

                    (if (= 'list (type value))
                        (car value)
                        value
                    )
                )
            )
        )
    )
)

; Remove the item at the zero-based index from the list.
; Example:
; (SD:remove-nth 1 '(10 20 30))
; => (10 30)
(defun SD:remove-nth ( index lst / counter )

    (if (and (= 'int (type index)) (<= 0 index) (= 'list (type lst)))

        (progn

            (setq counter -1)

            (vl-remove-if
                '(lambda ( x )
                    (= (setq counter (1+ counter)) index)
                )
                lst
            )
        )
    )
)

; Remove duplicate items from the list while preserving the original order.
; Example:
; (SD:remove-duplicates '(10 20 10 30 20))
; => (10 20 30)
(defun SD:remove-duplicates ( lst / item result )

    (if (= 'list (type lst))

        (progn

            (foreach item lst

                (if (not (member item result))
                    (setq result (cons item result))
                )
            )

            (reverse result)
        )
    )
)

; Insert an item at the zero-based index in the list.
; Appends the item when the index is greater than the list length.
; Example:
; (SD:insert-nth 20 1 '(10 30))
; => (10 20 30)
; (SD:insert-nth 20 0 nil)
; => (20)
(defun SD:insert-nth ( item index lst )

    (if (and (= 'int (type index)) (<= 0 index) (listp lst))

        (if (and lst (< 0 index))

            (cons (car lst) (SD:insert-nth item (1- index) (cdr lst)))

            (cons item lst)
        )
    )
)
