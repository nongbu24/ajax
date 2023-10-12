<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCType html>
<html>
<head>
<meta charset="UTF-8">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h2>인천 국제 항공사 주차 정보</h2>
	<hr>
	<button id="btn1">정보 출력</button>
	<br><br>
	<table id="result1" border="1">
		<thead>
			<tr>
				<th>주차 현황 시간</th>
				<th>주차장 구분</th>
				<th>주차 구역 주차 수</th>
				<th>주차 구역 총 주차면 수</th>
			</tr>
		</thead>
		<tbody>
			<!-- 여기다 api 가져와서 데이터 채워넣음 -->
		</tbody>
	</table>
	<script>
		$(function() {
			$("#btn1").click(function() {
				$.ajax({
					url:"parking.do",
					data:{},
					success:function(data) {
						const itemArr = data.response.body.items;
						
						let value = "";
						let items = {};
						
						for (let i in itemArr) {
							let item = itemArr[i];
							
							value += "<tr>"
									+ "<td>" + item.datetm + "</td>"
									+ "<td>" + item.floor + "</td>"
									+ "<td>" + item.parking + "</td>"
									+ "<td>" + item.parkingarea + "</td>"
									+ "</tr>";
						}
						
						$("#result1 tbody").html(value); //옆에 있는 값에 이 내용을 추가해줌
					}
				})
			})
		})
	</script>
</body>
</html>