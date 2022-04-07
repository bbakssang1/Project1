<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="<%=request.getContextPath()%>"/>
    <!-- Footer Section Begin -->
    <footer class="footer" style="margin-top:150px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a><img src="${root}/img/lomlogowhi.png" alt=""></a>
                        </div>
                        <p>당신의 옷장에 L@MB@K을 import! &nbsp;&nbsp;&nbsp;   안녕하세요 오늘도 L@MB@K을 찾아주셔서 매우 감사합니다.</p>
                        <a href="#"><img src="${root}/img/payment.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="${root}/shop/list">SHOP</a></li>
                            <li><a href="${root}/lookbook/lookbookmain">Look Book</a></li>
                            <li><a href="${root}/memeber/mypage">MYPAGE</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Faqs</h6>
                        <ul>
                            <li><a href="${root}/cscenter/csmain">Contact Us</a></li>
                            <li><a href="${root}/cscenter/csmain">Payment Methods</a></li>
                            <li><a href="${root}/cscenter/csmain">Delivary</a></li>
                            <li><a href="${root}/cscenter/csmain">Return & Exchanges</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>Follow</h6>
                        <div class="footer__newslatter">
                            <p>다양한 세일정보와 프로모션을 이메일로 만나보세요!</p>
                            <form action="#">
                                <input type="text" placeholder="Your email">
                                <button type="submit"><span class="icon_mail_alt"></span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="footer__copyright__text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <p>Copyright ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>2021
                            All rights reserved | This template is made with <i class="fa fa-heart-o"
                            aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        </p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
