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
    <script type="text/javascript">
	$(function() {
		//이메일 선택 이벤트
		$("#selemail").change(function() {
			if ($(this).val() == "-") {
				$("#domain").val('');//지정된 메일 지우기
			} else {
				$("#domain").val($(this).val());
			}
		});
		
		
		
		$("#pass").blur(function() {
			var pass = $(this).val();
			if(pass.length < 8){
				if(pass.length == 0){
					$("#passmsg").html("<font color='red'>필수 정보입니다.</font>");
				} else {
					$("#passmsg").html("<font color='red'>비밀번호를 8자리 이상 입력해주세요</font>");
				}
			} else {
				$("#passmsg").html("&nbsp;");
			}
		});
		
		$("#pass2").blur(function() {
			var pass1 = $("#pass").val();
			var pass2 = $(this).val();
			if(pass1 != pass2){
				if(pass2.length == 0){
					$("#passcheckmsg").html("&nbsp;")
				} else {
					$("#passcheckmsg").html("<font color='red'>비밀번호가 일치하지 않습니다.</font>");
				}
			} else {
				if(pass2.length == 0){
					$("#passcheckmsg").html("&nbsp;")
				} else {
					$("#passcheckmsg").html("<font color='green'>비밀번호가 일치합니다.</font>");
				}
			}
		});
		
		$("#name").blur(function() {
			var name = $("#name").val();
			if(name.length == 0){
				$("#namemsg").html("<font color='red'>필수 정보입니다.</font>");
			} else {
				$("#namemsg").html("&nbsp;")
			}
		});
		/////////////////////////////////////////////이메일//////
		
		$("#sendMail").click(function() {// 메일 입력 유효성 검사
			var mail = $("#mail").val(); //사용자의 이메일 입력값. 
			
			if (mail == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			} else {
				mail = mail+"@"+$("#domain").val(); //셀렉트 박스에 @뒤 값들을 더함.
				$.ajax({
					type : 'post',
					dataType :'json',
					url : '/member/CheckMail',
					data : {mail:mail},
					success:function(data){
						console.log(data);
						key = data;
					}
				});
				alert("인증번호가 전송되었습니다.") 
				isCertification=true; //추후 인증 여부를 알기위한 값
				$("#compare").on("propertychange change keyup paste input", function() {
					if ($("#compare").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
						$("#compare-text").html("<font color='green'>인증코드가 일치합니다.</font>");
						isCertification = true;  //인증 성공여부 check
					} else {
						$("#compare-text").html("<font color='red'>인증코드가 일치하지 않습니다.</font>");
						isCertification = false; //인증 실패
					}
				});
			}
		});
		
		$("#submit-btn").click(function submitCheck(){
			if(isCertification==false){
				alert("메일 인증이 완료되지 않았습니다.");
				return false;
			}else
				true;
		});
	});

	function check(f) {
		if (f.id.value.length == 0) {
			alert("아이디를 입력해주세요");
			return false;//action이 호출되지 않는다
		}
		if (f.pass.value != f.pass2.value) {
			alert("비밀번호가 서로 다릅니다");
			f.pass.value = "";
			f.pass2.value = "";
			return false;//action이 호출되지 않는다
		}
		if (f.pass.value.length < 8) {
			$("#passmsg").html("<font color='red'>비밀번호를 8자리 이상 입력해주세요</font>");
			$("#pass").val("");
			$("#pass").focus();
			return false;
		}
		return true;

	}
</script>
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
    <a href="${root}/mypage/main?id=${sessionScope.myid}">
    <section id="csheader">
        <h1 class="header__title__main">LomBok MyPage</h1>
        <h1 class="header__title__description">고객님의 소중한 정보입니다.</h1>
    </section>
    </a>
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
	 						<h4><b>${dto.name}님,</b> <br><span>LomBook에 오신걸 환영합니다.</span></h4>
	 					</div>
 					</div>
 					<div class="joindiv1">
						<form action="update" method="post" onsubmit="return submitCheck();">
						<input type="hidden" name="id" value="${dto.id}">
						
						   <table class="jointb1">
							<tr>
								<th class="thfriends">아이디</th>
							</tr>
							<tr>
								<td>
									${dto.id }<p style="color: red;"> *수정불가</p>
									
									<hr>
								</td>
							</tr>
							
							<tr>
								<th class="thfriends">이름</th>
							</tr>
							<tr>
								<td>
									${dto.name }<p style="color: red;"> *수정불가</p>
									
									<hr>
								</td>
							</tr>
							<tr>
								<th class="thfriends">성별</th>
							</tr>
							
							<tr>
							<c:choose>
								<c:when test="${dto.selegender=='man' }">
									<td>
									<span>
										남성<p style="color: red;"> *수정불가</p>
									</span>
									<hr>
									<br>
								</td>
								</c:when>
								<c:otherwise>
									<td>
									<span>
										여성<p style="color: red;"> *수정불가</p>
									</span>
									<br>
									<hr>
									
								</c:otherwise>
							</c:choose>
								
							</tr>
							
							<tr>
								<th class="thfriends">생년월일</th>
							</tr>
							<tr>
								<td>
									<span>${dto.birth}<p style="color: red;"> *수정불가</p></span>
									<br>
									
								</td>
								
							</tr>
							
							<tr>
								<th class="thfriends">비밀번호</th>
							</tr>
							<tr>
								<td>
									<input type="password" name="pass" required="required" class="txtfriends" placeholder="8자리 이상 입력해주세요" id="pass">
									<br>
									<b id="passmsg" class="msg">&nbsp;</b>
								</td>
							</tr>
							<tr>
								<th class="thfriends">비밀번호 확인</th>
							</tr>
							<tr>
								<td>
									<input type="password" name="pass2" class="txtfriends" required="required" placeholder="비밀번호 확인" id="pass2">
									<br>
									<b id="passcheckmsg" class="msg">&nbsp;</b>
								</td>
							</tr>
							
							
							<tr>
								<th class="thfriends">이메일</th>
							</tr>
							<tr>
								<td>
									<input type="text" name="email1" required="required" class="txtemail" id="mail" value="${dto.email1 }">	
									<b>@</b>
									<input type="text" name="email2" id="domain" required="required" class="txtemail" value="${dto.email2}">
									<span class="selspan">
										<select id="selemail" class="selbox1">
											<option value="-">직접입력</option>
											<option value="naver.com">네이버</option>
											<option value="nate.com">네이트</option>
											<option value="gmail.com">구글</option>
											<option value="hanmail.net">다음</option>
										</select>
									</span>
									<br>
								</td>
							</tr>
							<tr>
								<td>
									<button type="button" class="btn1" id="sendMail">인증번호 받기</button>
									<input type="text" class="txtfriends2" id="compare" placeholder="인증번호를 입력해주세요">
									<b id="compare-text" class="msg">&nbsp;</b>
									<br>
								</td>
							</tr>
							<tr>
								<th class="thfriends">주소</th>
							</tr>
							<tr>
								<td>
									<input type="text" name="addrnum" class="txtfriends2" id="userZipcode" readonly class='box' value="${dto.addrnum }"/>
				                    <input type="button" value="주소 찾기" onclick="findAddr()" class="btn1">
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="addr" class="txtfriends" id="addr1" placeholder="주소를 입력하세요" readonly class='box' value="${dto.addr }"/>
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="addrdetail" id="addr2" class="txtfriends" placeholder="상세 주소를 입력하세요" value="${dto.addrdetail}"/>
									<br>
									<br>
								</td>
							</tr>
							
							
							<tr>
								<th class="thfriends">핸드폰</th>
							</tr>
							<tr>
								<td>
									<span class="selspan">
										<select id="hp" name="hp1" class="selbox3">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
									</span>
									<b>-</b>
									<input type="text" name="hp2" required="required" class="txtfriendhp" value="${dto.hp2}">
									<b>-</b>
									<input type="text" name="hp3" required="required" class="txtfriendhp" value="${dto.hp3}">
									<br>
									<br>
								</td>
							</tr>
							<tr>
								<th class="thfriends">키/몸무게</th>
							</tr>
							<tr>
								<td>
									<input type="text" name="height" required="required" placeholder="키" class="txtfriends3" value="${dto.height}">
									<b>cm</b>
									<input type="text" name="weight" required="required" placeholder="몸무게" class="txtfriends3" value="${dto.weight}">
									<b>kg</b>
									<br>
									<br>
								</td>
							</tr>
							<tr>
								<td>
									<button type="submit" class="btn2" id="submit-btn">정보수정</button>
									
								</td>
								
							</tr>
						</table>
					</form>
				</div> 						
                </div>
                
                
                <!-- FAQ Menu side -->
                <div class="main__content__aside">
                    <!-- Menu -->
                    <ul class="sidebar-menu">
                        <li class="sidebar-menu__item-menu">
                           <p class="menu__title_mypage"><a href="${root}/mypage/main?id=${sessionScope.myid}">My Page<a></a></p>
                            <ul class="menu__list">
                                <li class="menu__item"><a href="${root}/mypage/orderlist?id=${sessionScope.myid }"><i class="far fa-file-alt"></i>주문내역</a></li>
                                <li class="menu__item"><a href="${root}/mypage/updatepassform?id=${sessionScope.myid}"><i class="far fa-user"></i>회원정보수정</a></li>
                                <li class="menu__item"><a href="${root}/mypage/deletepassform?id=${sessionScope.myid}""><i class="fas fa-times"></i>회원탈퇴</a></li>
                               
                            </ul>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </div> 
        
    </section>
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
