 ; chrome 을 이용해 웹사이트를 열어준다.
; (open-url-chrome "https://www.naver.com")
(defun open-url-chrome (url / chrome)

	(or
		(setq chrome (findfile "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"))
		(setq chrome (findfile "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"))
	)

	(if (= 'str (type chrome) (type url))

		(startapp chrome (strcat "--new-window \"" url "\""))
	)

	(princ)
)

; 기본 브라우저로 웹사이트를 열어준다.
; (open-url-shell "https://www.naver.com")
(defun open-url-shell (url / sh)

	(setq sh (vlax-create-object "Shell.Application"))

	(vlax-invoke-method sh 'Open url)

	(vlax-release-object sh)

	(princ)
)