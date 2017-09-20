<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seats.jsp</title>

</head>
<body>
<input type="text" id="row" style="width: 30px"/>행
<input type="text" id="col" style="width: 30px"/>열
<input type="button" onclick="makeSeats(null)" value="확인" id="makeSeat"/>
<br>
<input type="button" value="좌석 배치" id="arrangement"/>
<input type="button" value="Prime Zone" id="prime"/>
<input type="button" value="Standard Zone" id="standard"/>
<input type="button" value="Economy Zone" id="economy"/>
<input type="button" value="Handicapped" id="hadicapped"/>
<input type="button" value="SWEETBOX" id="sweetbox"/>
<hr/>
<canvas id="canvas" width="500" height="400"></canvas>

<form id="seatValues" action="<c:url value='/screens/RegisterSeat.jsp'/>">
<input type="hidden" name="seatnumber"/>
<input type="hidden" name="screen_code"/>
<input type="hidden" name="seat"/>
</form>

<script>
function makeSeats(screenCode){
	
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
					else if((seats[i].number%2==1)){
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
	
	//var formTag = document.getElementById("seatValues");
	var seatnumber = document.getElementsByName("seatnumber");
	var screen_code = document.getElementsByName("screen_code");
	var seat = document.getElementsByName("seat");
	function registerSeats(screenCode){	
	
	}
}
</script>


</body>
</html>