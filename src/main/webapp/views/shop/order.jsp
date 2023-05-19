<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #full_name, #user_address, #user_country,#card-number, #card-expiry, #card-cvc, #final_total, #final_total2{
        color: black;
        font-weight: bold;
    }
</style>
<!-- header 구간  -->
<jsp:include page="/views/header.jsp" />
<!-- center 시작 구간 -->
<section class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="content">
                    <h1 class="page-name">주문하기</h1>
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a></li>
                        <li class="active">checkout</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="page-wrapper">
    <div class="checkout shopping">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="block billing-details">
                        <h4 class="widget-title">자동입력된 주문자 정보를 반드시 확인해 주세요!</h4>
                        <form class="checkout-form">
                            <div class="form-group">
                                <label for="full_name" >받는 분 : </label>
                                <input type="text" class="form-control" id="full_name" value="${loginuser.user_id}" />
                            </div>
                            <div class="form-group">
                                <label for="user_address">배송주소 : </label>
                                <input type="text" class="form-control" id="user_address" value="${loginuser.user_address}" />
                            </div>
                            <div class="form-group">
                                <label for="user_country">연락처 : </label>
                                <input type="text" class="form-control" id="user_country" value="${loginuser.user_contact}" />
                            </div>
                            <a href="/changeInfo" class="btn btn-main pull-center">내정보 수정하기</a>
                        </form>
                    </div>
                    <div class="block">
                        <h4 class="widget-title">결제수단과 정보를 확인해 주세요</h4>
                        <p>필수 정보*</p>
                        <div class="checkout-product-details">
                            <div class="payment">
                                <div class="card-details">
                                    <form  class="checkout-form">
                                        <div class="form-group">
                                            <label for="card-number">카드번호 : <span class="required"></span></label>
                                            <input  id="card-number" class="form-control"   type="tel" value="  9437   • • • •   2581   • • • •  "/>
                                        </div>
                                        <div class="form-group half-width padding-right">
                                            <label for="card-expiry">만료기간 : <span class="required"></span></label>
                                            <input id="card-expiry" class="form-control" type="tel" value="  09 / 26">
                                        </div>
                                        <div class="form-group half-width padding-left">
                                            <label for="card-cvc">CVC : <span class="required"></span></label>
                                            <input id="card-cvc" class="form-control"  type="tel" maxlength="4" value="  ***" >
                                        </div>
                                        <a href="/shop" class="btn btn-main pull-center">다른상품 보러가기</a>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="product-checkout-details">
                        <div class="block">
                            <form id="cart_form" >

                            <c:set var="total" value="0" />

                            <h4 class="widget-title">상품내역</h4>

                                <div class="media product-card">
                                    <c:forEach var="obj" items="${mycart}">
                                    <a class="pull-left" href="/shop/detail?product_id=${obj.product_id}">
                                        <img class="media-object" src="/img/${obj.product_imgname}" alt="Image" />
                                    </a>
                                        <div class="media-body">
                                        <h4 class="media-heading"><a href="/shop/detail?product_id=${obj.product_id}">${obj.product_name}</a></h4>
                                           <p><fmt:formatNumber value="${obj.product_price}" pattern="₩ ###,###" /></p>
                                           <h6>${obj.cart_quantity}개</h6><br>
                                       </div>
                                        <c:set var="total" value="${total + (obj.cart_quantity * obj.product_price) }" />
                                    </c:forEach>
                                </div>
                            <div class="discount-code">
                                <p> <a data-toggle="modal" data-target="#coupon-modal" href="#!">할인쿠폰 적용하러 가기</a></p>
                            </div>
                            <ul class="summary-prices">
                                <li>
                                    <span>결제 금액 : </span>
                                    <span class="price"><p class="price"><fmt:formatNumber value="${total}" pattern="₩ ###,###" /></p></span>
                                </li>
                                <li>
                                    <span>배송비 : </span>
                                    <span> - </span>
                                </li>
                            </ul>
                            <div class="summary-total">
                                <span id="final_total">최종 결제 금액 </span>
                                <span id="final_total2"><p class="price"><fmt:formatNumber value="${total}" pattern="₩ ###,###" /></p></span>
                            </div>
                            <div class="verified-icon">
                                <img src="/img/card.jpg">
                            </div>
                                <br><br>
                                <a href="/shop/confirmation" class="btn btn-main btn-large">  간편결제하기  </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
