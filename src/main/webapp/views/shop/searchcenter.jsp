<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/views/header.jsp" />


<section class="page-header">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="content">
          <h1 class="page-name">Shop</h1>
          <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li class="active"><a href="/shop">shop</a></li>
            <li class="active"><a href="/shop?category_id=${obj.category_id}"> Product Category</a></li>
          </ol>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 하단 상품 보기 -->
<section class="products section bg-gray">
  <div class="container">
    <div class="row">
      <div class="title text-center">
        <h2>검색 내용</h2>
      </div>
    </div>
    <div class="row">

      <c:forEach var="obj" items="${plist}">

      <div class="col-md-4">

          <div class="product-item">
            <div class="product-thumb">
              <img class="img-responsive" src="/img/${obj.product_imgname}" alt="product-img" />
              <div class="preview-meta">
                <ul>
                  <li>
                              <span  data-toggle="modal" data-target="#product-modal${obj.product_id}">
                                  <i class="tf-ion-ios-search-strong"></i>
                              </span>
                  </li>

                </ul>
              </div>
            </div>
          </div>
          <div class="product-content">
            <h4><a href="/shop/detail?product_id=${obj.product_id}">${obj.product_name}</a></h4>
            <p class="price"><fmt:formatNumber value="${obj.product_price}" type="number" pattern="₩ ###,###" /></p>
          </div>

      </div>
      </c:forEach>
    </div><%--  각각의 Product가 담긴 영역 끝.   --%>
    <!-- Modal창 팝업을 통한 상품 상세보기 forEach 한번 더! -->
    <c:forEach  var="obj" items="${allproduct}" >
      <div class="modal product-modal fade" id="product-modal${obj.product_id}"><%-- 위에서 선언한 #product-modal 와 똑같이 써야 해당 제품의 상세정보  --%>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <i class="tf-ion-close"></i>
        </button>
        <div class="modal-dialog " role="document">
          <div class="modal-content">
            <div class="modal-body">
              <div class="row">
                <form id="cart_form" action="/addcart" method="get">
                <div class="col-md-8 col-sm-6 col-xs-12">
                  <div class="modal-image">
                    <img class="img-responsive" src="/img/${obj.product_imgname}" alt="product-img" />
                  </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                  <div class="product-short-details">
                    <input type="hidden" name="user_id" value="${loginuser.user_id}"/>
                    <input type="hidden" name="product_id" value="${obj.product_id}"/>
                    <h2 class="product-title">${obj.product_name}</h2>
                    <p class="product-price"><fmt:formatNumber value="${obj.product_price}" type="number" pattern="₩ ###,###" /></p>
                    <input type="number" class="form-control" id="cart_quantity" name="cart_quantity" placeholder="수량을 선택하세요" >
                    <p class="product-short-description">
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem iusto nihil cum. Illo laborum numquam rem aut officia dicta cumque.
                    </p>
                      <%--  페이지 변환 방식.(ajax로 데이터 보내는 방식 아님..)  --%>
                      <%--  미로그인 고객 : 장바구니 담기 클릭 시 login 이동  --%>
                      <%--  로그인 고객 : 장바구니 담기 클릭 시 cart로 자동 담김.  --%>
                    <c:choose>
                      <c:when test="${loginuser == null}">
                        <a href="/shop/detail?product_id=${obj.product_id}" class="btn btn-transparent">상품 자세히보기</a>
                        <a href="/login" class="btn btn-main btn-large"> 장바구니에 담기</a>
                      </c:when>
                      <c:otherwise>
                        <a href="/shop/detail?product_id=${obj.product_id}" class="btn btn-transparent">상품 자세히보기</a>
                        <button type="submit" class="btn btn-main default" id="cart_addbtn"> 장바구니에 담기</button>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div><!-- /.modal -->
    </c:forEach>
  </div>
</section>


<!--
Start Call To Action
==================================== -->
<section class="call-to-action bg-gray section">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <div class="title">
          <h2>SUBSCRIBE TO NEWSLETTER</h2>
          <p>단 한 순간, 가장 아름다운 날의 기억은 반짝임을 아는 것부터 시작됩니다.<br>  AESPA에서 가공하는 다이아몬드 원석이 어떤 광산 및 공급처에서 소싱되었는지 100% 추적할 수 있습니다. </p>
        </div>
        <div class="col-lg-6 col-md-offset-3">
          <div class="input-group subscription-form">
            <input type="text" class="form-control" placeholder="Enter Your Email Address">
            <span class="input-group-btn">
				        <button class="btn btn-main" type="button">Subscribe Now!</button>
				      </span>
          </div><!-- /input-group -->
        </div><!-- /.col-lg-6 -->

      </div>
    </div> 		<!-- End row -->
  </div>   	<!-- End container -->
</section>   <!-- End section -->

<section class="section instagram-feed">
  <div class="container">
    <div class="row">
      <div class="title">
        <h2>View us on instagram</h2>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="instagram-slider" id="instafeed" data-accessToken="IGQVJYeUk4YWNIY1h4OWZANeS1wRHZARdjJ5QmdueXN2RFR6NF9iYUtfcGp1NmpxZA3RTbnU1MXpDNVBHTzZAMOFlxcGlkVHBKdjhqSnUybERhNWdQSE5hVmtXT013MEhOQVJJRGJBRURn"></div>
      </div>
    </div>
  </div>
</section>  <%-- center 끝. --%>