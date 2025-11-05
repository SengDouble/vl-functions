(http-get "https://www.naver.com")
(defun http-get (url / http txt)

	(setq http (vlax-create-object "MSXML2.XMLHTTP"))

	(vlax-invoke-method http 'open "GET" url :vlax-false)

	(vlax-invoke-method http 'send)

	(setq txt (vlax-get http 'responseText))

	(vlax-release-object http)

	txt
)

(defun http-get-server (url / http txt)

	(setq http (vlax-create-object "MSXML2.ServerXMLHTTP"))

	(vlax-invoke-method http 'setTimeouts 0 60000 60000 60000)

	(vlax-invoke-method http 'open "GET" url :vlax-false)

	(vlax-invoke-method http 'send)

	(setq txt (vlax-get http 'responseText))

	(vlax-release-object http)

	txt
)
