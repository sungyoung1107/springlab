<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 구간  -->
<jsp:include page="/views/header.jsp" />
<!-- center 시작 구간 -->
<section class="page-header">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="content">
          <h1 class="page-name">Cart</h1>
          <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li class="active"><a href="/cart?user_id=${loginuser.user_id}" >cart</a></li>
          </ol>
        </div>
      </div>
    </div>
  </div>
</section>

<%--  로그인한 고객(loginuser)이 cart에 담은 Product가 보이는 영역   --%>
    <div class="page-wrapper">
      <div class="cart shopping">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-md">
            <%-- 기존규격 :  <div class="col-md-8 col-md-offset-2">--%>
              <div class="block">
                <div class="product-list">
                  <form id="cart_form" >
                    <c:set var="middletotal" value="0" />
                    <c:set var="total" value="0" />

                    <table class="table">
                      <colgroup >
                        <col width="20%" />
                        <col width="20%" />
                        <col width="10%" />
                        <col width="20%" />
                        <col width="20%" />
                        <col width="10%" />
                      </colgroup>
                      <thead>
                          <tr>
                            <th class="">이미지</th>
                            <th class="">상품명</th>
                            <th class="">개수</th>
                            <th class="">상품금액</th>
                            <th class="">총 상품금액</th>
                            <th class="">비고</th>
                          </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="obj" items="${mycart}">
                          <tr class="">
                            <td class="">
                              <div class="product-info">
                                <a href="/shop/detail?product_id=${obj.product_id}"><img width="130" src="/img/${obj.product_imgname}" alt="" /></a>
                              </div>
                            </td>
                            <td><a href="/shop/detail?product_id=${obj.product_id}">${obj.product_name}</a></td>
                            <td class="">${obj.cart_quantity}</td>
                            <td class=""><fmt:formatNumber value="${obj.product_price}" pattern="₩ ###,###" /></td>

                            <c:set var="middletotal" value="${middletotal = (obj.cart_quantity * obj.product_price) }" />
                            <td class=""><fmt:formatNumber value="${middletotal}" pattern="₩ ###,###" /></td>
                            <c:set var="total" value="${total + (obj.cart_quantity * obj.product_price) }" />
                            <td class="">
                              <a class="product-remove" href="/cart/remove?product_id=${obj.product_id}">삭제하기</a>
                            </td>
                          </tr>
                      </c:forEach>

                      </tbody>

                    </table>
                    <br>
                    <%--  장바구니에 담긴 아이템 금액 합계 찍기위해 상단에 set으로 변수 total선언, 하단에 value표기--%>
                    <h3 style="text-align: right" ><strong> 총 결제 금액 ₩ <fmt:formatNumber value="${total}" pattern="###,###" /></strong></h3>
                    <br>
                    <a href="/shop" class="btn btn-main pull-center">다른상품 보러가기</a>
                    <a href="/shop/order?user_id=${loginuser.user_id}" class="btn btn-main pull-right">주문하기</a>
                    <%-- 주문할 항목만 선택할 수 있게 체크박스 넣어보기. --%>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
