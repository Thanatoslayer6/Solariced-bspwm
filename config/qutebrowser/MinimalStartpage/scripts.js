//btc price
var bitc = document.getElementById('btcprice');

let btc = {
	type: "GET",
	url:'https://api.coindesk.com/v1/bpi/currentprice/' + ctrycode + '.json',
	dataType: 'json',
	success: function(response) {
				let price = response.bpi[ctrycode].rate_float;
				let priceR = Math.round(price).toLocaleString();
					bitc.append([ctrycode] + " " + priceR);
		}
}

//covid cases 
let covid = {
	type: "GET",
	cache: true,
	url: 'https://coronavirus-19-api.herokuapp.com/countries/' + country + '',
	success: function(response) {
		let totalcases = response.cases.toLocaleString();
		let activecases = response.active.toLocaleString();
		let deaths = response.deaths.toLocaleString();
		var ccases = document.getElementById('totalcases');
		var cactive = document.getElementById('activecases')
		var cdeaths = document.getElementById('deaths')
		ccases.append(totalcases);
		cactive.append(activecases);
		cdeaths.append(deaths);
	},
	error: function() {
		$('#covidcontainer, #btcprice, #weather, #textblock').hide();
	} //hide all elements that need internet like btc, or weather...

}

let weather = {
	type: "GET",
	url: apiurl,
	success: function(response) {
		let weatherdesc = response.weather[0].description;
		let celsiustemp = Math.round(response.main.feels_like - 275.15);
		var wt = document.getElementById('weather');
		wt.append(celsiustemp + "°C" + " " + weatherdesc);

	}
}

//get some random quotes daily 
const t = new Date();
const ti = new Date();
t.setDate(t.getDate() + 1); //tomorrows date
ti.setDate(ti.getDate()) //current date
const tom = t.toDateString();
const tod = ti.toDateString();

let quotecontent = document.getElementById('quotes');
let quoteauthor = document.getElementById('author');

function getQuotes() {
	
	$.ajax({
		type: "GET",
		url: "https://api.quotable.io/random?maxLength=50",
		success: (response) => {

			if(!localStorage.getItem('addedQuotes')) {
				response.expiration = tom;
    		localStorage.setItem('addedQuotes', JSON.stringify(response));
				quotecontent.append(response.content);
				quoteauthor.append(response.author);
			}
		}
	});
};


if(localStorage.getItem('addedQuotes') != null){
	let datacontentquote = JSON.parse(localStorage.getItem('addedQuotes'));
	quotecontent.append(datacontentquote.content);
	quoteauthor.append(datacontentquote.author);

if(JSON.parse(localStorage.addedQuotes).expiration == tod){
		localStorage.removeItem(addedQuotes);
		getQuotes();
	}

}

getQuotes();
$.ajax(covid);
$.ajax(weather);
$.ajax(btc);
