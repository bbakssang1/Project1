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

</script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dokdo&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="">
	div{
	 font-family: "Noto Sans KR";
	}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="${root}/">Home</a>
                            <a href="${root}/lookbook/lookbookmain">LookBook</a>
                            <span>LookBook Details</span>
                        </div>
                        <p><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;${dto.readcount }</p>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                            <c:forTokens var="pp" items="${dto.look_photo }" delims="," begin="0" end="4" varStatus="sts"> 
                            	<c:choose>    
                            		<c:when test="${sts.count==1 }">                             	
                                		 <a class="nav-link active" data-toggle="tab" href="#tabs-${sts.count }" role="tab">
                                   		 	<div class="product__thumb__pic set-bg" data-setbg="../photo/${pp}"></div> 
                               	   		 </a>
                                	</c:when>
                                	<c:otherwise>
                                	 	 <a class="nav-link " data-toggle="tab" href="#tabs-${sts.count }" role="tab">
                                     		<div class="product__thumb__pic set-bg" data-setbg="../photo/${pp}"></div> 
                               		     </a>
                                	</c:otherwise>
                                </c:choose>
                                <br>
                            </c:forTokens>                           
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">                     
                           <c:forTokens var="pp" items="${dto.look_photo }" delims=","  begin="0" end="4" varStatus="sts">
							   <c:choose>
							   		<c:when test="${sts.count==1 }">
										<div class="tab-pane active" id="tabs-${sts.count }" role="tabpanel">
											<div class="product__details__pic__item">
                                    			<img src="../photo/${pp}" alt="">
                                			</div>                               
	                            		</div>	
	                                </c:when>
		                            <c:otherwise>
		                            		<div class="tab-pane" id="tabs-${sts.count }" role="tabpanel">
												<div class="product__details__pic__item">
	                                    			<img src="../photo/${pp}" alt="">
	                                			</div>                               
		                           		    </div>	
		                            </c:otherwise>
	                            </c:choose>                                                         
							</c:forTokens>
                                                                                                        
                        </div>                       
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h2>${dto.look_name }</h2>
                            
                            
                            <p>${dto.look_content }</p>
                            
                           
                           
                           
                            
                            
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">모델이 착용한 상품</h3>
                </div>
            </div>
            <div class="row" style="margin-left: 450px;">
                <c:forEach var="p" items="${list}">     
            <c:if test="${p.pro_id==dto.look_id }">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <c:choose>
                            		<c:when test="${fn:substringBefore(p.pro_photo,',') !=''}">
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${fn:substringBefore(p.pro_photo,',')}">
                                    		<ul class="product__hover">
                                        		
                                        		<li><a href="${root}/shop/details?idx=${p.idx}&currentPage=${currentPage}&pro_id=${p.pro_id}&key=list"><img src="${root}/img/icon/search.png" alt=""></a></li>
                                    		</ul>
                                		</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="product__item__pic set-bg" data-setbg="../photo/${p.pro_photo}">
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
                                        <c:forEach var="c" items="${list2}">                                 
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
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Section End -->
</body>
</html>