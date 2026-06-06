[not-group=5]
<li class="bar"><a href="javascript: void(0);" onclick="show_modal_dle();"><img src="{foto}" alt="image" width="100%" style="border-radius:50%;margin-top:-4px"></a></li>
<div id="div_modal_dle" title="Личный кабинет" style="display: none;">
<ul class="menu_login">
<li><a href="{admin-link}">Админпанель</a></li>
<li><a href="{profile-link}">Мой профиль</a></li>
<li><a href="{pm-link}">Мои сообщения</a></li>
<li><a href="{newsposts-link}">Непрочитанное</a></li>
<li><a href="{addnews-link}">Опубликовать</a></li>
<li><a href="{logout-link}">Выход</a></li>
</ul>
</div>
[/not-group]

[group=5]
<li class="bar"><a href="javascript: void(0);" onclick="show_modal_dle();" class="fa fa-user"></a></li>
<div id="div_modal_dle" title="Личный кабинет" style="display: none;">
<form method="post">
<div class="blog-comments-form"><div class="form">
<div class="form-group">
<input type="text" name="login_name" id="login_name" class="form-control" placeholder="Логин">
</div>
<div class="form-group">
<input type="password" name="login_password" id="login_password" class="form-control" placeholder="Пароль">
</div>
<div class="form-group"><a href="{lostpassword-link}" style="font-size:.8rem">Забыли пароль?</a></div>
<div class="form-group">
<button class="bbcodes btn-block" type="submit" name="submit">Авторизоваться</button>
<input name="login" type="hidden" id="login" value="submit">
</div>
<a href="{registration-link}" class="bbcodes btn-block" style="background:#f3a712;border-color:#f3a712;color:#fff;">Регистрация</a>
</div></div>
</form>
</div>
[/group]