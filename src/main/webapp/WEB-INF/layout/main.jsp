<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dokdo&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<style>

   div, h2, h3, p{
font-family: 'Noto Sans KR';
}
</style>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="${root}/img/hero/hero-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6 style="color: #ffde00;">추첨을 통해 경품을 드려요</h6>
                                <h2 style="color: white;">LOMBOK</h2>
                                <h2 style="color: white;">Launching</h2>
                                <h1 style="color: white;">Big Event</h1>
                                <a href="${root}/event/event1" class="primary-btn">바로가기<span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="${root}/img/hero/hero-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                          <div class="hero__text">
                                <h6></h6>
                                <h2 style="color: white;">이번 크리스마스는</h2>
                                <h2 style="color: white;">LOMBOK과 함께</h2>
                                <p style="color: white;">즐거운 성탄절 되세요</p>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <section class="banner spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <img src="${root}/img/21.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                           <h2>Clothing Collections 2021</h2>
                            <a href="${root}/shop/list">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img src="${root}/img/53.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Coat</h2>
                            <a href="${root}/shop/category?pro_sub=코트">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="banner__item banner__item--last">
                        <div class="banner__item__pic">
                            <img src="${root}/img/banner/banner-3.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Winter Shoes  2022</h2>
                            <a href="${root}/shop/category?pro_sub=신발">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">All Products</li>
                        <li data-filter=".new-arrivals">New Sellers</li>
                        <li data-filter=".hot-sales">Hot Sales</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
            	<c:forEach var="p" items="${list}">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    
                    <div class="product__item">
                        <c:choose>
                            		<c:when test="${fn:substringBefore(p.pro_photo,',') !=''}">
                                		<div class="product__item__pic set-bg" data-setbg="${root}/photo/${fn:substringBefore(p.pro_photo,',')}">
                                    		 <span class="label">New</span>
                                    		<ul class="product__hover">
                                        		
                                        		<li><a href="${root}/shop/details?idx=${p.idx}&currentPage=${currentPage}&pro_id=${p.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="product__item__pic set-bg" data-setbg="${root}/photo/${p.pro_photo}">
                                    		 <span class="label">New</span>
                                    		<ul class="product__hover">
                                        		
                                        		<li><a href="${root}/shop/details?idx=${p.idx}&currentPage=${currentPage}&pro_id=${p.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>                		
                                	</c:otherwise>
                                </c:choose>
                        <div class="product__item__text">
                            <h6>${p.pro_name}</h6>
                             <a href="#" class="add-cart"><p><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;${p.readcount}</p></a>
                           
                            <h5><fmt:formatNumber value="${p.price}" pattern="#,###,###"/> ￦ </h5>
                            <div class="product__color__select">
                                 <c:forEach var="c" items="${list5}">                                 
                              			<c:if test="${p.pro_id==c.pro_id}">
                              				<div style="float: left;">
                                 				 <span id="colorbox" style="border:2px solid black; width: 20px; height: 20px; border-radius: 100px; background-color:  #${c.color}; float: right; margin-right:5px;" ></span>   
                              				</div> 	
                             	 	    </c:if>          
                                    </c:forEach>      
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
              
               <c:forEach var="p1" items="${list2 }">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    
                    <div class="product__item">
                        <c:choose>
                            		<c:when test="${fn:substringBefore(p1.pro_photo,',') !=''}">
                                		<div class="product__item__pic set-bg" data-setbg="${root}/photo/${fn:substringBefore(p1.pro_photo,',')}">
                                    		 <span class="label">Sale</span>
                                    		<ul class="product__hover">
                                        		
                                        		<li><a href="${root}/shop/details?idx=${p1.idx}&currentPage=${currentPage}&pro_id=${p1.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="product__item__pic set-bg" data-setbg="${root}/photo/${p1.pro_photo}">
                                    		 <span class="label">Sale</span>
                                    		<ul class="product__hover">
                                        		
                                        		<li><a href="${root}/shop/details?idx=${p1.idx}&currentPage=${currentPage}&pro_id=${p1.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>                		
                                	</c:otherwise>
                                </c:choose>
                        <div class="product__item__text">
                            <h6>${p1.pro_name}</h6>
                             <a href="#" class="add-cart"><p><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;${p1.readcount}</p></a>
                           
                            <h5><fmt:formatNumber value="${p1.price}" pattern="#,###,###"/> ￦ </h5>
                            <div class="product__color__select">
                                 <c:forEach var="c" items="${list5}">                                 
                              			<c:if test="${p1.pro_id==c.pro_id}">
                              				<div style="float: left;">
                                 				 <span id="colorbox" style="border:2px solid black; width: 20px; height: 20px; border-radius: 100px; background-color:  #${c.color}; float: right; margin-right:5px;" ></span>   
                              				</div> 	
                             	 	    </c:if>          
                                    </c:forEach>      
                            </div>
                        </div>
                    </div>
                </div>
              
               </c:forEach>
                </div>
            </div>
       
    </section>
    <!-- Product Section End -->

    <!-- Categories Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="categories__text">
                        <h2>Clothings Hot <br /> <span>Shoe Collection</span> <br /> Accessories</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="${root}/img/1.jpg" alt="">
                        <div class="hot__deal__sticker">
                            <span>Sale Of</span>
                            <h5>HOT</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>월간 세일</span>
                        <h2>Covernet White T-Shirt</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <p>Days</p>
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                                <p>Hours</p>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                                <p>Minutes</p>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Seconds</p>
                            </div>
                        </div>
                        <a href="${root }/shop/details?idx=6&currentPage=1&pro_id=ST001&key=list" class="primary-btn">Shop now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Instagram Section Begin -->
    <section class="instagram spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <div class="instagram__pic__item set-bg" data-setbg="${root}/img/instagram/instagram-1.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${root}/img/instagram/instagram-2.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${root}/img/instagram/instagram-3.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${root}/img/instagram/instagram-4.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${root}/img/instagram/instagram-5.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${root}/img/instagram/instagram-6.jpg"></div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="instagram__text">
                        <h2>Instagram, SNS</h2>
                         <p>인스타그램 및 다양한 SNS에서 해시태그 #L@MB@K으로 롬복의 다양한 패션을 확인해보세요. 해시태그 추첨을 통해 소정의 상품을 드립니다.</p>
                        <h4>#L@MB@K</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Instagram Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Latest News</span>
                        <h2>Fashion New Trends</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${root}/img/blog/blog-1.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="${root}/img/icon/calendar.png" alt=""> 16 February 2020</span>
                            <h5>What Curling Irons Are The Best Ones</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${root}/img/blog/blog-2.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="${root}/img/icon/calendar.png" alt=""> 21 February 2020</span>
                            <h5>Eternity Bands Do Last Forever</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${root}/img/blog/blog-3.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="${root}/img/icon/calendar.png" alt=""> 28 February 2020</span>
                            <h5>The Health Benefits Of Sunglasses</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->
</body>
</html>