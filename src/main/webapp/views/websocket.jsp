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
    let websocket = {
        id          : null,
        stompClient : null,
        init        : function () {
            this.id = $('#adm_id').text();
            $("#connect").click(function () {
                websocket.connect();
            });
            $("#disconnect").click(function () {
                websocket.disconnect();
            });
            $("#sendall").click(function () {
                websocket.sendAll();
            });
            $("#sendme").click(function () {
                websocket.sendMe();
            });
            $("#sendto").click(function () {
                websocket.sendTo();
            });
        },
        connect     : function () {
            var sid = this.id;
            // 서버 소켓
            var socket = new SockJS('http://127.0.0.1:8088/ws');
            this.stompClient = Stomp.over(socket);
            // 클라이언트 파트
            this.stompClient.connect({}, function (frame) {
                websocket.setConnected(true);
                console.log('Connected: ' + frame);
                this.subscribe('/send', function (msg) {
                    $("#all").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid + ":" +
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
                this.subscribe('/send/' + sid, function (msg) {
                    $("#me").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid + ":" +
                        JSON.parse(msg.body).content1 + "</h4>");
                });
                this.subscribe('/send/to/' + sid, function (msg) {
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid + ":" +
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect  : function () {
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },
        setConnected: function (connected) {
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        sendAll     : function () {
            var msg = JSON.stringify({
                'sendid'  : this.id,
                'content1': $("#alltext").val()
            });
            this.stompClient.send("/receiveall", {}, msg); // 관리자 controller로 간다.
        },
        sendTo      : function () {
            var msg = JSON.stringify({
                'sendid'   : this.id,
                'receiveid': $('#target').val(),
                'content1' : $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg);
        },
        sendMe      : function () {
            var msg = JSON.stringify({
                'sendid'  : this.id,
                'content1': $('#metext').val()
            });
            this.stompClient.send("/receiveme", {}, msg); // 서버 receiveme가 처리해줘!
        }
    };
    $(function () {
        websocket.init();
    })

</script>

<div class="col-sm-8 text-left">
    <h1 id="adm_id">${logincust.id}</h1>
    <H1 id="status">Status</H1>
    <button id="connect">Connect</button>
    <button id="disconnect">Disconnect</button>

    <h3>All</h3>
    <input type="text" id="alltext">
    <button id="sendall">Send</button>
    <div id="all"></div>

    <h3>Me</h3>
    <input type="text" id="metext">
    <button id="sendme">Send</button>
    <div id="me"></div>

    <h3>To</h3>
    <input type="text" id="target">
    <input type="text" id="totext">
    <button id="sendto">Send</button>
    <div id="to"></div>

</div>
