<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--아래 태그 추가. 다국어 처리 위한 스프링 태그 라이브러리--%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    #w2 {
        width: 500px;
        border: 2px solid blue;
    }
</style>

<script>

    let center = {
        init : function(){
            $.ajax({
                url :'/weather2',
                success : function(data){
                    // console.log(data);
                    // alert(data);
                    center.display(data);
                }
            });
        },
        display(data){
            let result = data.response.body.items.item; // 배열데이터
            let txt = ''
            //배열을 돌린다.
            $(result).each(function(index, item){
                txt += '<h5>';
                txt += index;
                txt += " ";
                txt += item.tm;
                txt += " ";
                txt += item.ta;
                txt += '</h5>';
            });
            console.log(txt);
            $('#w2').html(txt);
        }
    }

    $(function () {
        // center.init();
    })

</script>

<%-- Main Center Start --%>
<div class="col-sm-8 text-left">
    <h1><spring:message code="site.title"/></h1>
    <h1><spring:message code="site.content"/></h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
        ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <hr>
<%--    <textarea id="w1" cols="90" rows="10">${weatherinfo}</textarea>--%>
    <hr>
    <!-- ajax를 요청해서 json을 받아서 화면에서 풀어헤치기 -->
<%--    <div id="w2" cols="90" rows="10"></div>--%>
    <div id="w2"></div>
</div>
<%-- Main Center End --%>