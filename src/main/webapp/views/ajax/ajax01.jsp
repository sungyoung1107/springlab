<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    // ajax는 딱 그부분만 변경한다. 전체가 변경되는 것이 아니다 ! 중요 !!
    let ajax01 = {
        init: function(){
            setInterval(function(){
                $.ajax({
                    url: '/getservertime',
                    success: function(data){
                        // this.display(data); // this가 이렇게 하면 $.ajax로 가니까
                        ajax01.display(data); // 이렇게 해야 한다.
                    },
                    error: function(){
                        alert('error');
                    }
                });
            }, 3000);
        },
        display: function(data){
            $("#server_time").text(data);
        }
    };
    // 문서가 준비되면~
    $(function(){
        ajax01.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h2>ajax01</h2>
        <h4>Server Time</h4>
        <h5 id="server_time"></h5>
    </div>
</div>
<%--</html>--%>