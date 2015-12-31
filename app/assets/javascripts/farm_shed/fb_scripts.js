function publishToFacebook(id, token, message, link){
	
	link = link || window.location.href;
	message = message || '';
	
	FB.api('/' + id + '/feed', 'POST', 
		{	
			"access_token" : token,
			"message" : message,
			"link" : link
		}, function(response){
			console.log(response);
			
			if(typeof(afterFacebookPublishCallback) == 'function'){
				afterFacebookPublishCallback(response);
			}
		});
}

function facebookLogin(scope){	
	FB.login(function(response) {
		if (response.authResponse) {
			if(typeof(fbLoginSuccess) == 'function'){
				fbLoginSuccess(response);
			}			
		} else {
 			if(typeof(fbLoginFailure) == 'function'){
 				fbLoginFailure(response);
 			}
    	}
	}, scope);
}	

function referenceFacebookPage(page_id){
	return '@[' + page_id + ']';
}
