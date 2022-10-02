<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String context = request.getContextPath();
String userId = (String) session.getAttribute("user_id");
request.setAttribute("userId", userId);
%>
<c:import url="/yn/header.jsp"></c:import>

	

<!-------------- body 영역 ------------> 	
<div style="margin-top: 50px;"></div>
        <!-- 게시물 -->
<div class="container ">
	<div class="row justify-content-center">
		<div class="col-lg-9 justify-content-start">
						<!-- Post content-->
						<article class="mb-5 pb-3">
							<!-- 게시물 이미지 -->
							<figure class="mb-4">
								<img class="img-fluid rounded mb-5" src="yn_images/upload/${travelContent.t_img}" style="width:100%; height:250px; object-fit:cover;">
							</figure>
							
							<!-- 글제목 -->
						 	<header class="mb-3">
								<p name="t_title" class="h4 fw-bold mb-2">${travelContent.t_title}</p>
							
								<!--작성일 -->
								<p  id="dateViwer" class="text-muted m-0 form-check-inline align-center">${travelContent.t_date}</span> 
									<c:if test="${travelContent.user_id eq userId}">
									<button onclick="location.href='travelUpdate.do?t_num=${travelContent.t_num}'" type="button" id="dateViwer" class="btn p-0  m-0 text-muted">&nbsp&nbsp&#183&nbsp&nbsp수정</button>
									<button onclick="location.href='travelDelete.do?t_num=${travelContent.t_num}'" id="dateViwer" type="button" class="btn p-0 text-muted">&nbsp&nbsp&#183&nbsp&nbsp삭제</button>
										<c:if test="${travelContent.t_dealstatus == 0}">
										<button onclick="location.href='travelStatus.do?t_num=${travelContent.t_num}'" id="dateViwer" type="button" class="btn p-0 text-muted">&nbsp&nbsp&#183&nbsp&nbsp모집 완료</button>
										</c:if>
									</c:if>
								</p>
							</header>
							<!-- 박스 --> 					
							<div class=" form-group row my-5  ">
								<!-- 모집인원,기간 박스  -->
								<div class="card py-2 inline col-lg-9 justify-content-start floatLL ms-3">
									<div class="card-body ">
										<p class="mb-2"><span id="keyColor" class="fw-bold me-2">${travelContent.t_gubun}</span>모집 인원 ${travelContent.t_person}명</p>
										<div>
											<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-calendar-check-fill" viewBox="0 0 17 17">
							  				<path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zm-5.146-5.146-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708z"/>
											</svg>
											<span class="mt-1">${travelContent.t_start}&nbsp~&nbsp${travelContent.t_end}</span>
										</div>
									</div>
								</div>
								<!-- 사이드 바 메뉴 동행 후기 보기-->
								<div class="panel panel-info border justify-content-end floatRR col-lg-2 ms-3 p-3 align-middle" id="userBox">
									<div class="card-body mb-0 p-0">
										<img src="yn_images/user_icon01.png" width="32" height="32" class="userIconColor-1 rounded-circle me-2  align-center border-2 border-secondary">
										<span name="user_id" class="h5">${travelContent.user_id}</span>
										<button type="button" class="btn center mt-2" id="trCommBtn">동행후기 보기</button>		
									</div>
								</div>
							</div>
							<!-- 글 내용 -->
							<section class="mb-5">
								<p class="fs-6 mb-4" >
									${travelContent.t_content}
								</p>
							</section>
						</article>
			
						<!-- 댓글 -->
						<section class="my-5">
							<div class="card bg-light card-body my-4 p-4 border-0">
								<!-- 댓글 박스 -->
								<form class="mb-6">
									<div class="input-group my-3">
										<span class="input-group-text" id="commInsBtn" style="background:#ff3500; border-right:none;">
											댓글 등록
										</span>
										<!-- <textarea class="form-control" rows="2" placeholder="댓글을 남겨 보세요!">	</textarea> -->
										<textarea type="text" class="form-control p-3" style=" border-left:none;" placeholder="댓글을 남겨 보세요!" aria-label="Input group example" aria-describedby="basic-addon1"></textarea>
									</div>
								</form>
								<!-- 구분 라인 --> 
								<hr class="mt-4">
		
							 	<!-- 댓글 영역 -->  
								<c:forEach var="reply" items="${replyList}">
								
								<div class="d-flex mb-4 pt-3">
										<div class="flex-shrink-0 ms-5">
										
										<!-- style="margin-right:${travel.t_relevel*10}px;" -->
										<c:if test="${reply.t_relevel > 1}">
											<span class="me-5"></span>
										</c:if>
										<img src="yn_images/user_icon01.png"  width="46" height="46" class="userIconColor-1 rounded-circle me-2  align-center bg-white">
										</div>
									<div class="ms-3">
										<div class="fw-bold">${reply.user_id}</div>${reply.t_content}
									</div>	
								</div>	
								
								</c:forEach>
							</div>
						</section>
		</div>
	</div>
</div>


<div style="margin-top: 200px;"></div>
<%@ include file="footer.jsp"%>


<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
