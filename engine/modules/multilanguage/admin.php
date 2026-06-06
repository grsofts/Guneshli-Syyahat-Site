<?php
/*
=====================================================
 Multi-Language 3.6
-----------------------------------------------------
 Автор: Japing
-----------------------------------------------------
 https://japing.pw/
-----------------------------------------------------
 Copyright (c) 2014-2018  Japing
=====================================================
 Данный код защищен авторскими правами
=====================================================
*/

if( version_compare(phpversion(), '7.1.0', '>=') ) {
	require (ENGINE_DIR . '/modules/multilanguage/admin.7.1.php');
} elseif( version_compare(phpversion(), '5.6.0', '>=') ) {
	require (ENGINE_DIR . '/modules/multilanguage/admin.5.6.php');
} else {
	require (ENGINE_DIR . '/modules/multilanguage/admin.5.3.php');
}

?>