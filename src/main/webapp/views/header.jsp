<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<!--
/**
* 화면 : index.js
* 내용 : center 나누기 / login 기능 구현 중
* 작성자 : 정인보
* 작성일 : 5.11
*/
-->


    <script>
        // cart 모달
        $(document).ready(function() {
            // AJAX를 통해 서버로 데이터 요청
            $.ajax({
                url: "/cart-items", // 데이터 요청을 처리하는 URL
                type: "get",
                dataType: "html",
                success: function(response) {
                    $("#cartItems").html(response); // 응답 받은 HTML을 해당 영역에 삽입
                },
                error: function(xhr, status, error) {
                    console.log("Error:", error);
                }
            });
        });
</script>
<script>
        // search 기능
        function enterkey() {
            if (window.event.keyCode == 13) {

                // 엔터키가 눌렸을 때 실행하는 반응
                $("#search-form").submit();
            }
        }
</script>

<!-- Start Top Header Bar -->
<section class="top-header">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-xs-12 col-sm-4">
                <div class="contact-number">
                    <i class="tf-ion-ios-telephone"></i>
                    <span>02-0201-0707</span>
                </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <!-- Site Logo -->
                <div class="logo text-center">
                    <a href="/">
                        <!-- replace logo here -->
                        <svg width="135px" height="29px" viewBox="0 0 155 29" version="1.1" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink">
                            <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="40"
                               font-family="AustinBold, Austin" font-weight="bold">
                                <g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
                                    <text id="AVIATO">
                                        <tspan x="108.94" y="325">AESPA</tspan>
                                    </text>
                                </g>
                            </g>
                        </svg>
                    </a>
                </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <!-- Cart -->
                <ul class="top-menu text-right list-inline">
                    <li class="dropdown cart-nav dropdown-slide">
                        <c:set var="middletotal" value="0" />
                        <c:set var="total" value="0" />
                        <!-- 미 로그인 고객 cart 선택 시 : 로그인 페이지로 이동 -->
                        <!-- 로그인 고객 cart 선택 시 : 본인의 카트 정보조회 dropdown -->
                        <c:choose>
                        <c:when test="${loginuser == null }">
                            <a href="/login" ><i class="tf-ion-android-cart"></i> Cart</a>
                        </c:when>
                        <c:otherwise>
                        <a href="/cart?user_id=${loginuser.user_id}" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                class="tf-ion-android-cart"></i> Cart</a>
                        <div class="dropdown-menu cart-dropdown">
                            <div id="cartItems">
                            <c:forEach var="cartItem" items="${allcartlist}">
                                <!-- 각 카트 아이템을 드롭다운 메뉴에 표시하는 코드 -->
                                <div class="media">
                                    <a class="pull-left" href="/cart?user_id=${loginuser.user_id}">
                                        <img class="media-object" src="/img/${cartItem.product_imgname}" alt="image" />
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading"><a href="/cart?user_id=${loginuser.user_id}"><strong>${cartItem.product_name}</strong></a></h4>
                                        <div class="cart-price">

                                            <span><fmt:formatNumber value="${cartItem.product_price}" pattern="₩ ###,###" /></span>
                                            <span> x ${cartItem.cart_quantity} 개  </span>
                                        </div>
                                        <c:set var="middletotal" value="${middletotal = (cartItem.cart_quantity * cartItem.product_price) }" />
                                        <h5><strong><fmt:formatNumber value="${middletotal}" pattern="₩ ###,###" /></strong></h5>
                                        <input type="hidden"${cartItem.product_id} />
                                    </div>
                                </div>
                                <a href="/cart?user_id=${loginuser.user_id}" class="remove"><i class="tf-ion-close"></i></a>
                                <c:set var="total" value="${total + (cartItem.cart_quantity * cartItem.product_price) }" />
                            </c:forEach>
                            <!-- 나머지 드롭다운 메뉴 요소들 -->
                            <div class="cart-summary">
                                <span>Total</span>
                                <span class="total-price">
                                    <%--  장바구니에 담긴 아이템 금액 합계 찍기위해 상단에 set으로 변수 total선언, 하단에 value표기--%>
                                <span>₩ <fmt:formatNumber value="${total}" pattern="###,###" /></span>
                                </span>
                            </div>
                            <ul class="text-center cart-buttons">
                                <li><a href="/cart?user_id=${loginuser.user_id}" class="btn btn-small">자세히 보기</a></li>
                                <li><a href="/shop/order?user_id=${loginuser.user_id}" class="btn btn-small btn-solid-border">주문하기</a></li>
                            </ul>
                        </div>

                        </div>
                        </c:otherwise>
                        </c:choose>
                    </li><!-- / Cart -->
                    <!-- Mypage -->
                    <c:choose>
                        <c:when test="${loginuser == null}">
                            <li class="dropdown dropdown-slide">
                                <!-- 미 로그인 고객 login 선택 시 : login 페이지 이동 -->
                                <!-- 로그인 고객 login 가까이 drop 시 : 내정보 수정 / logout 가능 -->
                                <a href="/login" class="" data-toggle="" data-hover="dropdown" data-delay="350"
                                   role="button" aria-haspopup="true" aria-expanded="false"><span class="tf-ion-android-person"></span> Login</a><!-- Main Controller -->
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="dropdown dropdown-slide">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
                                   role="button" aria-haspopup="true" aria-expanded="false"><span class="tf-ion-android-person"></span> ${loginuser.user_id} <span
                                        class="tf-ion-ios-arrow-down"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/profile"> 내정보 수정</a></li>
                                    <li><a href="/logout"> Logout</a></li><!-- Main Controller -->
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose><!-- / Mypage -->

                    <!-- Search -->
                    <li class="dropdown search dropdown-slide">
                        <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                class="tf-ion-ios-search-strong"></i> Search</a>
                        <ul class="dropdown-menu search-dropdown">
                            <li>
                                <form id="search-form" action="/search">
                                    <input onkeyup="enterkey();" type="search" class="form-control" name="product_name" placeholder="검색하세요...">
                                </form>
                            </li>
                        </ul>
                    </li><!-- / Search -->


                </ul><!-- / .nav .navbar-nav .navbar-right -->
            </div>
        </div>
    </div>
</section><!-- End Top Header Bar -->

<!-- Main Menu Section -->
<section class="menu">
    <nav class="navbar navigation">
        <div class="container">
            <div class="navbar-header">
                <h2 class="menu-title">Main Menu</h2>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div><!-- / .navbar-header -->

            <!-- Navbar Links -->
            <div id="navbar" class="navbar-collapse collapse text-center">
                <ul class="nav navbar-nav">

                    <!-- Home -->
                    <li class="dropdown ">
                        <a href="/">Home</a>
                    </li><!-- / Home -->


                    <!-- Elements -->
                    <li class="dropdown dropdown-slide">
                        <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
                           role="button" aria-haspopup="true" aria-expanded="false">Shop <span
                                class="tf-ion-ios-arrow-down"></span></a>
                        <div class="dropdown-menu">
                            <div class="row">

                                <!-- Basic -->
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li class="dropdown-header">주얼리</li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="/shop">한눈에보기</a></li>
                                        <li><a href="/shop/earring">귀걸이</a></li>
                                        <li><a href="/shop/ring">반지</a></li>
                                        <li><a href="/shop/bracelet">팔찌</a></li>
                                        <li><a href="/shop/necklace">목걸이</a></li>
                                        <li><a href="/shop/watch">워치</a></li>

                                    </ul>
                                </div>
                                <!-- Basic -->
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li class="dropdown-header">모던 액세서리</li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="/shop/modern">한눈에보기</a></li>

                                    </ul>
                                </div>
                                <!-- Layout -->
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li class="dropdown-header">카테고리</li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="/shop/gift">기프트</a></li>
                                        <li><a href="/shop/casual">캐쥬얼</a></li>
                                        <li><a href="/shop/wedding">웨딩</a></li>

                                    </ul>
                                </div>

                            </div><!-- / .row -->
                        </div><!-- / .dropdown-menu -->
                    </li><!-- / Elements -->








                    <!-- Shop -->
                    <li class="dropdown dropdown-slide">
                        <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
                           role="button" aria-haspopup="true" aria-expanded="false">Service <span
                                class="tf-ion-ios-arrow-down"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/404">매장찾기</a></li>
                            <li><a href="/404">수리문의</a></li>
                            <li><a href="/404">Contact</a></li>
                        </ul>
                    </li><!-- / Blog -->

                    <li class="menu">
                        <a href="/about"  data-delay="350"
                           role="button" aria-haspopup="true" aria-expanded="false">About
                            </a>
                        <ul class="menu">

                        </ul>
                    </li><!-- / Blog -->
                </ul><!-- / .nav .navbar-nav -->

            </div>
            <!--/.navbar-collapse -->
        </div><!-- / .container -->
    </nav>
</section>