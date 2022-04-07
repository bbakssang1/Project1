<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <c:choose>
               <c:when test="${sessionScope.loginok!=null}">
                  <a href="${root}/login/logoutprocess">Sign out</a>
                  <a href="${root}/cscenter/csmain">FAQs</a>
                  
               </c:when>
               <c:otherwise>
                  <a href="${root}/login/signin">Sign in</a>
                  <a href="${root}/cscenter/csmain">FAQs</a>
               </c:otherwise>
            </c:choose>
            </div>
        </div>
        <div class="offcanvas__nav__option">
           
            <a href="${root}/shop/cart"><img src="${root}/img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="price">0,00￦</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <c:choose>
                <c:when test="${sessionScope.loginok!=null}">
                   <p>${sessionScope.myid}님 로그인 중</p>
                </c:when>
                <c:otherwise>
                   <p>이번 겨울은 LOMBOK과 함께</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <c:choose>
                               <c:when test="${sessionScope.loginok!=null}">
                                  <p>${sessionScope.myid}님 로그인 중</p>
                               </c:when>
                               <c:otherwise>
                                  <p>이번 겨울은 LOMBOK과 함께</p>
                               </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <c:choose>
                                    <c:when test="${sessionScope.loginok!=null}">
                                       <a style="color: pink;" href="${root}/login/logoutprocess">Sign out</a>
                                       <a href="${root}/cscenter/csmain">FAQs</a>
                                       <c:if test="${sessionScope.myid!='admin' }">
                                       <a href="${root}/mypage/main?id=${sessionScope.myid}">MyPage</a>
                                    	</c:if>
                                <c:if test="${sessionScope.loginok!=null && sessionScope.myid.equals('admin')}">
                                	<a href="${root}/shop/adminmain">ADMIN</a>
                              	</c:if>
                              		</c:when>
                                   <c:otherwise>
                                       <a style="color: lightgreen;" href="${root}/login/signin">Sign in</a>
                                       <a href="${root}/cscenter/csmain">FAQs</a>
                                    </c:otherwise>
                              </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="${root}/"><img style="height: 50px;" src="${root}/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="${root}/">HOME</a></li>
                            <li><a href="${root}/shop/list">SHOP</a>
                                <ul class="dropdown" style="text-align: center;">
                                    <li><a href="${root}/shop/list">전체</a></li>
                                    <li><a href="${root}/shop/category?pro_sub=반팔">반팔</a></li>
                                    <li><a href="${root}/shop/category?pro_sub=긴팔">긴팔</a></li>
                                    <li><a href="${root}/shop/category?pro_sub=스커트">스커트</a></li>
                                    <li><a href="${root}/shop/category?pro_sub=바지">바지</a></li>
                                    <li><a href="${root}/shop/category?pro_sub=패딩">패딩</a></li>
                                    <li><a href="${root}/shop/category?pro_sub=코트">코트</a></li>
                                    <li><a href="${root}/shop/category?pro_sub=신발">신발</a></li>
                                    
                                </ul>
                            </li>
                            <li><a href="${root}/lookbook/lookbookmain">LOOK BOOK</a></li>
                            <li><a href="${root}/review/list">REVIEW</a></li>
                            <li><a href="${root}/event/main">EVENT</a></li> 
                            
                            
                               
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                    
                        
                        <a href="${root}/shop/cart"><img style="height: 20px;" src="${root}/img/icon/cart.png" alt=""> <span></span></a>
                        <div class="price">Cart</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
</body>
</html>