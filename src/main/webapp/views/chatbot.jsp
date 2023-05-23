<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>

<script>
    let chatbot = {
        id          : null,
        stompClient : null,
        init        : function () {
            this.id = $('#adm_id').text();
            $("#connect").click(function () {
                chatbot.connect();
            });
            $("#disconnect").click(function () {
                chatbot.disconnect();
            });
            $("#sendme").click(function () {
                chatbot.sendMe();
            });
        },
        connect     : function () {
            var sid = this.id;
            // 서버 소켓
            // 1번 : chbot 접속할게!
            var socket = new SockJS('${adminserver}/chbot'); // chbot으로 접속하고
            this.stompClient = Stomp.over(socket);
            // 클라이언트 파트
            this.stompClient.connect({}, function (frame) {
                chatbot.setConnected(true);
                console.log('Connected: ' + frame);

                // 3번
                //chsend로 받겠다.
                this.subscribe('/chsend/' + sid, function (msg) {
                    $("#me").prepend(
                        "<h4>" + "똑똑이 챗봇" + ":" +
                        JSON.parse(msg.body).content1 + "</h4>");
                });
            });
        },
        disconnect  : function () {
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            chatbot.setConnected(false);
            console.log("Disconnected");
        },
        setConnected: function (connected) {
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        sendMe      : function () {
            var msg = JSON.stringify({
                'sendid'  : this.id,
                'content1': $('#metext').val()
            });
            // 3번 : 컨트롤러로 간다
            this.stompClient.send("/chatbotme", {}, msg); // 서버 chatbotme가 처리해줘!
            // append: 내부 끝에 추가, prepend: 내부 시작 부분에 추가
            $('#me').prepend(
                '<h4>'+this.id+':'+$('#metext').val()+'</h4>'
            );
            // 내가 쓴 것 지우기
            $('#metext').val('');
        }
    };
    $(function () {
        chatbot.init();
    })

</script>

<div class="col-sm-8 text-left">
    <h1>Chatbot</h1>
    <h1 id="adm_id">${logincust.id}</h1>
    <H1 id="status">Status</H1>
    <button id="connect">Connect</button>
    <button id="disconnect">Disconnect</button>

    <h3>Me</h3>
    <input type="text" id="metext">
    <button id="sendme">Send</button>
    <div id="me"></div>

</div>

