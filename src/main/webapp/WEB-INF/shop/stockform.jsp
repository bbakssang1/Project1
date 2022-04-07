<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<style>
   .radion{
   display:none;
   }
   
   .radion2{
   display:none;
   }
   
   div{
font-family: 'Noto Sans KR';
}
   ul.mylist, ol.mylist {
    list-style: none;
    margin: 0px;
    padding: 0px;
  
    max-width: 250px;
    width: 100%;
}

ul.mylist li, ol.mylist li {
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 12px;
}

ul.mylist li:before,
ol.mylist li:before {
   
    vertical-align: middle;
    padding: 0px 5px 6px 0px;
}
</style>
<body>
 <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>StockEdit</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/shop/adminmain">AdminMain</a>
                            <span>StockEdit</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </section>
<div class="col-lg-2" style="margin-top: 20px;">
 	<div>
       <div>
           <div class="card-body">
           <div class="shop__sidebar__categories">	
         <ul class="mylist">
             <li><a href="addform"><span class="glyphicon glyphicon-plus"></span> 상품추가</a></li>
             <li><a href="list"><span class="glyphicon glyphicon-menu-right"></span> 상품메인으로</a></li>
             <li><a href="adminmain"><span class="glyphicon glyphicon-menu-right"></span> 운영자홈</a></li>
         </ul>
     </div>
     </div>
     </div>
     </div>
     </div>
     <div class="col-lg-5">
		<div style="margin-top: 30px;"></div>
		<div>
			<div class="well" style="width: 450px; margin-left: 30px;">
				<form action="update3" method="post" enctype="multipart/form-data">
				<input type="hidden" name="currentPage" value="${currentPage}">
					<b>재고수정</b>
					<table class="table table-bordered" style="width: 450px; margin-top: 20px;">
					<c:forEach var="a" items="${list}">
		<input type="hidden" name="num" value="${a.num}">
						<tr>
							<th bgcolor="#ddd" width="80">상품아이디</th>
							<td>${a.pro_id}</td>
						</tr>

						<tr>
							<th bgcolor="#ddd" width="80">색상</th>
							<td>${a.color_name}</td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">사이즈</th>
				<td>${a.c_size}</td>
			</tr>
			<tr>
				<th bgcolor="#ddd" width="120">수량</th>
				<td><input type="text" name="su" class="form-control"
					style="width: 80px;" required="required" class="form" value="${a.su}"></td>
			</tr>
				<tr>
					</c:forEach>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-dark" style="width: 100px;">저장</button>
						</td>
				</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
<div>

	<p style="clear: both;"></p>
	</div>
</body>
</html>