; 랜덤한 UUID 를 만들어낸다
; {A679190D-F4CC-4D13-966F-C053A640DBA8}
(defun pop:randomUUID (/ typelib guid)

    (setq typelib (vlax-create-object "Scriptlet.TypeLib"))

    (setq guid (vlax-get-property typelib 'GUID))

    (vlax-release-object typelib)

    guid
)