<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/header.jsp" />
<section class="user-dashboard page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <ul class="list-inline dashboard-menu text-center">
          <li><a href="/about">about AESPA</a></li>
          <li><a href="/address">주소관리</a></li>
          <li><a class="active"  href="/changeInfo">내 정보</a></li>
        </ul>
        <div class="dashboard-wrapper dashboard-user-profile">
          <div class="media">
            <div class="pull-left text-center" href="#!">

            </div>
            <div class="media-body">
                <div class="media-body">
                    <ul class="user-profile-list">
                        <li><span>Full Name:</span>${userinfo.user_name}</li>
                        <li><span>Country:</span>${userinfo.user_address}</li>
                        <li><span>Phone:</span>${userinfo.user_contact}</li>
                        <li><span>Date of Birth:</span>${userinfo.user_birthday.split(' ')[0]}</li>
<%--                      loginuser.user_birthday 문자열을 공백을 기준으로 분할하여 첫 번째 요소(날짜 부분)만 선택합니다. --%>
<%--                      이렇게 하면 input 요소의 value 속성에 년/월/일 형식의 값이 설정됩니다.--%>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
