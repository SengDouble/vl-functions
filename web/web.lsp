(defun c:bb ()
(setq http (vlax-create-object "MSXML2.XMLHTTP"))
(vlax-invoke-method http 'open "GET" "https://google.com" :vlax-false)
(vlax-invoke-method http 'send)
(setq resp (vlax-get http 'responseText))
(princ resp)
)

; (open-url-chrome "https://www.google.com")

(defun open-url-chrome (url / chrome)

	(setq chrome "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe")

	(if (not (findfile chrome))

		(setq chrome "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe")
	)

	(if (and (findfile chrome) (= 'str (type url)))

		(startapp chrome (strcat "--new-window \"" url "\""))
	)

	(princ)
)
