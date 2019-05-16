"use strict";
/*
project: Messaging Web App
description: contains the api actions
author: Nicolas Maitre
version: 16.05.2019
*/
const database = require('../../classes/databasemanager');

function ApiActions(){
	/*params{
		auth: {},
		params: {},
		options: {},
		data: {}
	}*/
	this.getMessages = function(params, callBack){
		console.log("getMessages", params);
		
		//create request
		
		
		//dev
		callBack({clientMsg:"test method"}, false);
	};
}
module.exports = new ApiActions();