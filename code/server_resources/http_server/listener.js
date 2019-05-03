"use strict";
/*
project: Messaging Web App
description: listens on the http port and redistributes requests
author: Nicolas Maitre
version: 04.04.2019
*/
const http = require('http');
const url = require('url');
const filesmanager = require("./fs/filesmanager");
const api = require("./api/apiEndpoint");

//create listener
var server = http.createServer(onRequest);
server.listen(80);
console.log("http server started");

function onRequest(request, result){//request event
	console.log("[" + (new Date(Date.now())).toDateString() + "] request received from: " + request.connection.remoteAddress);
	//parse url to get the request endpoint
	var parsedUrl = url.parse(request.url);
	var pathArray = parsedUrl.pathname.split("/");
	var endpoint = pathArray[1];
	switch(endpoint){
		case 'api': //api
			api.onRequest(parsedUrl);
		break;
		case 'imagesApi': //images api
			console.log("images api call");
		break;
		default: //file manager path
			filesmanager.onRequest(parsedUrl, function(error, data){
				returnRequest(result, error, data);
			});
		break;
	}
}

//returns response to client
function returnRequest(reqres, error, data){
	if(error){
		console.log("ERROR", error);
		reqres.statusCode = 500;
		//displays error message
		var endstring = "<h1>Erreur 500</h1><br/>";
		if(error.clientMsg){
			endstring += clientMsg;
		}else{
			endstring += "internal server error";
		}
		reqres.end(endstring);
		return;
	}
	reqres.statusCode = 200;
	reqres.end(data); //returns
}
