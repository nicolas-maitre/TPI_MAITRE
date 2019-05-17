"use strict";
/*
project: Messaging Web App
description: contains the configuration of each page
author: Nicolas Maitre
version: 03.04.2019
*/
var pagesConfig = {
	mwa:{
		title: "Messaging Web App",
		requireLogin: true,
		bootAction: "onMWAPageBuilt"
	},
	login:{
		title: "LogIn"
	},
	error:{
		title: "Error",
		rebuild:true
	}
}