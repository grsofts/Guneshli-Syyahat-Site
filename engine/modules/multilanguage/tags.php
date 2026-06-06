<?php
/*
=====================================================
 Multi-Language 3.6
-----------------------------------------------------
 Автор: Japing
-----------------------------------------------------
 https://japing.pw/
-----------------------------------------------------
 Copyright (c) 2014-2019  Japing
=====================================================
 Данный код защищен авторскими правами
=====================================================
*/

if( version_compare(phpversion(), '7.1.0', '>=') ) {
	require (ENGINE_DIR . '/modules/multilanguage/tags.7.1.php');
} elseif( version_compare(phpversion(), '5.6.0', '>=') ) {
	require (ENGINE_DIR . '/modules/multilanguage/tags.5.6.php');
} else {
	require (ENGINE_DIR . '/modules/multilanguage/tags.5.3.php');
}

?>