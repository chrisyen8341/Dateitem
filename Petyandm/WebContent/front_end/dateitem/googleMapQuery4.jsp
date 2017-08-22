<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dateitem.model.*"%>
<%@ page import="com.restaurant.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>

<%@ include file="header.file"%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAUbYcDBdfK_UjTWa9G6FSe3EfERMpEZQ">
	
</script>
<!--     <script src="https://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/front_end/js/d3.min.js"></script>



<head>
<title>���|����</title>
<style type="text/css">
#map_canvas {
	width: 100%;
	height: 600px;
}
</style>
</head>
<body bgcolor='white'>



	<%@ include file="/front_end/frontEndNavBar.file"%>
	<%@ include file="sidelist.file"%>

	<%-- <%@ include file="page3.file"%>	 --%>

	<!-- JSP�H�@�ӥ]�t��u��div�}�l, ���O������</div>�g�bfooter�̭� -->

	<div class="col-xd-12 col-sm-10  main-page-show">
		<div class="col-sm-10 col-sm-offset-1">
			<span>
				<Form
					action="<%=request.getContextPath()%>/front_end/dateitem/dateitem.do"
					method="post">
					<input type="hidden" name="action" value="googleMapQuery">
					<input type="date" id="datepicker" name="dateMeetingTime">
					<!-- 					  <select class="w3-select selectpicker" name="memGender"> -->
					<!-- 					    <option value="" disabled selected>�п�ܥD�H�ʧO</option> -->
					<!-- 					    <option value="">�ҥi</option> -->
					<!-- 					    <option value="0">�k</option> -->
					<!-- 					    <option value="1">�k</option> -->
					<!-- 					    <option value="2">���@�z�S</option> -->
					<!-- 					  </select> -->

					<!-- 					  <select class="w3-select selectpicker" name="petKind"> -->
					<!-- 					    <option value="" disabled selected>�п���d��</option> -->
					<!-- 					    <option value="">�ҥi</option> -->
					<!-- 					    <option value="��">��</option> -->
					<!-- 					    <option value="��">��</option> -->
					<!-- 					    <option value="��L">��L</option> -->
					<!-- 					  </select> -->

					<input type="submit">
					<!--   <button class="btn btn-lg btn-warning glyphicon glyphicon-search"> </button> -->


				</Form>

			</span>





			<div id="map_canvas"></div>





		</div>



		<footer>
			<div class="row navbar-fixed-bottom">
				<div class="col-sm-12">
					<div class="col-sm-3">
						<p>Copyright �d��You&amp;Me 2017</p>
					</div>
					<div class="col-sm-3">
						<p>����ڭ�</p>
					</div>
				</div>
			</div>
		</footer>
	</div>
	</div>
	<a href="#">
		<div class="" id="fixedbutton-talk">
			<button class="button btn-lg btn-primary active">�����ѫ�</button>
		</div>
	</a>
	</div>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>






	<script>
		function initializeMaps() {
			console.log(typeof window.XMLSerializer == null);

			var options = {
				zoom : 10,
				center : {
					lat : 25.042419,
					lng : 121.541808
				}
			}

			var map = new google.maps.Map(
					document.getElementById('map_canvas'), options);

			// var bounds = new google.maps.LatLngBounds();

			var markers = new Array();

			marker1 = new Object();
			marker1.coords={lat:25.040302,lng:121.552108};
			marker1.content = "<H1>test500</H1>"
			marker1.count = 500;
			marker1.icon = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=500|FF0000|000000"
			markers.push(marker1);

			marker2 = new Object();
			marker2.coords={lat:25.031097,lng:121.551705};
			marker2.content = "<H1>test123</H1>"
			marker2.count = 2000;
			marker2.icon = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=2000|FF0000|000000"
			markers.push(marker2);


			for (var i = 0; i < markers.length; i++) {
				addMarker(markers[i]);
			}

			// Add Marker Function
			function addMarker(props) {
				var marker = new google.maps.Marker({
					position : props.coords,
					map : map,
					icon: props.icon,
					animation: google.maps.Animation.DROP
				//icon:props.iconImage
				});

				// Check for customicon
				if (props.iconImage) {
					// Set icon image
					marker.setIcon(props.iconImage);
				}

				// Check content
				if (props.content) {
					var infoWindow = new google.maps.InfoWindow({
						content : props.content
					});

					marker.addListener('click', function() {
						infoWindow.open(map, marker);
					});
				}
			}

		}

		initializeMaps();
	</script>





</body>

</html>

