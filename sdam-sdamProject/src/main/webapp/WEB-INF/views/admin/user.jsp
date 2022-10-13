<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="keywords" />
<meta content="" name="description" />

<!-- Bootstrap CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- Favicon -->
<link href="../img/favicon.ico" rel="icon" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Quicksand:wght@600;700&display=swap" rel="stylesheet" />

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Libraries Stylesheet -->
<link href="../lib/animate/animate.min.css" rel="stylesheet" />
<link href="../lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
<link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="../css/bootstrap.min.css" rel="stylesheet" />

<!-- Template Stylesheet -->
<link href="../css/style.css" rel="stylesheet" />

</head>

<body class="bg-light">

<!-- Spinner Start -->
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	<div class="spinner-border text-primary" style="width: 3rem; height: 3rem" role="status">
        <span class="sr-only">Loading...</span>
	</div>
</div>
<!-- Spinner End -->
	
<!-- TOP MENU -->
<c:import url="/WEB-INF/views/include/top_menu.jsp"></c:import>

<!-- Start -->
<%-- <div class="container">
	<div class="row g-5 mb-5 align-items-end wow fadeInUp" data-wow-delay="0.1s">
		<div class="col-lg-6" >
			<p><span class="text-primary me-2">#</span>마이페이지(My Page)</p>
			<h1 class="display-6 mb-0">우리는 쓰담쓰담의 <span class="text-primary">테라피독</span>입니다</h1>
		</div>
		<div class="col-lg-6 text-lg-end">
			<a class="btn btn-primary py-3 px-5" href="${root}service/adddog">테라피독 등록하기</a>
		</div>
	</div>
</div> --%>

<div class="container-fluid header-bg py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
	<div class="container py-5">
		<h1 class="display-4 text-white mb-3 animated slideInDown">
          관리 페이지
		</h1>
		<nav aria-label="breadcrumb animated slideInDown">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item">
					<a class="text-white" href="${root }main">Home &nbsp;/ </a>
				</li>
				<li class="breadcrumb-item text-primary active" aria-current="page">
					회원관리
				</li>
			</ol>
		</nav>
	</div>
</div>
<!-- Page Header End -->

<!-- Start -->
<div class="container-xxl py-5" style="display:flex;">
<!--<div class="container"> -->
	<div class="col-lg-3">
		
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="collapse navbar-collapse" >
				<div class="navbar-nav">
					<div class="nav-item dropdown">
						<a class="nav-item nav-link" href="${root }admin/user" aria-current="page" style="padding:0 0 10px 0;"><span class="text-primary me-2">#</span> 회원관리</a> <!-- aria-current 현재페이지 -->
						<a class="nav-item nav-link" href="${root }admin/book" style="padding:10px 0;"> 예약관리</a>
					</div>
				</div>
			</div>
		</nav>
		
	</div>
	
	<div class="col-lg-9 bg-white card shadow">  
		<div class="testimonial-item">
			<div class="mt-4 mb-1 ms-5 my-5 wow fadeInUp">
				<h4 class="display-7" data-wow-delay="0.1s" style="display:inline-block;">회원관리</h4>
			</div>
			
				
				
<div class="container">
	<div class="card shadow">
		<div class="card-body">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center d-none d-md-table-cell">번호</th>
						<th  class="text-center d-none d-md-table-cell">ID</th>
						<th class="text-center d-none d-md-table-cell">이름</th>
						<th class="text-center d-none d-md-table-cell">전화번호</th>
						<th class="text-center d-none d-md-table-cell">생일</th>
						<th class="text-center d-none d-md-table-cell">주소</th>
						<th class="text-center d-none d-md-table-cell">수정</th>
						<th class="text-center d-none d-md-table-cell">탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="adminUserList" items="${adminUserList}">
					<tr>
						<td class="text-center d-none d-md-table-cell">${adminUserList.user_idx }</td>
						<td class="text-center d-none d-md-table-cell">${adminUserList.user_id }</td>
						<td class="text-center d-none d-md-table-cell">${adminUserList.user_name}</td>
						<td class="text-center d-none d-md-table-cell">${adminUserList.user_tel}</td>
						<td class="text-center d-none d-md-table-cell">${adminUserList.user_birth}</td>
						<td class="text-center d-none d-md-table-cell">${adminUserList.user_address}</td>
						<td><a href="#">수정</a></td>
						<td><a href="${root }admin/userdelete?user_idx=${adminUserList.user_idx}">탈퇴</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
			
        </div>
        
        <div class="col-sm-3"></div>
<!--</div> -->
	</div>
<!--</div> -->
</div>
<!-- End -->

<!-- BOTTOM MENU -->
<c:import url="/WEB-INF/views/include/bottom_info.jsp"></c:import>

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../lib/wow/wow.min.js"></script>
<script src="../lib/easing/easing.min.js"></script>
<script src="../lib/waypoints/waypoints.min.js"></script>
<script src="../lib/counterup/counterup.min.js"></script>
<script src="../lib/owlcarousel/owl.carousel.min.js"></script>
<script src="../lib/lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="../js/main.js"></script>


<script type="text/javascript">

</script>


</body>
</html>