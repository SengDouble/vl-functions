; Return response text from a URL using MSXML2.XMLHTTP.
; Example:
; (SD:http-get-client "https://www.naver.com")
; => "<!doctype html>..."
(defun SD:http-get-client ( url / http response-text )

    (if (= 'str (type url))

        (progn

            (setq http
                (vl-catch-all-apply 'vlax-create-object (list "MSXML2.XMLHTTP"))
            )

            (if (not (vl-catch-all-error-p http))

                (progn

                    (if
                        (and
                            (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'open "GET" url :vlax-false)))
                            (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'send)))
                        )

                        (progn

                            (setq response-text
                                (vl-catch-all-apply 'vlax-get (list http 'responseText))
                            )

                            (if (vl-catch-all-error-p response-text)
                                (setq response-text nil)
                            )
                        )
                    )

                    (vl-catch-all-apply 'vlax-release-object (list http))
                )
            )
        )
    )

    response-text
)

; Return response text from a URL using MSXML2.ServerXMLHTTP.
; Example:
; (SD:http-get-server "https://www.naver.com")
; => "<!doctype html>..."
(defun SD:http-get-server ( url / http response-text )

    (if (= 'str (type url))

        (progn

            (setq http
                (vl-catch-all-apply 'vlax-create-object (list "MSXML2.ServerXMLHTTP"))
            )

            (if (not (vl-catch-all-error-p http))

                (progn

                    (vl-catch-all-apply 'vlax-invoke-method
                        (list http 'setTimeouts 0 60000 60000 60000)
                    )

                    (if
                        (and
                            (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'open "GET" url :vlax-false)))
                            (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'send)))
                        )

                        (progn

                            (setq response-text
                                (vl-catch-all-apply 'vlax-get (list http 'responseText))
                            )

                            (if (vl-catch-all-error-p response-text)
                                (setq response-text nil)
                            )
                        )
                    )

                    (vl-catch-all-apply 'vlax-release-object (list http))
                )
            )
        )
    )

    response-text
)

; Return response headers from the first reachable URL in the URL list.
; Example:
; (SD:get-first-response-headers (list "https://www.naver.com/"))
; => "Date: Thu, 05 Feb 2026 06:43:32 GMT\r\ncontent-type: text/html; charset=UTF-8\r\n..."
(defun SD:get-first-response-headers ( url-list /

        http index url success headers result
    )

    (if (= 'list (type url-list))

        (progn

            (setq http
                (vl-catch-all-apply 'vlax-create-object (list "MSXML2.XMLHTTP.6.0"))
            )

            (if (not (vl-catch-all-error-p http))

                (progn

                    (setq index 0)

                    (while

                        (and
                            (null result)
                            (< index (length url-list))
                        )

                        (setq url (nth index url-list))
                        (setq index (1+ index))

                        (if (= 'str (type url))

                            (progn

                                (setq success

                                    (and

                                        (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'open "GET" url :vlax-false)))

                                        (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'send)))
                                    )
                                )

                                (if success

                                    (progn

                                        (setq headers
                                            (vl-catch-all-apply 'vlax-invoke-method
                                                (list http 'GetAllResponseHeaders)
                                            )
                                        )

                                        (if (not (vl-catch-all-error-p headers))
                                            (setq result headers)
                                        )
                                    )
                                )
                            )
                        )
                    )

                    (vl-catch-all-apply 'vlax-release-object (list http))
                )
            )
        )
    )

    result
)

; Return the HTTP status code from a URL using MSXML2.ServerXMLHTTP.
; Tries HEAD first and falls back to GET when HEAD is unavailable.
; Common status codes:
; 200  Success
; 301  Moved permanently
; 302  Moved temporarily
; 400  Bad request
; 401  Authentication required
; 403  Forbidden
; 404  Not found
; 500  Server error
; Example:
; (SD:http-get-status-code "https://www.naver.com")
; => 200
(defun SD:http-get-status-code ( url / http method status-code )

    (if (= 'str (type url))

        (progn

            (setq http
                (vl-catch-all-apply 'vlax-create-object (list "MSXML2.ServerXMLHTTP"))
            )

            (if (not (vl-catch-all-error-p http))

                (progn

                    (vl-catch-all-apply 'vlax-invoke-method
                        (list http 'setTimeouts 0 60000 60000 60000)
                    )

                    (foreach method (list "HEAD" "GET")

                        (if (or (null status-code) (member status-code (list 405 501)))

                            (progn

                                (setq status-code nil)

                                (if
                                    (and
                                        (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'open method url :vlax-false)))
                                        (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'send)))
                                    )

                                    (progn

                                        (setq status-code
                                            (vl-catch-all-apply 'vlax-get (list http 'status))
                                        )

                                        (if (vl-catch-all-error-p status-code)
                                            (setq status-code nil)
                                        )
                                    )
                                )
                            )
                        )
                    )

                    (vl-catch-all-apply 'vlax-release-object (list http))
                )
            )
        )
    )

    status-code
)
