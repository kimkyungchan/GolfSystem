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
	<!-- 부트스트랩 모달 css 이용 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<style type="text/css">
		#FacilityBarChart{display: block; height: 198px; width: 396px;}
		#searchall{position:relative; left:30px; font-weight:bold;}
		
		#headtitle{position:relative; left:700px; font-size:70px; font-weight:bold;}
		#searchresult{position:relative; left:10px;}
		#excel{position:relative; left:900px;}
	</style>
<title>점검 통계 / 현황</title>
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
 			<p id="headtitle">점검 통계</p><hr>
 			</div>
 			<form method="get" action="/admin/downloadexcel" id="dateform">
    		  <div id="searchall">
 				기간 지정 : <input type="date" id="startdate" name="startdate"> ~ <input type="date" id="enddate" name="enddate">
 					/ 카테고리 선택: <select id="category" name="category">
	            					<option value="1">골프코스</option>
	            					<option value="2">카트</option>
	            					<option value="3">화장실</option>
	            					<option value="4">음식점</option>
            					 </select>	 
            	 <button type="button" class="btn btn-primary" id="searchresult">검색</button>
            	 <button type="button" class="btn btn-primary" id="excel">점검표 다운로드</button>
              </div><hr>			
 			</form>	
 			
 			    <div id="canvasdiv">
 					<canvas id="FacilityBarChart" width="370" height="150" class="chartjs-render-monitor">
 					</canvas>
 			    </div>
 				<div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                  점검현황
                            </div>
                            
                            <div class="card-body">
                               <table id="datatablesSimple">
                               		<thead>
                               		 	<tr>
                                        	<th>번호</th>
                                            <th>카테고리</th>
                                            <th>점검일자</th>
                                            <th>점검항목</th>
                                            <th>점검수</th>
                                            <th>점검율</th>
                                        </tr>
                               		</thead>
                               		<tbody id="resultbody">
                               		</tbody>
                               </table>
                            
                            </div>   
                        </div>
 		
		
 			</div>

		 </div> <!-- layout sidenav -->


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
    <!-- 부트스트랩 모달 js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<!-- JQUERY 사용 -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script>
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		var ctx = document.getElementById("FacilityBarChart");
		var myLineChart = new Chart(ctx, {
		  type: 'bar', // 그래프타입
		  data: {
	    	labels: ['골프코스','카트','화장실','음식점'],
		    datasets: [{
		      label: "점검율:", //막대그래프의 가로축 이름들
		      backgroundColor: "rgba(2,117,216,1)",
		      borderColor: "rgba(2,117,216,1)",
		      data: [80,60,40,100], // 막대그래프에 표시될 값들
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
		          maxTicksLimit: 4
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 100,
		          maxTicksLimit: 8
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
			
			$("#excel").click(function(){
				
				var start = $("#startdate").val();
				var end = $("#enddate").val();
				var category = $("#category").val();
				
				if(!start || !end){
					alert("기간을 정해주세요");
				}else{
					$("#dateform").submit();
				}
				
			})
			
			$("#searchresult").click(function(){	
				
				var datalabel=[]; // 막대그래프 label에 담을 배열
				var datalist=[]; // 막대그래프 data 담을 배열
				var i=0;
				
				var start = $("#startdate").val();
				var end = $("#enddate").val();
				var category = $("#category").val();
			
					$.ajax({
						url:'/admin/facilityResult',
						data:'start='+start+'&end='+end+'&category='+category,
						dataType:'json',
						method:'post'
					}).done(function(data){
						for(var key in data){
							datalabel.push(data[key].quedate);
						}
					}); // first ajax done end
		
					
					$.ajax({
						url:'/admin/nullResult',
						data:'start='+start+'&end='+end+'&category='+category,
						dataType:'json',
						method:'get'
					}).done(function(data2){
					
						var num=1; //날짜 비교시 일치 값이 있다면 증가해서 if문에 사용
						var nullresult=0; //null값이 있는 data변경 위해 선언
						
						for(var i=0; i<datalabel.length; i++){
							
							for(var key in data2){
								if(data2[key].quedate == datalabel[i]){ 
									nullresult = 100 - 20 * Number(data2[key].ck);
									index=i;
									num++;
									//data2의 날짜와, datalabel에 저장된 날짜를 비교, 있다면 해당 null값의 갯수로 data변경 후 num 1증가
								}
							}
							// 데이터의 변경이 있다면 변경된 data로 list에 저장, 아니라면 100을 저장
							if(num>1){
								datalist.push(nullresult);
								num=1;
							}else{
								datalist.push(100);
							}
							
						}
						$("#FacilityBarChart").remove();
						$("#canvasdiv").append("<canvas id=FacilityBarChart width=370 height=170 class=chartjs-render-monitor></canvas>")	
						// Bar Chart Example
						var ctx = document.getElementById("FacilityBarChart");
						var myLineChart = new Chart(ctx, {
						  type: 'bar', // 그래프타입
						  data: {
					    	labels: datalabel,
						    datasets: [{
						      label: "점검율:", //막대그래프의 가로축 이름들
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
						          min: 0,
						          max: 100,
						          maxTicksLimit: 8
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
						
						var content =""; 
						var categoryname="";
						var resultcheck=[]; 
						
						//현황에 추가 할 카테고리 이름 지정
						if(category == 1){
							categoryname="골프코스"
						}else if(category == 2){
							categoryname="카트"
						}else if(category == 3){
							categoryname="화장실"
						}else if(category == 4){
							categoryname="음식점"
						}
						
						//현황에 추가 할 점검수 배열에 저장
						for(var z=0; z<datalabel.length; z++){
							if(datalist[z]==100){
								resultcheck[z]=5;	
							}else if(datalist[z]==80){
								resultcheck[z]=4;
							}else if(datalist[z]==60){
								resultcheck[z]=3;
							}else if(datalist[z]==40){
								resultcheck[z]=2;
							}else if(datalist[z]==20){
								resultcheck[z]=1;
							}else{
								resultcheck[z]=0;
							}
						}
						
						for(var b=0; b<datalabel.length; b++){
							content+="<tr><td>"+(b+1)+"</td><td>"+categoryname+"</td><td>"+datalabel[b]+"</td><td>"+5+"</td><td>"+resultcheck[b]+"</td><td>"+datalist[b]+"</td></tr>";
						}
						
						$("#datatablesSimple > #resultbody").html(content);
						
					})//second ajax end
					
			}) // searchresult end
		
			
		})//ready
	</script>
	
</body>
</html>