function currentQueryString(){
	return returnQueryString(window.location.href);
}

function returnQueryString(url){
	return url.split("?")[1];
}

function removeQueryString(url){
  return url.split("?")[0];
}

function toTitleCase(str){
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}