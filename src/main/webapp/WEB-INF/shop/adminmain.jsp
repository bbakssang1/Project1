<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
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

div{
font-family: 'Noto Sans KR';
}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>AdminMain</h4>
                        <div class="breadcrumb__links">
                            <a href="${root}/">Home</a>
                            <span>AdminMain</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	 <section>	 
    <div class="col-lg-2" style="margin-top: 20px;">
 	<div>
       <div>
           <div class="card-body">
           <div class="shop__sidebar__categories">	
         <ul class="mylist">
             <li><a href="addform"><span class="glyphicon glyphicon-plus"></span> 상품추가</a></li>
             <li><a href="list"><span class="glyphicon glyphicon-menu-right"></span> 상품메인으로</a></li>
             <li><a href="${root}/lookbook/lookbookform">> 룩북 추가</a>
         </ul>
     </div>
     </div>
     </div>
     </div>
     </div>
     </section>                
	<section>
	<div class="col-lg-10" style="margin-top: 30px;">
	<div class="alert alert-dark">
	<span class="glyphicon glyphicon-stats"></span><b> 총 ${totalCount}개의 상품이 있습니다</b>
	</div>
	<table class="table table-hover List" style="text-align: left;
      		border-right:white;border-top:black;border-left:white;border-bottom:#e0e0e0;">
		<tr>
			<th width="40">번호</th>
			<th width="50">상품번호</th>
			<th width="50">상품명</th>
			<th width="30">색상</th>
			<th width="40">사이즈</th>
			<th width="30">가격</th>
			<th width="50">상품분류</th>
			<th width="20">수량</th>
			<th width="70">입고날짜</th>
			<th width="80">관리</th>
		</tr>
		
		<c:if test="${totalCount==0}">
			<tr height="50">
				<td colspan="10" align="center">
					<h2>
						<b>등록된 글이 없습니다</b>
					</h2>
				</td>
			</tr>
		</c:if>
		<c:if test="${totalCount>0}">
			<c:forEach var="a" items="${list}">
				<tr>
					<td>${no}</td>
					<c:set var="no" value="${no-1}"/>
					<td>
					<!-- <a href="content?num=${a.num}&currentPage=${currentPage}&key=list"
					style="color: black;"> -->
					<a>${a.pro_id}</a>
					</td>
					<td>${a.joindto.pro_name}</td>

<c:choose>
<c:when test="${a.color eq 'none'}">
<td style="text-align: center;">색상 미기입</td>
</c:when>
<c:otherwise>
<td style=" background-color:  #${a.color}"></td>
</c:otherwise>
</c:choose>
					<td>${a.c_size}</td>
					<td>${a.joindto.price}</td>
					<td>${a.joindto.pro_sub}</td>
					<td>${a.su}
					<a style="float:right;" class="btn btn"
		href="stockform?idx=${a.joindto.idx}&color=${a.color}&pro_id=${a.joindto.pro_id}&c_size=${a.c_size}"><span class="glyphicon glyphicon-plus" style="background-color: white;"></span></a></td>
					<td>
						<fmt:formatDate value="${a.joindto.ipgoday}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
	<button class="btn btn-success btn-sm"
		onclick="location.href='updateform?idx=${a.joindto.idx}&color=${a.color}&pro_id=${a.joindto.pro_id}&c_size=${a.c_size}'"><span class="	glyphicon glyphicon-edit"></span> 수정</button>
	<a type="button" class="btn btn-secondary btn-sm"
	onclick="if(!confirm('해당 항목을 삭제하시겠습니까?')){return false;}"
		href="delete?idx=${a.joindto.idx}&color=${a.color}&c_size=${a.c_size}&currentPage=${currentPage}&key=list">항목삭제</a>
	<a type="button" class="btn btn-dark btn-sm"
	onclick="if(!confirm('해당 상품을 삭제하시겠습니까?(해당 상품번호가 전부 삭제됩니다)')){return false;}"
		href="deleteA?idx=${a.joindto.idx}&color=${a.color}&currentPage=${currentPage}&key=list"><span class="glyphicon glyphicon-trash"></span></a>
					</td>
				</tr>
			</c:forEach>
			
		</c:if>
	
	</table>
		</div>
		
	<!-- 페이징 -->
	<c:if test="${totalCount>0}">
		<div style="width: 100%; text-align: center;">
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${startPage>1}">
					<li><a href="adminmain?currentPage=${startPage-1}">이전</a></li>
				</c:if>
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage==pp}">
						<li class="active"><a href="adminmain?currentPage=${pp}">${pp}</a></li>
					</c:if>
					<c:if test="${currentPage!=pp}">
						<li><a href="adminmain?currentPage=${pp}">${pp}</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음 -->
				<c:if test="${endPage<totalPage}">
					<li><a href="adminmain?currentPage=${endPage+1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
	</section>
	<p style="clear: both;"></p>
</body>
</html>