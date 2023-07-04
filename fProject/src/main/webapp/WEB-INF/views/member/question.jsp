<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/faq.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faq.css" />
<!-- 밑에서 부터 본문 내용 -->
<!-- 1. 첫번째 div id="ediv" 하나 생성 후 그 안에 mypage.jsp를 include하기 
     2. 첫번째 div 속성값 width: 100%; display: flex; 주기
     3. 첫번째 div 안에 mypage.jsp include한곳 바로 밑에
     div 하나 생성 후 width: 800px; height: 500px; margin-top: 10%; 속성값 주면 본문내용
     
     테스트용
-->

<div id="ediv">
	<jsp:include page="/WEB-INF/views/common/mypage.jsp" />
		<div id="fdiv">
			<div id="idiv">자주 묻는 질문</div>
    
      			<div>
      				<div class="faq">
      					<div class="question">
	      					<h3>Q. 아이디/비밀번호를 찾고싶은데 어떻게 해야되나요 ?</h3>
	      						<div class="answer">
						      		<p>
						            A. 로그인 버튼을 클릭시 회원정보찾기 버튼이 있습니다.
						               아이디/비밀번호를 찾기를 이용해주시면 됩니다. 감사합니다.
						          	</p>
          						</div>
        				</div>
      				</div>
      
				<div>
					<div class="faq">
      					<div class="question">
	      					<h3>Q. 주문을 취소하고 싶어요 !</h3>
				      		<div class="answer">
					      		<p>
					            A. 고객센터 전화를 통해 취소를 할 수 있습니다. 다만, 조리가 완료된
            					   상태라면 취소접수 진행은 어려움이 있을 수 있습니다.
					          	</p>
			          		</div>
        				</div>
      				</div>
    			</div>
    			
    			<div>
					<div class="faq">
      					<div class="question">
	      					<h3>Q. 결제방법은 어떤 것들을 지원하나요 ?</h3>
				      		<div class="answer">
					      		<p>
					            A. 다양한 결제 방법을 지원하고 있습니다. 신용카드, 직불카드, 온라인
            					   결제 서비스 등 다양한 옵션 중에서 편리하신 방법을 선택하여 결제하실
            					   수 있습니다.
					          	</p>
			          		</div>
        				</div>
      				</div>
    			</div>
    			
    			<div>
					<div class="faq">
      					<div class="question">
	      					<h3>Q. 음식 배달 시간은 어떻게 되나요 ?</h3>
				      		<div class="answer">
					      		<p>
					            A. 음식 배달 시간은 지역 및 음식에 따라 다를 수 있습니다. 보통 주문
						           후 30분이내 배달예정됩니다. 정확한 배달 시간은 주문 시 알려드리며,
						           주문 추적 번호를 통해 배달 상황을 실시간으로 확인할 수 있습니다.
					          	</p>
			          		</div>
        				</div>
      				</div>
    			</div>
    			
    			<div>
					<div class="faq">
      					<div class="question">
	      					<h3>Q. 음식에 문제가 있을 경우 어떻게 해결하나요 ?</h3>
				      		<div class="answer">
					      		<p>
					            A. 음식에 문제가 있을 경우 우선적으로 저희 고객 서비스팀에 문의해
            					   주세요. 문제 상황을 파악하고 최선의 해결 방법을 제시해 드릴
            					   것입니다. 필요에 따라 교환 및 환불 등의 조치를 취해드릴 수 있습니다.
					          	</p>
			          		</div>
        				</div>
      				</div>
    			</div>
    			
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
