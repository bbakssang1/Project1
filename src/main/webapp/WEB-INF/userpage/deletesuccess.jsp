<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 | LomBok</title>
    <meta name="description" content="Lombok CS center">
    <link rel="icon" type="image/png" href="imgs/at-solid.png"/>
    <script src="https://kit.fontawesome.com/55fa8b84a2.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../resources/cscenterstyle.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
#csheader {
  background: url("../photo/home-background.png") center/cover no-repeat;
  padding: 30px;
  text-align: center;
}

.summary a:hover{
	color:#000;
}

a:hover {
	color: #000;
}

#kakao-talk-channel-chat-button{
	display: none;
}
@media screen and (max-width: 1100px){
	.link-list li{
		width: 50%;
	}
	.main__content__aside{
		display: none;
	}
	.main-content__body {
		margin: 0 auto;
	}
	#kakao-talk-channel-chat-button{
		display: block;
		text-align: right;
		bottom: 10px;
		position: sticky;
	}
	.header__title__description{
		display: none;
	}
	.header__title__main{
		text-align: center;
	}
	
}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- CS Center Header -->
        <section id="csheader">
        <h1 class="header__title__main">LomBok MyPage</h1>
        <h1 class="header__title__description">감사합니다.</h1>
    </section>
    
    <!-- CS Center Main Content -->
    <section id="main" class="section">
        <div class="main-content">
            <div class="main-container main-content__body">
                <div class="main-content__main">
                	<div class="mypage_top_box">
	 					<div class="mypage__image__top">
	 						<img class="mypage_img" src="${root}/photo/LOGO.png">
	 					</div>
	 					<div class="mypage__text__top">
	 						<h4><span>그동안 저희 LomBok을 찾아주셔서 감사합니다.
	 						<br>
	 						다음엔 더 나은 서비스로 찾아뵙겠습니다.
	 						</span></h4>
	 						
	 						
	 					</div>
 					</div>
 					<div class="mypage__order__title">
							
 					</div>
 					
                </div>
                
                
                <!-- FAQ Menu side -->
                <div class="main__content__aside">
                    <!-- Menu -->
                    <ul class="sidebar-menu">
                        <li class="sidebar-menu__item-menu">
                            <p class="menu__title_mypage">돌아가기<a></a></p>
                            <ul class="menu__list">
                                <li class="menu__item"><a href="${root}/"><span class="glyphicon glyphicon-home"></span>  홈으로</a></li>
                                
                               
                            </ul>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </div> 
    </section>

    
</body>

</html>
