; 랜덤한 UUID 를 만들어낸다
; {A679190D-F4CC-4D13-966F-C053A640DBA8}
(defun just:randomUUID (/ typelib guid)

    (setq typelib (vlax-create-object "Scriptlet.TypeLib"))

    (setq guid (vlax-get-property typelib 'GUID))

    (vlax-release-object typelib)

    guid
)

; MAC 주소 조회 (WMI)
; "AA:BB:CC:DD:EE:FF" 형식 반환
(defun just:get-mac-address (/ loc svc col obj result)

    (if (setq loc (vlax-create-object "WbemScripting.SWbemLocator"))

        (progn

            (if (setq svc (vl-catch-all-apply 'vlax-invoke
                    (list loc 'ConnectServer "." "root\\cimv2")))

                (if (not (vl-catch-all-error-p svc))

                    (progn

                        (setq col
                            (vlax-invoke svc 'ExecQuery
                                "SELECT MACAddress FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True"
                            )
                        )

                        (vlax-for obj col
                            (if (and (null result) (vlax-get obj 'MACAddress))
                                (setq result (vlax-get obj 'MACAddress))
                            )
                        )

                        (if col (vlax-release-object col))
                        (vlax-release-object svc)
                    )
                )
            )

            (vlax-release-object loc)
        )
    )

    result
)

; (just:web-connect (list "https://www.naver.com/"))
; "Date: Thu, 05 Feb 2026 06:43:32 GMT\r\ncontent-type: text/html; charset=UTF-8\r\ntransfer-encoding: chunked\r\ncache-control: no-cache, no-store, must-revalidate\r\npragma: no-cache\r\nvary: User-Agent\r\nreferrer-policy: unsafe-url\r\nserver: nfront\r\n\r\n"
(defun just:web-connect ( serverList /

        http iv server response str
        *ERROR*
    )

    (defun *ERROR* ( err )    (princ))

    (setq http (vl-catch-all-apply 'vlax-create-object (list "MSXML2.XMLHTTP.6.0")))

    (if (and http (not (vl-catch-all-error-p http)))

        (progn

            (setq iv 0)

            (while

                (and

                    (= nil response)

                    (< iv (length serverList))

                    (setq server (nth iv serverList))
                )

                (setq iv (1+ iv))

                (setq response

                    (and

                        (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'open "GET" server :vlax-false)))

                        (= nil (vl-catch-all-apply 'vlax-invoke-method (list http 'send)))
                    )
                )

                (if response
                    (setq str
                        (vl-catch-all-apply 'vlax-invoke-method
                            (list http 'GetAllResponseHeaders)
                        )
                    )
                )
            )

            (vl-catch-all-apply 'vlax-release-object (list http))

            str
        )
    )
)
