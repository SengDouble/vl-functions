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
