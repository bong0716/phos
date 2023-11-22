<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- KAKAO MAP api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4916dd876c4c4f87065c0b41fbf14a65"></script>
</head>

<footer
        class="text-center text-lg-start text-white"
        style="background-color: rgb(61,61,61);"
        >
  <div class="container p-4 pb-0">
    <section class="">
      <div class="row">
        <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
          <h6 class="text-uppercase mb-4 font-weight-bold">
            포스축구아카데미
          </h6>
          <p>
            Here you can use rows and columns to organize your footer
            content. Lorem ipsum dolor sit amet, consectetur adipisicing
            elit.
          </p>
        </div>

        <hr class="w-100 clearfix d-md-none" />
	
		<!-- kakao map -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3" id="map" style="width:330px;height:240px;"></div>
		<script>
			var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.492643103930575, 126.90325850421407), 
		        level: 2 // 지도의 확대 레벨
		    };
		    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			
			var markerPosition  = new kakao.maps.LatLng(37.492643103930575, 126.90325850421407); 
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			})
			marker.setMap(map);
		</script>

        <hr class="w-100 clearfix d-md-none" />

        <hr class="w-100 clearfix d-md-none" />

        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
          <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
          <p><i class="fas fa-home mr-3"></i> 서울특별시 영등포구 디지털로 401 신라빌딩 지하 1층</p>
          <p><i class="fas fa-envelope mr-3"></i> info@gmail.com</p>
          <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
          <p><i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
        </div>

        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
          <h6 class="text-uppercase mb-4 font-weight-bold">Follow us</h6>

          <!-- youtube -->
          <a
             class="btn btn-primary btn-floating m-1"
             style="background-color: #dd4b39"
             href="#!"
             role="button"
             ><i class="fab fa-brands fa-youtube"></i>
             </a>

          <!-- blog -->
          <a
             class="btn btn-primary btn-floating m-1"
             style="background-color: rgb(27,217,0)"
             href="https://blog.naver.com/ssjm96"
             role="button"
             ><i class="bi bi-chat-square-text"></i>
             </a>

          <!-- Instagram -->
          <a
             class="btn btn-primary btn-floating m-1"
             style="background-color: #ac2bac"
             href="#!"
             role="button"
             ><i class="fab fa-instagram"></i
            ></a>

        </div>
      </div>
    </section>
  </div>
  <div
       class="text-center p-3"
       style="background-color: rgba(0, 0, 0, 0.2)"
       >
    © 2020 Copyright:
    <a class="text-white" href="https://mdbootstrap.com/"
       >MDBootstrap.com</a
      >
  </div>
  
</footer>


</html>