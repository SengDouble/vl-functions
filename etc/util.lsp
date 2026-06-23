; Create a random UUID string using Scriptlet.TypeLib.
; Example:
; (vlq:generate-uuid)
; => "{A679190D-F4CC-4D13-966F-C053A640DBA8}"
(defun vlq:generate-uuid (/ typelib guid)

    (setq typelib
        (vl-catch-all-apply 'vlax-create-object (list "Scriptlet.TypeLib"))
    )

    (if (not (vl-catch-all-error-p typelib))

        (progn

            (setq guid
                (vl-catch-all-apply 'vlax-get-property (list typelib 'GUID))
            )

            (vlax-release-object typelib)

            (if (not (vl-catch-all-error-p guid))
                guid
            )
        )
    )
)

; Return the current date and time as a filename-friendly timestamp.
; Example:
; (vlq:get-datetime-stamp)
; => "20260618-143012"
(defun vlq:get-datetime-stamp (/ timestamp)

    (setq timestamp
        (vl-catch-all-apply 'menucmd
            (list "M=$(edtime,$(getvar,date),YYYYMODD-HHMMSS)")
        )
    )

    (if (and (not (vl-catch-all-error-p timestamp)) (= 'str (type timestamp)))
        timestamp
    )
)

; Return the MAC address of the first IP-enabled network adapter using WMI.
; Example:
; (vlq:get-mac-address)
; => "AA:BB:CC:DD:EE:FF"
(defun vlq:get-mac-address (/ locator service adapters adapter mac result)

    (setq locator
        (vl-catch-all-apply 'vlax-create-object (list "WbemScripting.SWbemLocator"))
    )

    (if (not (vl-catch-all-error-p locator))

        (progn

            (setq service
                (vl-catch-all-apply 'vlax-invoke
                    (list locator 'ConnectServer "." "root\\cimv2")
                )
            )

            (if (not (vl-catch-all-error-p service))

                (progn

                    (setq adapters
                        (vl-catch-all-apply 'vlax-invoke
                            (list service 'ExecQuery
                                "SELECT MACAddress FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True"
                            )
                        )
                    )

                    (if (not (vl-catch-all-error-p adapters))

                        (progn

                            (vlax-for adapter adapters

                                (if (null result)

                                    (progn

                                        (setq mac
                                            (vl-catch-all-apply 'vlax-get
                                                (list adapter 'MACAddress)
                                            )
                                        )

                                        (if (and (not (vl-catch-all-error-p mac)) mac)
                                            (setq result mac)
                                        )
                                    )
                                )
                            )

                            (vl-catch-all-apply 'vlax-release-object (list adapters))
                        )
                    )

                    (vl-catch-all-apply 'vlax-release-object (list service))
                )
            )

            (vl-catch-all-apply 'vlax-release-object (list locator))
        )
    )

    result
)
