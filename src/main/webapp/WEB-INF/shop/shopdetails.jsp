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
		.numBox {
		width: 40px;
		height: 30px;
		text-align: center;
	}
	.plus, .minus {
		width: 20px;
		height: 20px;
		text-align: center;
		background: white;
		border: 0;
		font-weight: bold;
	}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Shop Details Section Begin -->
    <form role="form" method="post">
    	<input type="hidden" id="pro_id" name="pro_id" value="${dto.pro_id}">
    </form>
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="${root}/">Home</a>
                            <a href="${root}/shop/list">Shop</a>
                            <span>Product Details</span>
                        </div>
                        <p><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;${dto.readcount }</p>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                            <c:forTokens var="pp" items="${dto.pro_photo }" delims="," begin="0" end="4" varStatus="sts"> 
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
                           <c:forTokens var="pp" items="${dto.pro_photo }" delims=","  begin="0" end="4" varStatus="sts">
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
                            <h2>${dto.pro_name }</h2>
                            
                            <h4><fmt:formatNumber value="${dto.price}" pattern="#,###,###"/> ￦</h4>
                            <p>${dto.pro_content }</p>
                           
                           
                           
                            
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                    <div class="glyphicon glyphicon-triangle-bottom" style="color: white;"></div>		
                                    	<select id="sel_cs">
                                   	    	<c:forEach var="po" items="${list6}">
                                   	    		<!-- 색깔-사이즈 의 수량 -->
                                   	    		<c:set var="ro" value="${fn:substringAfter(po.all_column,'-')}"></c:set>
                                    			<c:forEach var="ro1" items="${ro }">
                                    				<!-- 색깔과 사이즈 분리 -->
                                    				<c:set var="cut" value="${fn:split(po.all_column,'-')}"></c:set>
                                    					<c:forEach var="cut1" items="${cut}" begin="0" end="1" varStatus="stat">
                                    						<c:if test="${stat.count==2 }">
                                    							<c:forEach var="cut2" items="${cut}" begin="0" end="0" varStatus="stat2">
                                    								<c:choose>
                                    									<c:when test="${1<=ro1 and ro1<=5 }">
                                    										<option value="${cut2}">${po.color_name }${cut2 }&nbsp;[수량 5개 이하][${ro1 }개 남음!]</option>
                                    									</c:when>
                                    									<c:when test="${ro1>5 }">
                                    										<option value="${cut2}">${po.color_name }${cut2 }</option>
                                    									</c:when>
                                    									<c:when test="${ro1==0 }">
                                    										<option disabled="disabled" value="${cut2}">${po.color_name }${cut2 }&nbsp;<품절></option>
                                    									</c:when>
                                    								</c:choose>
                                    							</c:forEach>
                                    						</c:if>
                                    					</c:forEach>
                                    			</c:forEach>
                            		   		</c:forEach>
                                    	</select>
                                    <!-- <label for="s">S
                                        <input type="radio" id="s">
                                    </label>
                                    <label class="active" for="m">M
                                        <input type="radio" id="m">
                                    </label>
                                    <label for="l">L
                                        <input type="radio" id="l">
                                    </label> -->
                                   
                            </div>
                                <div class="product__details__option__color">
                                    <span style="margin-bottom: 30px;">Color: </span>
                                    	<c:forEach var="po" items="${list2}">
                                    		<span id="colorbox" style="border:3px solid black; width: 20px; height: 20px; border-radius: 100px; background-color:  #${po.color}; float: right; margrin-right:5px; margin-bottom:30px;" ></span>
                            			</c:forEach>
                                </div>
                            </div>
                            <div class="product__details__cart__option">
                                <div align="center" style="margin-bottom: 20px;">
                                	<table>
                                		<tr>
                                			<td rowspan="2">
                                				수량 : <input class="numBox" type="number" min="1" max="5" value="1" readonly="readonly">
                                			</td>
                                			<td>
                                				<button class="plus" type="button">∧</button>
                                			</td>
                                		</tr>
                                		<tr>
                                			<td>
                                				<button class="minus" type="button">∨</button>
                                			</td>
                                		</tr>
                                	</table>
                                </div>
                                <script type="text/javascript">
                                	$(".plus").click(function() {
                                		var num = $(".numBox").val();
                                		var plusNum = Number(num)+1;
                                		if(plusNum > 5){
                                			$(".numBox").val(num);
                                		} else {
                                			$(".numBox").val(plusNum);
                                		}
                                	});
                                	
                                	$(".minus").click(function() {
                                		var num = $(".numBox").val();
                                		var minusNum = Number(num)-1;
                                		if(minusNum <= 0){
                                			$(".numBox").val(num);
                                		} else {
                                			$(".numBox").val(minusNum);
                                		}
                                	});
                                </script>
                                <c:choose>
                                	<c:when test="${sessionScope.loginok!=null}">
                                		<button type="button" class="addCart_btn primary-btn">add to cart</button>
                                	</c:when>
                                	<c:otherwise>
                                		<button type="button" class="not_addCart_btn primary-btn" style="background: gray; border: gray;">add to cart</button>
                                	</c:otherwise>
                                </c:choose>
                                <script type="text/javascript">
                                	
                                	$(".not_addCart_btn").click(function() {
                                		alert("로그인 하세요");
                                	});
                                	
                                	$(".addCart_btn").click(function() {
                                		var pro_id = $("#pro_id").val();
                                		var c_qty = $(".numBox").val();
                                		var sel_cs = $("#sel_cs").val();
                                		var c_color = sel_cs.substring(0, (sel_cs.length)-1);
                                		var c_size = sel_cs.substring((sel_cs.length)-1, (sel_cs.length));
                                		var data = {
                                				pro_id : pro_id,
                                				c_qty : c_qty,
                                				c_color : c_color,
                                				c_size : c_size
                                		};
                                		$.ajax({
                                			type: "post",
                                			data: data,
                                			url: "addcart",
                                			success: function(result) {
												if(result == 1){
													alert("상품을 카트에 담았습니다");
													$(".numBox").val("1");
												} else {
													alert("로그인 하세요");
													$(".numBox").val("1");
												}
											},
											error: function() {
												alert("카트에 담기 실패");
											}
                                		});
                                	});
                                </script>
                            </div>
                            <div class="product__details__btns__option">
                                <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                                
                            </div>
                            <div class="product__details__last__option">
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="${root}/img/shop-details/details-payment.png" alt="">
                                <ul>
                                    <li><span>아이템 코드:</span> ${dto.pro_id }</li>
                                    <li><span>분류:</span> ${dto.pro_sub }</li>
                                    <li><span>Tag:</span> Clothes, Body</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                    role="tab">상세정보</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">주의사항</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        
                                        <div class="product__details__tab__content__item">
                                            <img alt="" src="../photo/15.jpg" style="margin-left: 150px;">
                                        </div>
                                        
                                    </div>
                                </div>
                                
                                <div class="tab-pane" id="tabs-7" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        
                                        <div class="product__details__tab__content__item">
                                             <img alt="" src="../photo/10.jpg" style="margin-left: 150px;">
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
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
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
                <c:forEach var="p" items="${list}">     
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
            </div>
        </div>
    </section>
    <!-- Related Section End -->
</body>
</html>