<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<style type="text/css">
		#SalesBarChart{display: block; height: 198px; width: 396px;}
		#searchall{position:relative; left:60px; font-weight:bold;}
		
		#headtitle{position:relative; left:700px; font-size:70px; font-weight:bold;}
		#searchresult{position:relative; left:10px;}
		#salessum{position:relative; left:1400px; border:1px solid red; font-size:20px; font-weight:bold; width:400px; height:50px;}
	</style>
<title>매출 관리</title>
</head>
<body class="sb-nav-fixed">
		
		<!-- TOP FRAME -->
		<jsp:include page="../AdminFrame/top.jsp"/> 

 		 <!-- 전체적인 틀 div -->
		 <div id="layoutSidenav">
			<!-- Sidenav FRAME -->    
			<jsp:include page="../AdminFrame/sidemenu.jsp"/> 
			
			<!-- 본문 내용의 div -->
 			<div id="layoutSidenav_content">
 			
 			<div>
 			<p id="headtitle">매출 현황</p>
 			</div><hr>
 			<form method="get" action="/admin/downloadexcel" id="dateform">
    		  <div id="searchall">
 				기간 지정 : <input type="date" id="startdate" name="startdate"> ~ <input type="date" id="enddate" name="enddate">
            	 <button type="button" class="btn btn-primary" id="searchresult">검색</button>
              </div>			
 			</form><hr>	
 				<div id="canvasdiv">
 				<canvas id="SalesBarChart" width="396" height="180" class="chartjs-render-monitor">
 				</canvas>
				</div><hr>
			<p id="salessum">총 매출액 : </p>
 			</div>

		 </div> <!-- layout sidenav -->


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
	<!-- JQUERY 사용 -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script>
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';
	
	var ctx = document.getElementById("SalesBarChart");
	var myLineChart = new Chart(ctx, {
	  type: 'bar', // 그래프타입
	  data: {
    	labels: ['1월','2월','3월','4월','5월'],
	    datasets: [{
	      label: "매출량:", //막대그래프의 가로축 이름들
	      backgroundColor: "rgba(2,117,216,1)",
	      borderColor: "rgba(2,117,216,1)",
	      data: [220000,240000,260000,400000,600000], // 막대그래프에 표시될 값들
	    }],
	  },
	  options: {
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false
	        },
	        ticks: {
	          maxTicksLimit: 5
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 180000,
	          max: 800000,
	          maxTicksLimit: 9
	        },
	        gridLines: {
	          display: true
	        }
	      }],
	    },
	    legend: {
	      display: false
	    }
	  }
	});
	
	
		$(function(){
			
			function convertDateFormat(date) {
			    var year = date.getFullYear();
			    var month = date.getMonth() + 1;
			    month = month >= 10 ? month : '0' + month;
			    var day = date.getDate();
			    day = day >= 10 ? day : '0' + day;
			    return [year, month, day].join('-');
			}
					
			$("#searchresult").click(function(){	
				
				var datalabel=[]; // 막대그래프 label에 담을 배열
				var datalist=[]; // 막대그래프 data 담을 배열
				var i=0;
				var sum=0;
				
				var start = $("#startdate").val();
				var end = $("#enddate").val();
				
				$.ajax({
					url:'/admin/SalesManage',
					data:'start='+start+'&end='+end,
					dataType:'json',
					method:'post'
				}).done(function(data){
					for(var key in data){
						datalabel.push(convertDateFormat(new Date(data[key].paydate)));
						datalist.push(data[key].price);
						sum+=data[key].price;
					}
					var index=[];
					var num = datalabel.length;
					
					for(i=0; i<datalabel.length; i++){
						if(datalabel[i] == datalabel[i-1]){
							index.push(i);
							datalabel.splice(i-1,1); //splice(시작인덱스,삭제할갯수)
						}
					}
					for(var j=0; j<num; j++){
						for(var k=0; k<num; k++){
							if(j == index[k]){
								var result = datalist[j-1] + datalist[j];
								datalist.splice(j-1,1); 
								datalist[j-1] = result;
								result=0;
							}
						}
					}
					$("#SalesBarChart").remove();
					$("#canvasdiv").append("<canvas id=SalesBarChart width=396 height=180 class=chartjs-render-monitor></canvas>")
					
					var ctx = document.getElementById("SalesBarChart");
					var myLineChart = new Chart(ctx, {
					  type: 'bar', // 그래프타입
					  data: {
				    	labels: datalabel,
					    datasets: [{
					      label: "매출량:", //막대그래프의 가로축 이름들
					      backgroundColor: "rgba(2,117,216,1)",
					      borderColor: "rgba(2,117,216,1)",
					      data: datalist, // 막대그래프에 표시될 값들
					    }],
					  },
					  options: {
					    scales: {
					      xAxes: [{
					        time: {
					          unit: 'month'
					        },
					        gridLines: {
					          display: false
					        },
					        ticks: {
					          maxTicksLimit: datalabel.length
					        }
					      }],
					      yAxes: [{
					        ticks: {
					          min: 180000,
					          max: 800000,
					          maxTicksLimit: 9
					        },
					        gridLines: {
					          display: true
					        }
					      }],
					    },
					    legend: {
					      display: false
					    }
					  }
					}); //myLineChart끝
					
					$("#salessum").text("총 매출액 : "+sum+"원");
				}); // ajax끝
				
			});
		})//ready
	</script>
</body>
</html>