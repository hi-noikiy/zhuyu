<?php


define('IN_GW', true);

if(in_array($action, array('profile', 'device', 'callback', 'appstore', 'appstore2'))) {
	$do = $action;
	$action = 'redirect';
}
if($action == 'touch') {
	exit('success');
}
