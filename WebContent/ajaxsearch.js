var req;
var isIE;
var completeField;
var writeToDiv;

function init() {
    completeField = document.getElementById("search-field");
}

function searchItems() {
    var url = "searchItems?searchText=" + escape(completeField.value) + "&org=" + escape(getParameterByName("org"));
    clearDiv();
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function clearDiv() {
	document.getElementById("showItems").innerHTML = "";
}

function callback() 
{
    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessages(req.responseXML);
        }
    }
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function parseMessages(responseXML) {
	
	var output = "";
    if (responseXML == null) {
    	return false;
    } else {
    	var items = responseXML.getElementsByTagName("items")[0];
		var i, col;
		
		var user = items.getElementsByTagName("userName")[0];
		var userName = user.childNodes[0].nodeValue;
		
			for(i = 1; i < items.childNodes.length;)
			{
	        	for (col = 0; col < 3 && i < items.childNodes.length; col++)
	        	{
	        		var item = items.childNodes[i];
			        var itemName = item.getElementsByTagName("itemName")[0];
			        var itemDesc = item.getElementsByTagName("itemDesc")[0];
			        var itemId = item.getElementsByTagName("itemID")[0];
			        
			        output += "<div class= \"row-fluid\">";
	        		output += "<div class=\"span4\" style = \"border: 10px solid transparent;\">";
	        		output += "<div class=\"card\">";
	                output += "<h2 class=\"card-heading simple\">"+itemName.childNodes[0].nodeValue+"</h2>";
	                output += "<div class=\"card-body\">";
	                output +=  "<p>" + itemDesc.childNodes[0].nodeValue + "</p><p>";
	                if (!(userName === "null"))
	                { 
	                  output += "<a class=\"btn\" href=\"items.jsp?item=" + itemId.childNodes[0].nodeValue + "\">View details " + unescape("%BB") + "</a>";
	                }
	                output += "</p></div></div></div>";
	                i++;
	            }
	        	output += "</div>";
		    }
			output += "<hr>";
			document.getElementById("showItems").innerHTML = output;
		
     }
    
}
