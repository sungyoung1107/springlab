<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://fonts.googleapis.com/css2?family=Bitter:wght@600&family=Nanum+Myeongjo:wght@800&display=swap"
      rel="stylesheet">
<style>
    #map03 > #map {
        width: 400px;
        height: 400px;
        border: 2px solid blue;
    }
</style>

<script>
    let map03 = {
        map:null,
        init: function(){
            this.display();
            $('#s_btn').click(function(){
                map03.go(37.5823569, 126.9770582, 's');
            });
            $('#b_btn').click(function(){
                map03.go(35.1474458, 129.0656677, 'b');
            });
            $('#j_btn').click(function(){
                map03.go(35.1548545, 129.0645698, 'j');
            });
        },
        display: function(){
            var mapContainer = document.querySelector('#map03 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(37.5553429, 127.042158), // 지도의 중심좌표
                level : 3 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();
            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition = new kakao.maps.LatLng(37.5553429, 127.042158);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
        },
        go: function(lat, lng, loc){
            // 이동할 위도 경도 위치를 생성합니다
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            // 지도 중심을 부드럽게 이동시킵니다
            // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
            map.panTo(moveLatLon);
            var markerPosition = new kakao.maps.LatLng(lat, lng);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setup(map);
            map03.makers(loc);
        },
        makers: function(loc){
            $.ajax({
                url: '/markers',
                data: {
                    'loc' : loc
                },
                success:function(data){
                    map03.displaymarkers(data);
                }
            })
        },
        displaymarkers : function(positions){
            // 마커 이미지 모양을 바꿈
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

            // 배열 안에 3개의 마커들이 있음
            for (var i = 0; i < positions.length; i ++) {
                var imageSize = new kakao.maps.Size(20, 30);
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);

                var marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    title : positions[i].title,
                    image : markerImage
                });
                // infoWindow
                var iwContent = '<h2>'+positions[i].title+'</h2>';
                iwContent += '<img src="/img/'+positions[i].img+'" style="width:50px">';

                var infowindow = new kakao.maps.InfoWindow({
                    position : markerPosition,
                    content : iwContent
                });

                kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));


                function mouseoverListener(marker, infowindow) {
                    return function(){
                        infowindow.open(map, marker);
                    };
                }
                function mouseoutListener(marker, infowindow) {
                    return function(){
                        infowindow.close();
                    };
                }
                function mouseclickListener(target) {
                    return function(){
                        location.href = target;
                    };
                }
            } // end for
        }

    }
    // 문서가 준비
    $(function(){
        map03.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container" id="map03">
        <h2>map03</h2>
        <button type="button" id = "s_btn" class="btn btn-primary">Seoul</button>
        <button type="button" id = "b_btn" class="btn btn-primary">Busan</button>
        <button type="button" id = "j_btn" class="btn btn-primary">Jeju</button>
        <div id = "map"></div>
    </div>
</div>
<%--</html>--%>