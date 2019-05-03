"use strict";
/*
project: Messaging Web App
description: contains file system linked methods
author: Nicolas Maitre
version: 04.04.2019
*/
const fs = require("fs");
const querystring = require("querystring");
const CLIENT_RESOURCES_PATH = "/var/git/PRETPI_MAITRE/code/client_resources"; //web directory path

function FilesManager(){
	this.onRequest = function(urlObject, callBack){ //on http request, return the correct file in the website directory
		var path = "/main.html"; //defaults
		//console.log("exists: ", CLIENT_RESOURCES_PATH + urlObject.pathname);
		//test if file exists
		if(fs.existsSync(CLIENT_RESOURCES_PATH + urlObject.pathname) 
			&& urlObject.pathname != "/"){
			path = urlObject.pathname;
		}
		getFileFromWebsitePath(path, callBack);
	}
	function getFileFromWebsitePath(path, callBack){ //gets file from path
		fs.readFile(CLIENT_RESOURCES_PATH + path, function(error, data){
			callBack(error, data);
		});
	}
}
module.exports = new FilesManager();