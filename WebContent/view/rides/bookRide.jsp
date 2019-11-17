<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Ride</title>
	<jsp:include page="../../view/common/header.jsp"></jsp:include>
		<jsp:include page="../../view/common/leftSidebar.jsp"></jsp:include>
		
<div class="container-fluid">
	<h1>Book Ride</h1>
	<hr>
	<!-- Section Example-->
	<div class="card mb-3">
		<div class="card-header">
			<i class="fa fa-chart-area"></i>
		</div>
		<div class="card-body">
			<form action="confirmRide.jsp" method="POST" id="bookRideForm">
				<div class="form-group">
					<label for="sourceLocation">Source Location:</label>
					<input type="text" class="form-control" placeholder="Source" id="sourceLocation" name="sourceLocation" required>
				</div>
				
				<div class="form-group">
					<label for="destinationLocation">Destination:</label>
					<input type="text" class="form-control" placeholder="Destination" id="destinationLocation" name="destinationLocation" required>
				</div>
				
				<div class="form-group">
					<label for="rideDate">Ride Date:</label>
					<input type="text" class="form-control" placeholder="Date" id="rideDate" name="rideDate" required>
				</div>
				
				<div class="form-group">
					<label for="rideTime">Ride Time:</label>
					<input type="text" class="form-control" placeholder="Time" id="rideTime" name="rideTime" required>
				</div>

  				<button type="submit" class="btn btn-primary">Book Ride</button>
  				
			</form>
		</div>
		<div class="card-footer small text-muted"></div>
	</div>
</div>
<!-- /.container-fluid -->

<!-- Google Places Search -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdMHt-mrO06qcH0_4nIVhTLnk6-UNgC20&libraries=places&callback=initAutocomplete" async defer></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#rideDate').datetimepicker({
	    format: 'DD-MMM-YYYY',
	    minDate: new Date()
	});
	
	$('#rideTime').datetimepicker({
		format: 'LT'
	});
});

function initAutocomplete()
{
	var sourceLocation = document.getElementById('sourceLocation');
    var searchBox = new google.maps.places.SearchBox(sourceLocation);
    
    var destinationLocation = document.getElementById('destinationLocation');
    var searchBox = new google.maps.places.SearchBox(destinationLocation);
}
</script>
	
	<jsp:include page="../../view/common/footer.jsp"></jsp:include>