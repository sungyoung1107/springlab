<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/views/header.jsp" />
<section class="user-dashboard page-wrapper">
  <div class="container">
    <div class="row">

      <div class="col-md-8" style="margin-left: 200px">
        <ul class="list-inline dashboard-menu text-center">
          <li><a href="/about">about AESPA</a></li>
          <li><a href="/address">주소 관리</a></li>
          <li><a class="active"  href="/changeInfo">내 정보</a></li>
        </ul>
        <div class="dashboard-wrapper user-dashboard">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>받는 사람</th>
                  <th>전화번호</th>
                  <th>받는 주소</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>${loginuser.user_name}</td>
                  <td>${loginuser.user_contact}</td>
                  <td>${loginuser.user_address}</td>
                  <td>
                    <div class="btn-group" role="group">
                      <a href="/changeInfo"><button type="button" class="btn btn-default"><i class="tf-pencil2" aria-hidden="true"></i></button></a>
                    </div>
                  </td>
                </tr>
              </tbody>

    </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
