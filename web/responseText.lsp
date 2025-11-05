(http-get "https://www.naver.com")
(defun http-get (url / http txt)

	(setq http (vlax-create-object "MSXML2.XMLHTTP"))

	(vlax-invoke-method http 'open "GET" url :vlax-false)

	(vlax-invoke-method http 'send)

	(setq txt (vlax-get http 'responseText))

	(vlax-release-object http)

	txt
)