<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sona Hotel</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">	

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
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
							<span class="text">+91 8999174725</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">safvanbardolia@gmail.com</span>
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
			<a class="navbar-brand" href="#">Feliciano</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="#" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#about" class="nav-link">About</a></li>
					<security:authorize access="hasRole('ADMIN')">
						<li class="nav-item"><a	href="${pageContext.request.contextPath}/employee/list"	class="nav-link">Admin</a></li>
						<li class="nav-item"><a	href="${pageContext.request.contextPath}/booking/list"	class="nav-link">Booking</a></li>
					</security:authorize>
					<security:authorize access="hasRole('USER')">
						<li class="nav-item"><a	href="${pageContext.request.contextPath}/online/onlineOrdering" class="nav-link">Order Online</a></li>
						<li class="nav-item cart">
							<a class="nav-link" href="${pageContext.request.contextPath}/online/cart">
								<span class="glyphicon glyphicon-shopping-cart"></span> cart <span id="cart-count">0</span>
							</a>
						</li>															
						<li class="nav-item cta"><a	href="${pageContext.request.contextPath}/booking/tableBooking" class="nav-link">Book a table</a></li>
					</security:authorize>
				</ul>
				
				<form:form action="${pageContext.request.contextPath}/logout" method="POST">
						<input type="submit" value="logout" class="btn btn-danger" id="logout" style="position: absolute;right: 10px;bottom: 16px;font-size: medium;">
				</form:form>
				
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="home-slider owl-carousel js-fullheight">
		<div class="slider-item js-fullheight"
			style="background-image: url(images/bg_1.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text js-fullheight justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-12 col-sm-12 text-center ftco-animate">
						<span class="subheading">Feliciano</span>
						<h1 class="mb-4">Best Restaurant</h1>
					</div>

				</div>
			</div>
		</div>

		<div class="slider-item js-fullheight"
			style="background-image: url(images/bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text js-fullheight justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-12 col-sm-12 text-center ftco-animate">
						<span class="subheading">Feliciano</span>
						<h1 class="mb-4">Nutritious &amp; Tasty</h1>
					</div>

				</div>
			</div>
		</div>

		<div class="slider-item js-fullheight"
			style="background-image: url(images/bg_3.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-12 col-sm-12 text-center ftco-animate">
						<span class="subheading">Feliciano</span>
						<h1 class="mb-4">Delicious Specialties</h1>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="featured">
						<div class="row">
							<div class="col-md-3">
								<div class="featured-menus ftco-animate">
									<div class="menu-img img"
										style="background-image: url(images/breakfast-1.jpg);"></div>
									<div class="text text-center">
										<h3>Grilled Beef with potatoes</h3>
										<p>
											<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>,
											<span>Tomatoe</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="featured-menus ftco-animate">
									<div class="menu-img img"
										style="background-image: url(images/breakfast-2.jpg);"></div>
									<div class="text text-center">
										<h3>Grilled Beef with potatoes</h3>
										<p>
											<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>,
											<span>Tomatoe</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="featured-menus ftco-animate">
									<div class="menu-img img"
										style="background-image: url(images/breakfast-3.jpg);"></div>
									<div class="text text-center">
										<h3>Grilled Beef with potatoes</h3>
										<p>
											<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>,
											<span>Tomatoe</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="featured-menus ftco-animate">
									<div class="menu-img img"
										style="background-image: url(images/breakfast-4.jpg);"></div>
									<div class="text text-center">
										<h3>Grilled Beef with potatoes</h3>
										<p>
											<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>,
											<span>Tomatoe</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section ftco-wrap-about" id="about">
		<div class="container">
			<div class="row">
				<div class="col-md-7 d-flex">
					<div class="img img-1 mr-md-2"
						style="background-image: url(images/about.jpg);"></div>
					<div class="img img-2 ml-md-2"
						style="background-image: url(images/about-1.jpg);"></div>
				</div>
				<div class="col-md-5 wrap-about pt-5 pt-md-5 pb-md-3 ftco-animate">
					<div class="heading-section mb-4 my-5 my-md-0">
						<span class="subheading">About</span>
						<h2 class="mb-4">Feliciano Restaurant</h2>
					</div>
					<p>A small river named Duden flows by their place and supplies
						it with the necessary regelialia. It is a paradisematic country,
						in which roasted parts of sentences fly into your mouth.</p>
					<pc class="time"> <span>Mon - Fri <strong>8 AM
							- 11 PM</strong></span> <span><a href="#" onclick="return false;">+ 1-978-123-4567</a></span>
					</p>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section ftco-counter img ftco-no-pt"
		id="section-counter">
		<div class="container">
			<div class="row d-md-flex">
				<div class="col-md-9">
					<div class="row d-md-flex align-items-center">
						<div
							class="col-md-6 col-lg-3 mb-4 mb-lg-0 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text">
									<strong class="number" data-number="18">0</strong> <span>Years
										of Experienced</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-6 col-lg-3 mb-4 mb-lg-0 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text">
									<strong class="number" data-number="100">0</strong> <span>Menus/Dish</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-6 col-lg-3 mb-4 mb-lg-0 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text">
									<strong class="number" data-number="50">0</strong> <span>Staffs</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-6 col-lg-3 mb-4 mb-lg-0 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text">
									<strong class="number" data-number="15000">0</strong> <span>Happy
										Customers</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 text-center text-md-left">
					<p>A small river named Duden flows by their place and supplies
						it with the necessary regelialia.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-12 text-center heading-section ftco-animate">
					<span class="subheading">Services</span>
					<h2 class="mb-4">Catering Services</h2>
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
					<div class="media block-6 services d-block">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-cake"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Birthday Party</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
					<div class="media block-6 services d-block">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-meeting"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Business Meetings</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>
				<div
					class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
					<div class="media block-6 services d-block">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-tray"></span>
						</div>
						<div class="media-body p-2 mt-3">
							<h3 class="heading">Wedding Party</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-12 text-center heading-section ftco-animate">
					<span class="subheading">Chef</span>
					<h2 class="mb-4">Our Master Chef</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff">
						<div class="img" style="background-image: url(images/chef-4.jpg);"></div>
						<div class="text pt-4">
							<h3>John Smooth</h3>
							<span class="position mb-2">Restaurant Owner</span>
							<div class="faded">
								<ul class="ftco-social d-flex">
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-google-plus"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff">
						<div class="img" style="background-image: url(images/chef-2.jpg);"></div>
						<div class="text pt-4">
							<h3>Rebeca Welson</h3>
							<span class="position mb-2">Head Chef</span>
							<div class="faded">
								<ul class="ftco-social d-flex">
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-google-plus"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff">
						<div class="img" style="background-image: url(images/chef-3.jpg);"></div>
						<div class="text pt-4">
							<h3>Kharl Branyt</h3>
							<span class="position mb-2">Chef</span>
							<div class="faded">
								<ul class="ftco-social d-flex">
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-google-plus"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff">
						<div class="img" style="background-image: url(images/chef-1.jpg);"></div>
						<div class="text pt-4">
							<h3>Luke Simon</h3>
							<span class="position mb-2">Chef</span>
							<div class="faded">
								<ul class="ftco-social d-flex">
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-google-plus"></span></a></li>
									<li class="ftco-animate"><a href="#" onclick="return false;"><span
											class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section testimony-section img">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-12 text-center heading-section ftco-animate">
					<span class="subheading">Testimony</span>
					<h2 class="mb-4">Happy Customer</h2>
				</div>
			</div>
			<div class="row ftco-animate justify-content-center">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap text-center pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text p-3">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Jason McClean</p>
									<span class="position">Customer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_2.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text p-3">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Mark Stevenson</p>
									<span class="position">Customer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_3.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text p-3">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Art Leonard</p>
									<span class="position">Customer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_4.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text p-3">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Rose Henderson</p>
									<span class="position">Customer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap text-center pb-5">
								<div class="user-img mb-4"
									style="background-image: url(images/person_3.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text p-3">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<p class="name">Ian Boner</p>
									<span class="position">Customer</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<span class="subheading">Blog</span>
					<h2 class="mb-4">Recent Posts</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('images/image_1.jpg');"> </a>
						<div class="text pt-3 pb-4 px-4">
							<div class="meta">
								<div>
									<a href="#">Sept. 06, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
							</div>
							<h3 class="heading">
								<a href="#">Taste the delicious foods in Asia</a>
							</h3>
							<p class="clearfix">
								<a href="#" class="float-left read">Read more</a> <a href="#"
									class="float-right meta-chat"><span class="icon-chat"></span>
									3</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('images/image_2.jpg');"> </a>
						<div class="text pt-3 pb-4 px-4">
							<div class="meta">
								<div>
									<a href="#">Sept. 06, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
							</div>
							<h3 class="heading">
								<a href="#">Taste the delicious foods in Asia</a>
							</h3>
							<p class="clearfix">
								<a href="#" class="float-left read">Read more</a> <a href="#"
									class="float-right meta-chat"><span class="icon-chat"></span>
									3</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="blog-entry">
						<a href="blog-single.html" class="block-20"
							style="background-image: url('images/image_3.jpg');"> </a>
						<div class="text pt-3 pb-4 px-4">
							<div class="meta">
								<div>
									<a href="#">Sept. 06, 2019</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
							</div>
							<h3 class="heading">
								<a href="#">Taste the delicious foods in Asia</a>
							</h3>
							<p class="clearfix">
								<a href="#" class="float-left read">Read more</a> <a href="#"
									class="float-right meta-chat"><span class="icon-chat"></span>
									3</a>
							</p>
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
								style="background-image: url(images/insta-1.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(images/insta-2.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(images/insta-3.jpg);"> </a>
						</div>
						<div class="thumb d-flex">
							<a href="#" class="thumb-menu img"
								style="background-image: url(images/insta-4.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(images/insta-5.jpg);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(images/insta-6.jpg);"> </a>
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


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script src="js/cart-count.js"></script>
	<script src="js/logout.js"></script>
	
</body>
</html>