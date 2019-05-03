"use strict";
/*
project: Messaging Web App
description: contains the api actions
author: Nicolas Maitre
version: 04.04.2019
*/
function ApiEndpoint(){
	this.onRequest = function(urlObj){ //on request event
		console.log("onRequest api", urlObj);
	};
}
module.exports = new ApiEndpoint();