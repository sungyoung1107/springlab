<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

  #size, #size2{
    width: 400px;
    height: 300px;
    margin: -2px -2px -10px 15px;
  }
  #details, #reviews{
    display: flex;
  }

  #detail_title{
    font-weight: bold;
    font-size: larger;
    margin-bottom: 8px;
  }


</style>

<!-- header 구간  -->
<jsp:include page="/views/header.jsp" />

<!-- 상품의 상세내용 구간인 center -->


<section class="single-product">
  <div class="container">

    <div class="row">
      <div class="col-md-6">
        <ol class="breadcrumb">
          <li><a href="/">Home</a></li>
          <li><a href="/shop">Shop</a></li>
          <li class="active"><a href="/shop?category_id=${obj.category_id}">Product Category</a></li>
        </ol>
      </div>
    </div>

    <div class="row mt-20">
      <div class="col-md-5">
        <div class="single-product-slider">
          <div id='carousel-custom' class='carousel slide' data-ride='carousel'>
            <div class='carousel-outer'>
              <!-- 상품 이미지 slider -->
              <div class='carousel-inner '>
                <div class='item active'>
                  <img src="/img/${detail.product_imgname}" alt='' data-zoom-image=/img/${obj.product_imgname}" />
                </div>
                <div class='item'>
                  <img src="/img/${detail.product_detail_img1}" alt='' data-zoom-image="/img/${detail.product_detail_img1}" />
                </div>

                <div class='item'>
                  <img src="/img/${detail.product_detail_img2}" alt='' data-zoom-image="/img/${detail.product_detail_img2}" />
                </div>
                <div class='item'>
                  <img src="/img/${detail.product_detail_img3}" alt='' data-zoom-image="/img/${detail.product_detail_img3}" />
                </div>

              </div>

              <!-- sag sol -->
              <a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
                <i class="tf-ion-ios-arrow-left"></i>
              </a>
              <a class='right carousel-control' href='#carousel-custom' data-slide='next'>
                <i class="tf-ion-ios-arrow-right"></i>
              </a>
            </div>

            <!-- thumb -->
            <ol class='carousel-indicators mCustomScrollbar meartlab'>
              <li data-target='#carousel-custom' data-slide-to='0' class='active'>
                <img src="/img/${detail.product_imgname}" alt='' />
              </li>
              <li data-target='#carousel-custom' data-slide-to='1'>
                <img src="/img/${detail.product_detail_img1}" alt='' />
              </li>
              <li data-target='#carousel-custom' data-slide-to='2'>
                <img src="/img/${detail.product_detail_img2}" alt='' />
              </li>
              <li data-target='#carousel-custom' data-slide-to='3'>
                <img src="/img/${detail.product_detail_img3}" alt='' />
              </li>
            </ol>
          </div>
        </div>
      </div>
      <div class="col-md-7">
<%-- 장바구니에 추가하는 기능이 페이지에 있을 땐, from 태그와, input hidden이 꼭 있어야해  --%>
        <form id="cart_form" action="/addcart" method="get">
          <input type="hidden" name="user_id" value="${loginuser.user_id}"/>
          <input type="hidden" name="product_id" value="${detail.product_id}"/>
        <div class="single-product-details">
          <h2>${detail.product_name}</h2>
          <p class="product-description md-20">
            ${detail.product_contents}
          </p>
          <div class="product-price"><strong>
          <span>가격 : <span >${detail.product_price}</span></span>
          </strong></div><br>
          <div class="color-swatches">
           <span style="width: 200px"> ${detail.product_Material}</span>
          </div>
          <div class="product-size">
            <span>규격 : </span>
            <select class="form-control">
              <option>S</option>
              <option>M</option>
              <option>L</option>
              <option>XL</option>
            </select>
          </div>
          <div class="product-quantity">
            <span>수량 : </span>
            <div class="product-quantity-slider">
              <input type="number" class="form-control" id="cart_quantity" name="cart_quantity" placeholder="수량 선택" >
            </div>
          </div>
          <br>
          <br>
          <br>
          <%--  미로그인 고객 : 장바구니 담기 클릭 시 login 이동  --%>
          <%--  로그인 고객 : 장바구니 담기 클릭 시 cart로 자동 담김.  --%>
          <c:choose>
            <c:when test="${loginuser == null}">
               <a href="/login" class="btn btn-main btn-large"> 장바구니에 담기</a>
            </c:when>
            <c:otherwise>
                <button type="submit" class="btn btn-main default" id="cart_addbtn"> 장바구니에 담기</button>
            </c:otherwise>
          </c:choose>
        </div>
        </form>
      </div>
    </div>

<%--  반지 사이즈  --%>
    <div class="row">
      <div class="col-xs-12">
        <div class="tabCommon mt-20">
          <ul class="nav nav-tabs">
            <li class=""><a data-toggle="tab" href="#details" aria-expanded="true">사이즈 참고</a></li>
<%--            <li class="active"><a data-toggle="tab" href="#reviews" aria-expanded="true"></a></li>--%>
          </ul>
          <div class="tab-content patternbg">
            <span id="detail_title">제품 구매 시 참고사항</span>
            <div id="details" class="tab-pane">
              <br>
              <table class="table table-hover">
                <colgroup>
                  <col width="50%">
                  <col width="50%">
                </colgroup>
                <thead>
                <tr>
                  <th>사이즈</th>
                  <th>안쪽 둘레(mm)</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>3</td>
                  <td>42.9</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>46.8</td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>49.3</td>
                </tr>
                <tr>
                  <td>6</td>
                  <td>51.9</td>
                </tr>
                <tr>
                  <td>7</td>
                  <td>54.4</td>
                </tr>
                <tr>
                  <td>8</td>
                  <td>57.0</td>
                </tr>
                <tr>
                  <td>9</td>
                  <td>59.5</td>
                </tr>
                </tbody>
              </table>
              <img id="size" class="media-object comment-avatar" src="/img/size1.jpg" />
            </div>
          </div>
<%--            <div id="reviews" class="tab-pane fade in active">--%>
<%--                <table class="table table-hover">--%>
<%--                  <colgroup>--%>
<%--                    <col width="50%">--%>
<%--                    <col width="50%">--%>
<%--                  </colgroup>--%>
<%--                  <thead>--%>
<%--                  <tr>--%>
<%--                    <th>사이즈</th>--%>
<%--                    <th>안쪽 둘레(mm)</th>--%>
<%--                  </tr>--%>
<%--                  </thead>--%>
<%--                  <tbody>--%>
<%--                  <tr>--%>
<%--                    <td>XS</td>--%>
<%--                    <td>150</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>S</td>--%>
<%--                    <td>160</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>M</td>--%>
<%--                    <td>170</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>L</td>--%>
<%--                    <td>180</td>--%>
<%--                  </tr>--%>
<%--                  </tbody>--%>
<%--                </table>--%>
<%--                <img id="size2" class="media-object comment-avatar" src="/img/size2.jpg" />--%>

<%--            </div>--%>
          </div>
        </div>
      </div>
    </div>
</section>

<%-- 다른상품 더보기로 나오는 샘플 4가지 상품 구간 --%>
<section class="products related-products section">
  <div class="container">
    <div class="row">

      <div class="title text-center">
        <h2>함께 보면 좋은 상품</h2>
      </div>
    </div>

      <div class="row">
        <c:forEach  var="obj" items="${allproduct}" varStatus="status" begin="1" end="4" >
        <div class="col-md-3">

              <div class="product-item">

                <div class="product-thumb">
                  <img class="img-responsive" src="/img/${obj.product_imgname}" alt="product-img" />
                  <div class="preview-meta">
                    <ul>
                      <li>
                                          <span  data-toggle="modal" data-target="#product-modal${obj.product_id}">
                                              <i class="tf-ion-ios-search"></i>
                                          </span>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="product-content">
                  <h4><a href="product-single.html">${obj.product_name}</a></h4>
                  <p class="price"><fmt:formatNumber value="${obj.product_price}" type="number" pattern="₩ ###,###" /></p>
                  </p>
                </div>

              </div>

        </div>
        </c:forEach>
      </div>
    </div>
</section>



<!-- Modal창 팝업을 통한 상품 상세보기 forEach 한번 더! -->
<c:forEach  var="obj" items="${allproduct}" >
  <div class="modal product-modal fade" id="product-modal${obj.product_id}">
      <%-- 위에서 선언한 #product-modal 와 똑같이 써야 해당 제품의 상세정보  --%>
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