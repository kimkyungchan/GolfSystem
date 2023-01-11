<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../sections/header.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const calendarEl = document.getElementById('calendar');
        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            themeSystem: 'bootstrap5',
            selectable: true,
            validRange: {
                start: moment().add(1, 'days').format('YYYY-MM-DD'),
            },
            dateClick: (info) => {
                const date = info.date;
                const test = moment(date).format('yyyy-MM-DD');
                
		     $.ajax({url:"/selres", 
		    	     data: "seldate="+test,
		    	     method: "get",
		    	     dataType: "json"
		     }).done(function(res){
		    	 const rawData=[];
		         
		         for(var key in res){
		            var param = {course:res[key].selcourse, time:res[key].seltime, price:res[key].selprice};
		            rawData.push(param);
		         }; 
		         const data = rawData.map((x, i) => ({
		             ...x,
		             num: i + 1,
		             date: moment(date).format('YYYY-MM-DD'),
		             priceText: x.price.toLocaleString(),
		         }));

		         const template = $.trim($('#template-row').html())
		         const container = $('#tbody')
		
		         container.empty();
		
		         function renderTemplate(row) {
		             var x = template;
		             for (var i in row) {
		                 var pattern = new RegExp('\\{\\{' + i + '\\}\\}', 'g')
		                 x = x.replace(pattern, row[i])
		             }
		             container.append(x)
		         }
		
		         data.forEach((row) => {
		             renderTemplate(row);
		         });
		         
		         $('.reservation-row').each((index, item) => {
	                    const $item = $(item);

	                    $(item).find('.num-person').on('change', function () {
	                        const numPerson = $(this).find(':selected').val();
	                        $item.find('[name="num_person"]').val(numPerson);

	                        $item.find('.btn').prop('disabled', false);
	                    });

	                    $(item).find('.btn').on('click', function (e) {
	                        const confirmMessage = `정말 예약하시겠습니까?`;
	                        if (!window.confirm(confirmMessage)) {
	                            e.preventDefault();
	                        }
	                    });
	                });
		    	 
		     })

            },
        });
        calendar.render();
    });
</script>

<div class="container">
    <h1 class="text-center mt-4 mb-4">예약신청</h1>

    <div id="calendar"></div>

    <div class="mb-4"></div>

    <table class="table">
        <thead>
        <tr>
            <th scope = "col">번호 </th>
            <th scope="col" >예약일자</th>
            <th scope="col" >코스</th>
            <th scope="col" >시간</th>
            <th scope="col" >인원</th>
            <th scope="col" >요금</th>
            
            <th scope="col">예약</th>
        </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>
</div>

<jsp:include page="../sections/footer.jsp"/>
