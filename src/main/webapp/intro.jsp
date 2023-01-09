<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="cursor:pointer;" onclick="location.href='Main_page.jsp'">
<head>
<meta charset="UTF-8">
<title>최강선생</title>
<link rel="stylesheet" href="css/intro.css">


<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
	.mouse{
			position: absolute;
            top: 0; 
            left: 0; 
            width: 230px; 
            height: 20px;
            background-color: #f5f5f5; 
            transform: translateX(5%);
            font-weight: 900;
	}

</style>



</head>
<body id="body">
	<div id="container">
		<span id="text1"></span> <span id="text2"></span>
	</div>

	<svg id="filters">
	    <defs>
	        <filter id="threshold">
	            <feColorMatrix in="SourceGraphic" type="matrix"
							   values="1 0 0 0 0
						               0 1 0 0 0
						               0 0 1 0 0
						               0 0 0 255 -140" />
	        </filter>
	    </defs>
	</svg>
	<div id="text">과외는 최강선생</div>
	<div class="mouse">클릭 시 메인메뉴로 이동합니다</div>

	<script type="text/javascript">
/* "use strict"; */

	var elts = {
	    text1: document.getElementById("text1"),
	    text2: document.getElementById("text2")
	};


	
	var texts = ["성적이 이게 뭐람", "아.. 과외 구해야겠다..", "근데 선생님을 어디서 찾지??","어디 괜찮은 선생님 없나..?"];
	
	var morphTime = 1;
	var cooldownTime = 0.5;
	
	var textIndex = texts.length - 1;
	var time = new Date();
	var morph = 0;
	var cooldown = cooldownTime;
	
	elts.text1.textContent = texts[textIndex % texts.length];
	elts.text2.textContent = texts[(textIndex + 1) % texts.length];
	
	function doMorph() {
	    morph -= cooldown;
	    cooldown = 0;
	
	    var fraction = morph / morphTime;
	
	    if (fraction > 1) {
	        cooldown = cooldownTime;
	        fraction = 1;
	    }
	    
	    if(textIndex >= 7){
	    	
	    	var text1 = document.getElementById("text1");
	    	var text2 = document.getElementById("text2");
	    	text1.innerHTML = "";
	    	text2.innerHTML = "";
	    	
	    	var body = document.getElementById("body");
	    	body.style.margin="auto";
	    	
	    	
	    	var text = document.querySelector('#text'); 
	
	    	text.setAttribute('data-text', text.innerHTML);
	    	return false;
	    	
	    }else{
	    	setMorph(fraction);	
	    }
	   
	
	    
	}
	
	function setMorph(fraction) {
	    elts.text2.style.filter = "blur(" + Math.min(8 / fraction - 8, 100) + "px)";
	    elts.text2.style.opacity = Math.pow(fraction, 0.4) * 100 + "%";
	
	    fraction = 1 - fraction;
	    elts.text1.style.filter = "blur(" + Math.min(8 / fraction - 8, 100) + "px)";
	    elts.text1.style.opacity = Math.pow(fraction, 0.4) * 100 + "%";
	
	    elts.text1.textContent = texts[textIndex % texts.length];
	    elts.text2.textContent = texts[(textIndex + 1) % texts.length];
	}
	
	function doCooldown() {
	    morph = 0;
	
	    elts.text2.style.filter = "";
	    elts.text2.style.opacity = "100%";
	
	    elts.text1.style.filter = "";
	    elts.text1.style.opacity = "0%";
	}
	
	function animate() {
	    requestAnimationFrame(animate);
	
	    var newTime = new Date();
	    var shouldIncrementIndex = cooldown > 0;
	    var dt = (newTime - time) / 1000;
	    time = newTime;
	
	    cooldown -= dt;
	
	    if (cooldown <= 0) {
	        if (shouldIncrementIndex) {
	            textIndex++;
	        }
	
	        doMorph();
	    } else {
	        doCooldown();
	    }
	}
	
	animate();
	
	
	
	
	const mouse = document.querySelector(".mouse");
	
		document.addEventListener("mousemove", function(e) {
	
	    const mouseX = e.clientX;
	
	    const mouseY = e.clientY;
	
	    mouse.style.left = mouseX + 'px';
	
	    mouse.style.top = mouseY + 'px';
		});
</script>



</body>
</html>