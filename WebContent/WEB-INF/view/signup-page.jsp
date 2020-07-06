<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>	
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
	
	<title>Signup Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		 
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" /> 
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

	<div>
		
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">
			
			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">SignUp</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form modelAttribute="user" action="validateSignup" class="form-horizontal ui form error" method="POST">

					    <!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">
					        <div class="col-xs-15">
					            <div>									
									<c:if test="${param.duplicate != null}">
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Username already exist
										</div>									
									</c:if>										            
<%-- 								<c:if test="${param.logout != null}">
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.
										</div>									
									</c:if>																				  
 --%>					            </div>
					        </div>
					    </div>
	
						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							
							<form:input path="username" type="text" name="username" placeholder="username" class="form-control" />
						</div>
						<form:errors path="username" class="ui error message" />

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
							
							<form:input path="password" type="password" name="password" placeholder="password" class="form-control" />
						</div>
						<form:errors path="password" class="ui error message" />

						<!-- Login/Submit Button -->
						<div style="margin-top: 10px" class="form-group">						
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success">signup</button>
							</div>
						</div>
						 
					</form:form>
			
					<div><a href="${pageContext.request.contextPath}/loginPage">Back to login</a></div>
		
				</div>

			</div>

		</div>

	</div>

</body>
</html>