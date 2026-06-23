; Website and browser helpers.
; Functions in this file open URLs through a specific browser or the system shell.

; Open a URL in a new Google Chrome window.
; Example:
; (vlq:open-url-chrome "https://www.naver.com")
; => nil
(defun vlq:open-url-chrome ( url / chrome result )

    (if (= 'str (type url))

        (progn

            (or
                (setq chrome (findfile "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"))
                (setq chrome (findfile "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"))
            )

            (if (= 'str (type chrome))

                (setq result
                    (vl-catch-all-apply 'startapp
                        (list chrome (strcat "--new-window \"" url "\""))
                    )
                )
            )
        )
    )

    (if (vl-catch-all-error-p result)
        nil
        result
    )
)

; Open a URL in a new Microsoft Edge window.
; Example:
; (vlq:open-url-edge "https://www.naver.com")
; => nil
(defun vlq:open-url-edge ( url / edge result )

    (if (= 'str (type url))

        (progn

            (or
                (setq edge (findfile "C:\\Program Files\\Microsoft\\Edge\\Application\\msedge.exe"))
                (setq edge (findfile "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe"))
            )

            (if (= 'str (type edge))

                (setq result
                    (vl-catch-all-apply 'startapp
                        (list edge (strcat "--new-window \"" url "\""))
                    )
                )
            )
        )
    )

    (if (vl-catch-all-error-p result)
        nil
        result
    )
)

; Open a URL in a new Microsoft Edge InPrivate window.
; Example:
; (vlq:open-url-edge-inprivate "https://www.naver.com")
; => nil
(defun vlq:open-url-edge-inprivate ( url / edge result )

    (if (= 'str (type url))

        (progn

            (or
                (setq edge (findfile "C:\\Program Files\\Microsoft\\Edge\\Application\\msedge.exe"))
                (setq edge (findfile "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe"))
            )

            (if (= 'str (type edge))

                (setq result
                    (vl-catch-all-apply 'startapp
                        (list edge (strcat "--inprivate --new-window \"" url "\""))
                    )
                )
            )
        )
    )

    (if (vl-catch-all-error-p result)
        nil
        result
    )
)

; Open a URL with the default system browser.
; Example:
; (vlq:open-url-shell "https://www.naver.com")
; => nil
(defun vlq:open-url-shell ( url / shell result )

    (if (= 'str (type url))

        (progn

            (setq shell
                (vl-catch-all-apply 'vlax-create-object (list "Shell.Application"))
            )

            (if (not (vl-catch-all-error-p shell))

                (progn

                    (setq result
                        (vl-catch-all-apply 'vlax-invoke-method
                            (list shell 'Open url)
                        )
                    )

                    (vl-catch-all-apply 'vlax-release-object (list shell))
                )
            )
        )
    )

    (if (vl-catch-all-error-p result)
        nil
        result
    )
)
