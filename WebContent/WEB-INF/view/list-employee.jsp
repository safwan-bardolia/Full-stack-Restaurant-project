<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Feliciano - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css" />

<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">

<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">

<link rel="stylesheet" href="../css/aos.css">

<link rel="stylesheet" href="../css/ionicons.min.css">

<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">


<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div class="py-1 bg-black top">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">+ 8999174725</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">safvanbardoliagmail@gmail.com</span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
							<p class="mb-0 register-link">
								<span>Open hours:</span> <span>Monday - Sunday</span> <span>8:00AM
									- 6:00PM</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Feliciano</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/#about" class="nav-link">About</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Admin</a></li>
					<li class="nav-item"><a	href="${pageContext.request.contextPath}/booking/list"	class="nav-link">Booking</a></li>
				</ul>

				<form:form action="${pageContext.request.contextPath}/logout" method="POST">
						<input type="submit" value="logout" class="btn btn-danger" id="logout" style="position: absolute;right: 10px;bottom: 8px;">
				</form:form>
				
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('../images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate text-center mb-4">
					<h1 class="mb-2 bread">Employee Directory</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="${pageContext.request.contextPath}/">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Admin <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container-fluid px-0">
			<div class="row d-flex no-gutters">
				<div
					class="col-md-12 order-md-last ftco-animate makereservation p-4 p-md-5 pt-5">
					<div class="py-md-5">
						<div class="heading-section ftco-animate mb-5">
							<span class="subheading">See a Directory</span>
							<h2 class="mb-4">Employee List</h2>
							<table class="table table-bordered" id="datatable">
								<thead>
									<tr class="thead-dark">
										<th>Name</th>
										<th>email</th>
										<th>age</th>
										<th>city</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${employees}" var="employee">

										<c:url var="editLink" value="edit">
											<!-- means employee/edit  -->
											<!-- passing an employee id with url  -->
											<c:param name="employeeId" value="${employee.id}"></c:param>
										</c:url>

										<c:url var="deleteLink" value="delete">
											<c:param name="employeeId" value="${employee.id}"></c:param>
										</c:url>

										<tr>
											<td><c:out value="${employee.name}"></c:out></td>
											<td><c:out value="${employee.email}"></c:out></td>
											<td><c:out value="${employee.age}"></c:out></td>
											<td><c:out value="${employee.city}"></c:out></td>
											<td><button class="btn btn-info"
													onclick="window.location.href='${editLink}'">Edit</button></td>
											<td><button class="btn btn-danger"
													onclick="window.location.href='${deleteLink}'">Delete</button></td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
							<div>
								<button class="btn btn-primary"
									onclick="window.location.href='addEmployee'">Add
									Employee</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Feliciano</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
							<li class="ftco-animate"><a href="#" onclick="return false;"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#" onclick="return false;"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#" onclick="return false;"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Open Hours</h2>
						<ul class="list-unstyled open-hours">
							<li class="d-flex"><span>Monday</span><span>9:00 -
									24:00</span></li>
							<li class="d-flex"><span>Tuesday</span><span>9:00 -
									24:00</span></li>
							<li class="d-flex"><span>Wednesday</span><span>9:00 -
									24:00</span></li>
							<li class="d-flex"><span>Thursday</span><span>9:00 -
									24:00</span></li>
							<li class="d-flex"><span>Friday</span><span>9:00 -
									02:00</span></li>
							<li class="d-flex"><span>Saturday</span><span>9:00 -
									02:00</span></li>
							<li class="d-flex"><span>Sunday</span><span> 9:00 -
									02:00</span></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Instagram</h2>
						<div class="thumb d-sm-flex">
							<a href="#" class="thumb-menu img"
								style="background-image: url(../images/insta-1.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(../images/insta-2.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(../images/insta-3.jpg);"> </a>
						</div>
						<div class="thumb d-flex">
							<a href="#" class="thumb-menu img"
								style="background-image: url(../images/insta-4.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(../images/insta-5.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(../images/insta-6.jpg);"> </a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Newsletter</h2>
						<p>Far far away, behind the word mountains, far from the
							countries.</p>
						<form action="#" class="subscribe-form">
							<div class="form-group">
								<input type="text" class="form-control mb-2 text-center"
									placeholder="Enter email address"> <input type="submit"
									value="Subscribe" class="form-control submit px-3">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/jquery.timepicker.min.js"></script>
	<script src="../js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../js/google-map.js"></script>
	<script src="../js/main.js"></script>
	<script src="../js/logout.js"></script>

	<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>

	<script>
		$(document).ready(function() {
			$("#datatable").DataTable();
		})
	</script>
	


</body>
</html>