<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
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
                        <h4>결제완료</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/">Home</a>
                            <a href="${root}/">Shop</a>
                            <a href="${root}/">Cart</a>
                            <span>결제완료</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
<div align="center">
<span><img src="${root}/lombok_logo.png"></span>
<h4><b>결제가 완료되었습니다</b></h4>
<br>
<a href="${root}/mypage/orderlist?id=${userid}" style="color: white; width: 360px;" class="primary-btn">주문 내역 확인하기</a>
</div>
</body>
</html>