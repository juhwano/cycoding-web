//로그인하면 웹소켓 연결	


function openSocket() {

	/*var ws = new WebSocket("wss://localhost:8090/alarm/{code, sender, receiver}");   */
	var ws = new WebSocket("wss://localhost:8090/alarm")
	//서버와 연결할 때 호출됨
	ws.onopen = function(event) {
		

		if (event.data === undefined) {
			return;
		}
		writeResponse(event.data);

	};

	//서버에서 클라이언트로 메시지가 왔을 때 호출
	ws.onmessage = function(event) {
		console.log('writeResponse');
		console.log(event.data)
		writeResponse(event.data);

		console.log(event.data);
	};
	/*            
				//서버와 연결 끊어질 때 호출
				ws.onclose = function(event){
					writeResponse("${sessionScope.id}님이 나가셨습니다.");
				}*/

}



