<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<html>
<head>
  <title>weather api</title>
</head>
<style>
  * {
    margin: 0 auto;
  }
  .card {
  	position:relative;
  	top:100px;
    margin-top: 20px;
    width: 300px;
    height: 400px;
    background-color: lightgray;
    text-align: center;
  }
  #humidity {
    line-height: 50px;
    font-size: x-large;
  }
  #ic {
    width: 70px;
    height: 70px;
  }
</style>
<body>
    <div class = "card">
      <h2>현재 날씨</h2>
      <img id = "ic" src="">
      <br>
      <span id="humidity"></span>
    </div>
    <script>
    
    
      let url = "https://api.openweathermap.org/data/2.5/weather?lat=37.8159596&lon=126.8960428&appid=4c8c905b40a18f034ae1fcbe0435b9b5&units=metric"

      fetch(url)
        .then((response) => {
          return response.json();
        })
        .then((json) => {
          console.log(json);
  
          let result = "온도 : " + Math.floor(json.main.temp) + "ºC<br>" 
                      + "습도 : " + json.main.humidity + "%<br>" 
                      + "바람 : " + json.wind.speed + "m/s<br>" 
                      + "최고온도 : " +Math.floor(json.main.temp_max) + "C<br>" 
                      + "최저온도 : " +Math.floor(json.main.temp_min)  + "ºC" 
          let icon = json.weather[0].icon; 
        document.getElementById("humidity").innerHTML = result; 
        let iconurl = document.getElementById('ic'); 
        iconurl.src = "http://openweathermap.org/img/wn/" + icon + ".png"; 
        });
    </script>
    </body>
  </html>


<jsp:include page="../sections/footer.jsp"/>