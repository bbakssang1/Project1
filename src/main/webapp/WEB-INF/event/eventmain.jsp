<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	.eventimg {
		height: 200px;
	}
	
	.eventtb {
		width: 900px;
		border: 1px solid #d3d3d3;
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
                        <h4>Event Page</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Event</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                <div class="row" style="margin-bottom: 100px;">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                    role="tab" style="color: black;">진행중인 이벤트</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">지난 이벤트</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
										<div align="center">
											<table class="eventtb">
												<tr>
													<th>
														<img class="eventimg" alt="" src="${root}/event1.png">
														<span style="margin-left: 30px; font-size: 20px"><a style="color: black;" href="${root}/event/event1"><b>LOMBOK Lunching Big Event</b></a></span>
													</th>
												</tr>
											</table>
										</div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-6" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    <!-- Shop Details Section End -->

</body>
</html>