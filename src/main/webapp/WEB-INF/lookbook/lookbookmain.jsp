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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/">Home</a>
                            <span>LookBook</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                      <c:forEach var="p" items="${list}">     
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="product__item">
                                <c:choose>
                            		<c:when test="${fn:substringBefore(p.look_photo,',') !=''}">
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${fn:substringBefore(p.look_photo,',')}">
                                    		<ul class="product__hover">
                                        		
                                        		<li><a href="${root}/lookbook/details?num=${p.num}&currentPage=${currentPage}&look_id=${p.look_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${p.look_photo}">
                                    		<ul class="product__hover">
                                        		
                                        		<li><a href="${root}/lookbook/details?num=${p.num}&currentPage=${currentPage}&look_id=${p.look_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>                		
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                	</c:forEach>
                 </div>
            </div>
        </div>
      </div>
      <c:if test="${totalCount>0 }">
      <div class="row">
          <div class="col-lg-12">
             <div class="product__pagination">
             <!-- 이전 -->
             	<c:if test="${startPage>1 }">
                   <span><a href="list?currentPage=${startPage-1 }"><</a></span>
                </c:if>
                	<c:forEach var="pp" begin="${startPage }" end="${endPage }">
                		<c:if test="${currentPage==pp }">
							<span class="active"><a href="list?currentPage=${pp }">${pp }</a></span>
						</c:if>
						<c:if test="${currentPage!=pp }">
							<span><a href="list?currentPage=${pp }">${pp }</a></span>
						</c:if>
                	</c:forEach>
             <!-- 다음 -->
                <c:if test="${endPage<totalPage }">
						<span><a href="list?currentPage=${endPage+1 }">></a></span>
				</c:if>
                   
                
             </div>
          </div>
      </div>
      </c:if>              
        
    </section>
    <!-- Shop Section End -->
</body>
</html>