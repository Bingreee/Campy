<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>calendar</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<style>
#calendarBox{
	width: 70%;
	padding-left: 15%;
}
.fc-event-time{
	display: none;
}
.fc-day-other{
	background-color: #eee;
}

</style>
</head>
<body>
    <div id="calendarBox">
        <div id="calendar"></div>
    </div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
    	
        $(function () {
            var request = $.ajax({
                url: "/fullCalender", 
                dataType: "json"
            });

            request.done(function (data) {
                console.log(data); // log 로 데이터 찍어주기.

                var calendarEl = document.getElementById('calendar');

                var calendar = new FullCalendar.Calendar(calendarEl, {
                	locale:'ko',
                    initialView: 'dayGridMonth',
                    headerToolbar: {
                        left: 'dayGridMonth,timeGridWeek,timeGridDay',
                        center: 'title',
                        right: 'prev,next today'
                    },
                    editable: false,
                    droppable: false,
                    displayEventTime: false,
                    
                    /**
                     * data 로 값이 넘어온다. log 값 전달.
                     */
                    events: data
                });
                calendar.render();
            });

            request.fail(function( jqXHR, textStatus ) {
                alert( "Request failed: " + textStatus );
            });
        });

    });

</script>
</body>
</html>
