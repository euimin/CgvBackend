<%@page import="model.BackendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/loginCheck.jsp" %>
<%
	/*srceen table
	SCREEN_CODE
	THEATER_CODE
	NO
	SEATS
	
	seat table
	SEATNUMBER
	SCREEN_CODE
	SEAT*/
	String theater_code = request.getParameter("theater_code");
	String theater_name = request.getParameter("theater_name");
	request.setAttribute("theater_code", theater_code);
	request.setAttribute("theater_name", theater_name);
	String no = request.getParameter("no");
	String seats = request.getParameter("seats");
	String seatnumber = request.getParameter("seatnumber");
	String seat = request.getParameter("seat");
	if(no != null){
		BackendDAO dao = new BackendDAO(application);
		String screen_code = dao.registerScreen(theater_code, no, seats);
		if(screen_code != null){
			for(int i=0; i<Integer.parseInt(seats); i++){		
				dao.registerSeat(seatnumber.split(",")[i], screen_code, seat.split(",")[i]);
			}
			response.sendRedirect(request.getContextPath()+"/screens/Screens.jsp?theater_code="+theater_code
					+"&theater_name="+theater_name);
		}
		dao.close();
	}
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->  
    <title>CGV 관리자 페이지</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  	<!-- JQuery -->
  	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
  	<script>
  		$(function(){
  		//메뉴 표시를 위한 코드
			var page = location.href;
		    $('#menubar li a').each(function(){
		    	var href = $(this).attr('href').split("/");
		    	var menu = href[2];	     
		        if (page.indexOf(menu) != -1) {
		            $(this).parent().addClass('active');		            
		        } else {
		            $(this).parent().removeClass('active');		            
		        }
		    });
  		});
 		
  		function makeSeats(){
			
			var canvas = document.getElementById("canvas");
			var ctx = canvas.getContext("2d");
			
			var row = document.getElementById("row").value;
			var col = document.getElementById("col").value;
			var btnMakeSeat = document.getElementById("makeSeat");
			var btnArrange = document.getElementById("arrangement");
			var btnPrime = document.getElementById("prime");
			var btnStandard = document.getElementById("standard");
			var btnEconomy = document.getElementById("economy");
			var btnHadicapped = document.getElementById("hadicapped");
			var btnSweetbox = document.getElementById("sweetbox");
			
			var seats = new Array(col*row);
			var rows = new Array(row);
			
			function Row(){
				this.x;
				this.y;
				this.row;
				
				this.draw = drawRow;
			}
			
			function drawRow(){
				ctx.fillStyle = "black";
				ctx.font = "bold 13px verdana";
				ctx.fillText(this.row, this.x+5, this.y+13);
			}
			
			function initRow(){
				var yPos = 0;
				var rowNo = 65;
				for(var i=0; i<row; i++){
					rows[i] = new Row();
					rows[i].x = 0;
					rows[i].y = yPos;
					rows[i].row = String.fromCharCode(rowNo);
					yPos += 21;
					rowNo++;
				}
			}
			
			function Seat(){
				this.x;
				this.y;
				this.color;
				this.size;
				this.fontColor;
				this.colnumber;
				this.visible;
				this.number;
				this.type;
				
				this.drawSeat = drawSeat;
			}
			
			function drawSeat(){
				if(this.type=="sweetbox"){
					this.color = "#FF0066";
				}
				else if(this.type=="hadicapped"){
					this.color = "#1E8449";
				}
				else{
					this.color = "#808B96";
				}
				ctx.fillStyle = this.color;
				ctx.fillRect(this.x, this.y, this.size, this.size);
				if(this.type=="prime"||this.type=="standard"||this.type=="economy"){
					var borderColor;
					switch(this.type){
						case "prime": borderColor = "red"; break;
						case "standard": borderColor = "green"; break;
						case "economy": borderColor = "yellow";
					}
					ctx.strokeStyle = borderColor;
					ctx.lineWidth = 5;
					ctx.strokeRect(this.x, this.y, this.size, this.size);
				}
				ctx.fillStyle = this.fontColor;
				ctx.font = "10px verdana";
				ctx.fillText(this.colnumber, this.x+5, this.y+13);
			}
			
			function initSeat(){
				var xPos = 21;
				var yPos = 0;
				var rowNo = 65;
				
				for(var i=1; i<=(row*col); i++){
					seats[i-1] = new Seat();
					seats[i-1].x = xPos;
					seats[i-1].y = yPos;
					seats[i-1].color = "#808B96";
					seats[i-1].size = 20;
					seats[i-1].fontColor = "white";
					seats[i-1].colnumber = ((i-1)%col)+1;
					seats[i-1].visible = true;
					seats[i-1].number = String.fromCharCode(rowNo)+seats[i-1].colnumber;
					seats[i-1].type = "general";
					
					xPos += 21;
					if(i%col==0){
						xPos = 21;
						yPos += 21;
						rowNo++;
					}
				}
			}
			
			var clickEvent = "arrangement";	
			btnArrange.onclick = function (){
				clickEvent = "arrangement";
				console.log(clickEvent);
			};
			btnPrime.onclick = function (){
				clickEvent = "prime";
				console.log(clickEvent);
			};
			btnStandard.onclick = function (){
				clickEvent = "standard";
				console.log(clickEvent);
			};
			btnEconomy.onclick = function (){
				clickEvent = "economy";
				console.log(clickEvent);
			};
			btnHadicapped.onclick = function (){
				clickEvent = "hadicapped";
				console.log(clickEvent);
			};
			btnSweetbox.onclick = function (){
				clickEvent = "sweetbox";
				console.log(clickEvent);
			};
			
			function clickEventHandler(e){
				console.log("x:"+e.offsetX+",y:"+e.offsetY);
				for(var i=0; i<(row*col); i++){
					if((e.offsetX>seats[i].x)&&(e.offsetX<(seats[i].x+seats[i].size))&&
						(e.offsetY>seats[i].y)&&(e.offsetY<(seats[i].y+seats[i].size))){
						if(clickEvent=="arrangement"){
							seats[i].visible = !seats[i].visible;
						}
						else if(clickEvent=="prime"||clickEvent=="standard"||clickEvent=="economy"){
							var targetRow = Math.floor(i/col);
							console.log(targetRow);
							for(var j=0; j<(row*col); j++){
								if(Math.floor(j/col)==targetRow){
									if(seats[j].type != clickEvent)seats[j].type = clickEvent;
									else seats[j].type = "general";
								}
							}
						}
						else{
							if(seats[i].colnumber%2==0||(seats[i].colnumber==col)){
								if(seats[i].type != clickEvent){
									seats[i].type = clickEvent;
									seats[i-1].type = clickEvent;
								}
								else{
									seats[i].type = "general";
									seats[i-1].type = "general";
								}
							}
							else if((seats[i].colnumber%2==1)){
								if(seats[i].type != clickEvent){
									seats[i].type = clickEvent;
									seats[i+1].type = clickEvent;
								}
								else{
									seats[i].type = "general";
									seats[i+1].type = "general";
								}
							}
						}
					}
				}
			}
			canvas.addEventListener("click", clickEventHandler);
			
			initRow();
			initSeat();
			
			function viewLoop(){
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				for(var i=0; i<row; i++){
					rows[i].draw();
				}
				for(var i=0; i<(row*col); i++){
					if(seats[i].visible){
						seats[i].drawSeat();
					}
				}		
			}
			
			var interval = setInterval(viewLoop, 33.33);
			btnMakeSeat.onclick = function(){
				row = document.getElementById("row").value;
				col = document.getElementById("col").value;
				initRow();
				initSeat();
			};
			
			var form = document.getElementById("frm");
			var btnRegister = document.getElementById("register");
			var seatsTag = document.getElementById("seats");
			var seatnumber = document.getElementById("seatnumber");
			var seat = document.getElementById("seat");
			btnRegister.onclick = function(){
				var seatnumberStr="";
				var seatStr="";
				var seatsCount = 0;
				for(var i=0; i<(col*row); i++){
					if(seats[i].visible){
						seatnumberStr += seats[i].number+",";
						seatStr += seats[i].type+",";
						seatsCount++;
					}
				}
				seatsTag.value = seatsCount;
				seatnumber.value = seatnumberStr.substring(0, seatnumberStr.length-1);
				seat.value = seatStr.substring(0, seatStr.length-1);
				form.submit();
			};
		}
  		
  		function cancel(){
  			location.href="<c:url value='/screens/Screens.jsp'/>"
  				+"?theater_code=${theater_code}&theater_name=${theater_name}";
  		}
  	</script>
  	<style type="text/css">
.btn-custom {
  background-color: hsl(115, 100%, 31%) !important;
  background-image: -khtml-gradient(linear, left top, left bottom, from(#e727c0), to(#c515a2));
  background-image: -moz-linear-gradient(top, #e727c0, #c515a2);
  background-image: -ms-linear-gradient(top, #e727c0, #c515a2);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e727c0), color-stop(100%, #c515a2));
  background-image: -webkit-linear-gradient(top, #e727c0, #c515a2);
  background-image: -o-linear-gradient(top, #e727c0, #c515a2);
  background-image: linear-gradient(#e727c0, #c515a2);
  border-color: #c515a2 #c515a2 hsl(312, 80%, 40.5%);
  color: #fff !important;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.16);
  -webkit-font-smoothing: antialiased;
}
</style>
  </head>

  <body role="document">

    <!-- 고정 네비바 시작 -->
    <jsp:include page="/template/TopMenu.jsp"/>
	<!-- 고정 네비바 끝 -->
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>상영관 등록</h1>
        <p></p>
      </div>

	<!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1></h1>
      </div>
    
    <!-- 실제 내용 작성 -->  
    <div>
    <!--  SCREEN_CODE
		 THEATER_CODE
		 NO
		 SEATS -->
		<form method="post" id="frm">
	    <table class="table">
            <tbody>
              <tr>
                <td>극장 코드</td>
                <td>상영관 번호</td>
              </tr>
              <tr>
                <td>
                	<input type="text" value='<%=theater_code%>' 
                		id="theater_code" name="theater_code" disabled="disabled"/>
                </td>
                <td>
                	<input type="text" id="no" name="no"/>
                </td>       
              </tr>
              <tr>
              	<td colspan="2">            
              		<input type="text" id="row" style="width: 30px"/>행
					<input type="text" id="col" style="width: 30px"/>열
					<input type="button" onclick="makeSeats()" value="확인" id="makeSeat"/>
					<br>
					<input class="btn btn-default" type="button" value="좌석 배치" id="arrangement"/>
					<input class="btn btn-danger" type="button" value="Prime Zone" id="prime"/>
					<input class="btn btn-success" type="button" value="Standard Zone" id="standard"/>
					<input class="btn btn-warning" type="button" value="Economy Zone" id="economy"/>
					<input class="btn btn-success" type="button" value="Handicapped" id="hadicapped"/>
					<input class="btn btn-custom" type="button" value="SWEETBOX" id="sweetbox"/>
					<hr/>
					<canvas id="canvas" width="500" height="400"></canvas>
					<input type="hidden" id="seats" name="seats"/>
					<input type="hidden" id="seatnumber" name="seatnumber"/>			
					<input type="hidden" id="seat" name="seat"/>
              	</td>
              </tr>
              <tr>
              	<td colspan="2">
              		<input type="button" class="btn btn-success" value="취소" onclick="cancel()"/>
              		<input type="button" class="btn btn-primary" value="등록" id="register"/>
              	</td>
              </tr>
            </tbody>
          </table>
          </form>
    </div>

    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
  </body>
</html>
    