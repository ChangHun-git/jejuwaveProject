<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result==1 }">
		<script type="text/javascript">
			alert("��λ�������");
			location.href="mypageTraveler.do";
		</script>
	</c:if>
	<c:if test="${result==2 }">
		<script type="text/javascript">
			alert("��λ�������");
			location.href="mypageCommunity.do";
		</script>
	</c:if>
	<c:if test="${result==3 }">
		<script type="text/javascript">
			alert("��λ�������");
			location.href="mypageBoard.do";
		</script>
	</c:if>
	<c:if test="${result==4 }">
		<script type="text/javascript">
			alert("��λ�������");
			location.href="mypageCommentTravel.do";
		</script>
	</c:if>
	<c:if test="${result==0 }">
		<script type="text/javascript">
			alert("��λ�������");
			history.back();
		</script>
	</c:if>
</body>
</html>