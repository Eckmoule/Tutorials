angular.module("StayingSharp", ["ngResource", "ngRoute", "stGravatar"]).config(function(GravatarProvider){
	GravatarProvider.setSize(100);
});