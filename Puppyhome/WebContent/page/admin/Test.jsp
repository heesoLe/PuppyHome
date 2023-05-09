<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Multiple Bar Charts</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<h1>Multiple Bar Charts</h1>

	<!-- 막대 그래프를 그릴 캔버스 -->
	<canvas id="chart1"></canvas>
	<canvas id="chart2"></canvas>
	<canvas id="chart3"></canvas>

	<script>
		// 데이터
		var data1 = {
			labels: ["Product 1", "Product 2", "Product 3"],
			datasets: [{
				label: "Sales",
				data: [100, 200, 150],
				backgroundColor: ["red", "green", "blue"]
			}]
		};

		var data2 = {
			labels: ["Product 1", "Product 2", "Product 3"],
			datasets: [{
				label: "Sales",
				data: [300, 150, 200],
				backgroundColor: ["red", "green", "blue"]
			}]
		};

		var data3 = {
			labels: ["Product 1", "Product 2", "Product 3"],
			datasets: [{
				label: "Sales",
				data: [200, 250, 100],
				backgroundColor: ["red", "green", "blue"]
			}]
		};

		// 막대 그래프 생성 함수
		function createBarChart(canvasId, data) {
			var ctx = document.getElementById(canvasId).getContext("2d");
			var chart = new Chart(ctx, {
				type: "bar",
				data: data,
				options: {
					responsive: false,
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
					}
				}
			});
		}

		// 막대 그래프 생성
		createBarChart("chart1", data1);
		createBarChart("chart2", data2);
		createBarChart("chart3", data3);
	</script>
</body>
</html>
