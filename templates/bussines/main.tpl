<!DOCTYPE html>
<html lang="ru">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
{headers}
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="{THEME}/css/animate.min.css">
<link rel="stylesheet" href="{THEME}/css/bootstrap.min.css">
<link rel="stylesheet" href="{THEME}/css/cubeportfolio.min.css">
<link rel="stylesheet" href="{THEME}/css/font-awesome.css">
<link rel="stylesheet" href="{THEME}/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="{THEME}/css/magnific-popup.min.css">
<link rel="stylesheet" href="{THEME}/css/owl-carousel.min.css">
<link rel="stylesheet" href="{THEME}/css/slicknav.min.css">
<link rel="stylesheet" href="{THEME}/css/reset.css">
<link rel="stylesheet" href="{THEME}/css/style.css">
<link rel="stylesheet" href="{THEME}/css/engine.css">
<link rel="stylesheet" href="{THEME}/css/responsive.css">
<link rel="stylesheet" href="/engine/classes/min/index.php?charset=utf-8&f={THEME}/uniform/css/uniform.css&114" />
</head>

<body>
		
{include file="header.tpl"}
    
[available=feedback|static]{content}{info}[/available]
    
[not-available=main|feedback|static]
<div class="breadcrumbs overlay" style="background-image:url('{THEME}/images/breadcrumb.jpg')">
<div class="container">
<div class="row">
<div class="col-12">
<div class="bread-inner">
[available=cat|showfull]<div class="bread-menu"><ul><li><a href="/">Главная</a></li><li><a href="{category-url}">{category-title}</a></li></ul></div>[/available]
[available=lostpassword]<div class="bread-title"><h2>Восстановление пароля</h2></div>[/available]
[available=register]<div class="bread-title"><h2>Регистрация на сайте</h2></div>[/available]
[available=search]<div class="bread-title"><h2>Поиск по сайту</h2></div>[/available]
[available=showfull]<div class="bread-title"><h2>Полная новость</h2></div>[/available]
[available=pm]<div class="bread-title"><h2>Личные сообщения</h2></div>[/available]
[available=alltags]<div class="bread-title"><h2>Облако тэгов</h2></div>[/available]
[available=userinfo]<div class="bread-title"><h2>Страница пользователя</h2></div>[/available]
[available=addnews]<div class="bread-title"><h2>Добавить новость</h2></div>[/available]
[available=cat]<div class="bread-title"><h2>{category-title}</h2></div>[/available]
</div></div></div></div></div>
    
<section class="[not-available=showfull]blog-layout blog-latest section-space[/not-available][available=showfull]news-area archive blog-single section-space[/available]">
<div class="container">
<div class="row">
    
<div class="col-lg-8 col-12">
{content}{info}
</div>
    
{include file="sidebar.tpl"}
    
</div></div></section>
[/not-available]
		
[available=main]
{include file="main/slider.tpl"}
{include file="main/module1.tpl"}
{include file="main/module2.tpl"}
{include file="main/module3.tpl"}
{include file="main/module4.tpl"}
{include file="main/module5.tpl"}
{include file="main/module6.tpl"}
{include file="main/module7.tpl"}
[/available]
    
{include file="footer.tpl"}

{AJAX}
<script>
	function show_modal_dle() {
		$("#div_modal_dle").dialog({
			autoOpen: true,
			show: "fade",
            modal:true,
			hide: "fade",
			width: 350,
		});
	}
</script>
<script src="{THEME}/js/popper.min.js"></script>
<script src="{THEME}/js/bootstrap.min.js"></script>
<script src="{THEME}/js/scrollup.js"></script>
<script src="{THEME}/js/jquery-fancybox.min.js"></script>
<script src="{THEME}/js/cubeportfolio.min.js"></script>
<script src="{THEME}/js/waypoints.min.js"></script>
<script src="{THEME}/js/jquery.counterup.min.js"></script>
<script src="{THEME}/js/slicknav.min.js"></script>
<script src="{THEME}/js/owl-carousel.min.js"></script>
<script src="{THEME}/js/easing.js"></script>
<script src="{THEME}/js/theme-option.js"></script>
<script src="{THEME}/js/magnific-popup.min.js"></script>
<script src="{THEME}/js/active.js"></script>
<script src="/engine/classes/min/index.php?charset=utf-8&f={THEME}/uniform/js/jquery.ladda.min.js,{THEME}/uniform/js/jquery.form.min.js,{THEME}/uniform/js/uniform.js&114"></script>
    
</body>
</html>