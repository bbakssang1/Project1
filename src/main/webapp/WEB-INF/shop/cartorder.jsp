<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
	.selspan {
		display: inline-flex;
		align-items: center;
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
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="orderinsert" method="post" onsubmit="return submitCheck();">
                <input type="hidden" name="o_totalprice" value="${order.totalprice}">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="coupon__code">${order.cartcnt}개의 상품 주문하기</h6>
                            <h6 class="checkout__title">Billing Details</h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>수령인<span>*</span></p>
                                        <input name="recipient" type="text" value="${order.m_name}">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                            	<p>연락처<span>*</span></p>
                            	<span class="selspan">
                                	<select id="hp">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
								</span>
								<script type="text/javascript">
								$(document).ready(function() {
									$("#hp").change(function() {
										if ($(this).val() == "-") {
											$("#hp1").val('');
										} else {
											$("#hp1").val($(this).val());
										}
									});
								});
								</script>
								&nbsp;
								<input style="width: 100px;" type="text" name="o_hp1" required="required" value="${order.m_hp1}" id="hp1">
								<b>-</b>
								<input style="width: 100px;" type="text" name="o_hp2" required="required" value="${order.m_hp2}">
								<b>-</b>
								<input style="width: 100px;" type="text" name="o_hp3" required="required" value="${order.m_hp3}">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>배송지<span>*</span></p>
                                        <input type="text" name="o_addrnum" id="userZipcode" readonly class='box' value="${order.m_addrnum}"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>&nbsp;</p>
                    					<button style="width: 100px; height: 50px; background: black; color: white; border: 0; font-size: 10pt" type="button" onclick="findAddr()" class="btn1">주소 찾기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <input type="text" name="o_addr" id="addr1" placeholder="주소를 입력하세요" readonly class='box' value="${order.m_addr}"/>
                            </div>
                            <div class="checkout__input">
                                <input type="text" name="o_addrdetail" id="addr2" placeholder="상세 주소를 입력하세요" value="${order.m_addrdetail}"/>
                            </div>
                            <div class="checkout__input">
                                <p>이메일<span>*</span></p>
								<input style="width: 150px;" type="text" name="o_email1" required="required" id="mail" value="${order.m_email1}">	
								<b>@</b>
								<input style="width: 150px;" type="text" name="o_email2" id="domain" required="required" value="${order.m_email2}">
								&nbsp;
								<span class="selspan">
								<select id="selemail">
									<option value="-">직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="nate.com">네이트</option>
									<option value="gmail.com">구글</option>
									<option value="hanmail.net">다음</option>
								</select>
								<script type="text/javascript">
								$(document).ready(function() {
									$("#selemail").change(function() {
										if ($(this).val() == "-") {
											$("#domain").val('');//지정된 메일 지우기
										} else {
											$("#domain").val($(this).val());
										}
									});
								});
								</script>
								</span>
							</div>
                            <div class="checkout__input">
                                <p>배송 시 요청사항</p>
                                <input type="text" placeholder="요청사항을 입력해주세요." name="o_note">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">Your order</h4>
                                <div class="checkout__order__products">Product <span>Total</span></div>
                                <ul class="checkout__total__products">
                                <c:forEach var="cart" items="${cartlist}">
                                    <li>${cart.pro_name}&nbsp;${cart.c_color}${cart.c_size}<span><fmt:formatNumber value="${cart.price * cart.c_qty}" pattern="###,###,###" />￦</span></li>
                                </c:forEach>
                                </ul>
                                <ul class="checkout__total__all">
                                    <li>Total <span><fmt:formatNumber value="${order.totalprice}" pattern="###,###,###" />￦</span></li>
                                </ul>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">결제하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Checkout Section End -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr() {
	daum.postcode.load(function() {
		new daum.Postcode({
			oncomplete: function(data){
				var addr = '';

				if (data.userSelectedType == 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunaddress;
				}
				// 우편번호
				document.getElementById('userZipcode').value = data.zonecode;
				// 주소정보
				document.getElementById('addr1').value = addr;
				}
		}).open();
	});
}
</script>
</body>
</html>