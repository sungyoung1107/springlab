<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--아래 태그 추가. 다국어 처리 위한 스프링 태그 라이브러리--%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<%-- Main Center Start --%>
<div class="col-sm-8 text-left">
    <h1><spring:message code="site.title"/></h1>
    <h1><spring:message code="site.content"/> </h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <hr>
    <h3>Test</h3>
    <p>Lorem ipsum...</p>
</div>
<%-- Main Center End --%>