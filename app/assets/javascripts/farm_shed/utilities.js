function currentQueryString(){
	return returnQueryString(window.location.href);
}

function returnQueryString(url){
	return url.split("?")[1];
}

function removeQueryString(url){
  return url.split("?")[0];
}

function stripQueryString(url){
	return removeQueryString(url);
}

function toTitleCase(str){
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}

function isScrolledIntoView(elem){
    var $elem = $(elem);
    var $window = $(window);

    var docViewTop = $window.scrollTop();
    var docViewBottom = docViewTop + $window.height();

    var elemTop = $elem.offset().top;
    var elemBottom = elemTop + $elem.height();

   return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
    // return elemTop >= docViewTop;
}

function isFullyInView(e){
	isScrolledIntoView(e);
}

function isInView(e, modifier){
	// modifier is integer number of pixels the element can be scrolled into view, before return true
	if(typeof modifier == 'undefined'){
		modifier = 0;
	}
    var $e = $(e);
    var $window = $(window);

    var docViewTop = $window.scrollTop();
    var docViewBottom = docViewTop + $window.height();

    var elemTop = $e.offset().top;
    // var elemBottom = elemTop + $elem.height();
   return elemTop + modifier < docViewBottom;
}


function doMethods(methods){
  //accepts either a method or an array of methods. Put method in array if necessary
  if(typeof methods == "function"){methods = [methods];}

  methods.forEach(function(method){
    method();
  });
}

//-----rgb to hex
var hexDigits = new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");

function rgb2hex(rgb) {
  rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
  return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

function hex(x) {
  return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
}

		
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1);
		if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
	}
	return "";
}

  function putInColsV(selector, item_selector){
    // Cols are designated with .anchor_col
    // Headers are desinated with .header_row
    var results = $(selector);

    for(var i = 0; i < results.length; i++){
      var r = $(results[i]);
      var rows = r.find(item_selector);
      var cols = r.find('.anchor_col');

      var per_col = parseInt(rows.length / cols.length);
      if(rows.length % cols.length != 0) per_col++;

      var first_index = 0;
      for(var j = 0; j < cols.length; j++){
        var col = $(cols[j]);
        var some_rows = rows.slice(first_index, first_index + per_col);
        if(some_rows.length > 0){
          col.append(some_rows);
        } else {
          col.find('.header_row').hide();
        }
        first_index = first_index + per_col;
      }
    }
  }
