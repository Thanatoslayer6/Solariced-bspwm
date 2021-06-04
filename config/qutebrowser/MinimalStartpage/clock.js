//time
setInterval(function(){

	let tme = document.getElementById("time");
	let ap = document.getElementById("ampm");
	let hrs = new Date().getHours() % 12 || 12
	let ampm = (new Date().getHours() >= 12) ? "PM" : "AM";
	let mins = new Date().getUTCMinutes()
	
	function addZero(l){
		if (mins < 10) {
			l = "0" + mins;
		}
		return l;
	}
	
	let properMins = addZero(mins);
	ap.textContent = `${ampm}`;
	tme.textContent = `${hrs}`+ ":" +`${properMins}`;
}, 500);

