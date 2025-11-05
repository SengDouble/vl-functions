; (http-get "https://www.naver.com")
(defun http-get (url / http txt)

	; XMLHTTP 객체 생성(클라이언트용, 간단 요청에 적합)
	(setq http (vlax-create-object "MSXML2.XMLHTTP"))

	; open(method, url, async?) : :vlax-false = 동기 요청(호출이 블로킹됨)
	(vlax-invoke-method http 'open "GET" url :vlax-false)

	; 본문 없는 GET 전송
	(vlax-invoke-method http 'send)

	; 서버 응답 텍스트 가져오기(HTML/JSON 모두 문자열)
	(setq txt (vlax-get http 'responseText))

	; COM 객체 해제
	(vlax-release-object http)

	txt
)

; (http-get-server "https://www.naver.com")
(defun http-get-server (url / http txt)

	; ServerXMLHTTP는 서버-사이드 시나리오에 최적화, 방화벽/프록시 대응이 비교적 안정적
	(setq http (vlax-create-object "MSXML2.ServerXMLHTTP"))

	; setTimeouts(resolve, connect, send, receive) 단위 ms
	; 0은 DNS/resolve 무제한, 나머지는 60초 설정
	(vlax-invoke-method http 'setTimeouts 0 60000 60000 60000)

	; 동기 모드로 열기
	(vlax-invoke-method http 'open "GET" url :vlax-false)

	; 요청 전송
	(vlax-invoke-method http 'send)

	; 응답 텍스트 취득
	(setq txt (vlax-get http 'responseText))

	; COM 객체 해제
	(vlax-release-object http)

	txt
)
