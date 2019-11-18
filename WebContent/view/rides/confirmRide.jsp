<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ride Booking Confirmation</title>
<style type="text/css">
#map {
        height: 100%;
      }
</style>
	<jsp:include page="../../view/common/header.jsp"></jsp:include>
		<jsp:include page="../../view/common/leftSidebar.jsp"></jsp:include>
		
<div class="container-fluid">
	<h1>Ride Confirmation</h1>
	<hr>
	<!-- Section Example-->
	<div class="card mb-3">
		<div class="card-header">
			<i class="fa fa-chart-area"></i>Ride Datails:
		</div>
		<div class="card-body">
			<!-- <canvas id="myAreaChart" width="100%" height="30"></canvas> -->
			<div class="row">
				<div class="col-sm-4">
					<form action="rideDetailsAction.jsp" method="POST">
						<div class="form-group">
							<label for="sourceLocation">Start Location:</label>
							<div name="sourceLocation" id="sourceLocation" value="<%= request.getParameter("sourceLocation") %>"><%= request.getParameter("sourceLocation") %></div>
							<input type="hidden" name="hiddenSourceLocation" id="hiddenSourceLocation" class="form-control" value="<%= request.getParameter("sourceLocation") %>">
						</div>
						
						<div class="form-group">
							<label for="destinationLocation">End Location:</label>
							<div name="destinationLocation" id="destinationLocation" value="<%= request.getParameter("destinationLocation") %>"><%= request.getParameter("destinationLocation") %></div>
							<input type="hidden" name="hiddenDestinationLocation" id="hiddenDestinationLocation" class="form-control" value="<%= request.getParameter("destinationLocation") %>">
						</div>
						
						<div class="form-group">
							<label for="sourceLocation">Ride Date and Time:</label>
							<div name="sourceLocation" id="sourceLocation" value="<%= request.getParameter("rideDate") + " " + request.getParameter("rideTime") %>"><%= request.getParameter("rideDate") + " " + request.getParameter("rideTime") %></div>
							<input type="hidden" name="hiddenRideDate" id="hiddenRideDate" class="form-control" value="<%= request.getParameter("rideDate") %>">
							<input type="hidden" name="hiddenRideTime" id="hiddenRideTime" class="form-control" value="<%= request.getParameter("rideTime") %>">
						</div>
						
						<div class="form-group">
							<label for="rideCost">Ride Cost:</label>
							<div name="rideCost" id="rideCost" value="">$ 22.45</div>
							<input type="hidden" name="hiddenRideCost" id="hiddenRideCost" value="22.45" class="form-control" >
						</div>
						
						<div class="form-group">
							<label for="rideDistance">Ride Distance:</label>
							<div name="rideDistance" id="rideDistance" value=""><%= request.getParameter("rideDistanceInMiles") %></div>
							<input type="hidden" name="hiddenRideDistance" id="hiddenRideDistance" value="<%= request.getParameter("rideDistanceInMiles") %>" class="form-control">
						</div>
						
						<div class="form-group">
							<label for="expecetdRideDuration">Expected Ride Time:</label>
							<div name="expecetdRideDuration" id="expecetdRideDuration" value=""><%= request.getParameter("rideExpectedDuration") %></div>
							<input type="hidden" name="hiddenExpecetdRideDuration" id="hiddenExpecetdRideDuration" value="<%= request.getParameter("rideExpectedDuration") %>" class="form-control">
						</div>
						
						<div class="form-group">
							<label for="cardNumber">Credit / Debit Card:</label>
							<input type="input" name="cardNumber" id="cardNumber" placeholder="Card Number" class="form-control" required>
						</div>
						
						<div class="form-group">
							<input type="submit" style="width: 100%" class="btn btn-success" name="confirmPaymentBtn" id="confirmPaymentBtn" value="Confirm Payment" class="form-control">
						</div>
					</form>
				</div>
				<div class="col-sm-8" style="height: 500px;">
					<div id="map"></div>
					<!-- <div id="panel" style="width: 300px; float: right;"></div> -->
	<script>
      function initMap() {
        var directionsService = new google.maps.DirectionsService();
        var directionsRenderer = new google.maps.DirectionsRenderer();
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 41.85, lng: -87.65}
        });
        directionsRenderer.setMap(map);
        /*
        <div id="panel" style="width: 300px; float: right;"></div>
        directionsRenderer.setPanel(document.getElementById('panel'));
        */

        //var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsRenderer);
        //};
        //document.getElementById('hiddenSourceLocation').addEventListener('change', onChangeHandler);
        //document.getElementById('hiddenDestinationLocation').addEventListener('change', onChangeHandler);
      }

      function calculateAndDisplayRoute(directionsService, directionsRenderer) {
        directionsService.route(
            {
              origin: {query: document.getElementById('hiddenSourceLocation').value},
              destination: {query: document.getElementById('hiddenDestinationLocation').value},
              //origin: {query: "10 West 31st Street, Chicago, IL, USA"},
              //destination: {query: "Patel Brothers, West Devon Avenue, Chicago, IL, USA"},
              travelMode: 'DRIVING'
            },
            function(response, status) {
              if (status === 'OK') {
                directionsRenderer.setDirections(response);
              } else {
                window.alert('Directions request failed due to ' + status);
              }
            });
      }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdMHt-mrO06qcH0_4nIVhTLnk6-UNgC20&callback=initMap">
    </script>
				</div>
			</div>
		</div>
		<div class="card-footer small text-muted">Section Footer</div>
	</div>
</div>
<!-- /.container-fluid -->
	
	<jsp:include page="../../view/common/footer.jsp"></jsp:include>