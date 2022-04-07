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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	.prophoto {
		height: 100px;
		width: 80px;
		object-fit: cover;
	}
	
	.qtyprice {
		width: 80px;
		text-align: center;
		border: 0;
		font-weight: bold;
	}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/">Home</a>
                            <a href="${root}/shop/list">Shop</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

	<!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>
                                    	<input type="checkbox" name="allCheck" id="allCheck">
                                    	<script type="text/javascript">
                                    		$( '#allCheck' ).click( function() {
                                    			$( '.chBox' ).prop( 'checked', this.checked );
                                    		});
                                    	</script>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cdto" items="${cartlist}">
                                <tr>
                                    <td class="product__cart__item">
                                       
                                  <c:choose>
                            		<c:when test="${fn:substringBefore(cdto.pro_photo,',') !=''}">
                                		
                                    		<img class="prophoto" src="${root}/photo/${fn:substringBefore(cdto.pro_photo,',')}" alt="">
                                		
                                	</c:when>
                                	<c:otherwise>
                                			<img class="prophoto" src="${root}/photo/${cdto.pro_photo}" alt="">
                                	</c:otherwise>
                                </c:choose>
                                        <div class="product__cart__item__text">
                                            <h6>${cdto.pro_name}&nbsp;${cdto.c_color}${cdto.c_size}</h6>
                                            <h5><fmt:formatNumber value="${cdto.price}" pattern="###,###,###" />￦</h5>
                                        </div>
                                    </td>
                                    <td class="cart__price"><input class="qtyprice" type="text" value="${cdto.c_qty}" readonly="readonly"></td>
                                    <td class="cart__price"><fmt:formatNumber value="${cdto.price * cdto.c_qty}" pattern="###,###,###" />￦</td>
                                    <td><input type="checkbox" name="chBox" class="chBox" data-c_idx="${cdto.c_idx}"></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="${root}/shop/list">Continue Shopping</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a type="button" class="deletebtn">Delete Cart</a>
                                <script type="text/javascript">
                                	$(".deletebtn").click(function() {
                                		var confirm_val = confirm("삭제하시겠습니까?");
                                		if(confirm_val){
                                			var checkArr = new Array();
                                			$("input[class='chBox']:checked").each(function() {
                                				checkArr.push($(this).attr("data-c_idx"));
                                			});
                                			$.ajax({
                                				type: "post",
                                				data: {chbox:checkArr},
                                				url: "deletecart",
                                				success: function(result) {
													if(result==1){
														location.href="cart";
													} else {
														alert("삭제 실패");
													}
												}
                                			});
                                		}
                                	});
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Total <span><c:forEach var="cdto" items="${totalpriceandcnt}"><fmt:formatNumber value="${cdto.totalprice}" pattern="###,###,###" />￦</c:forEach></span></li>
                        </ul>
                        <a href="${root}/shop/order" style="color: white;" class="primary-btn">Proceed to checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
</html>