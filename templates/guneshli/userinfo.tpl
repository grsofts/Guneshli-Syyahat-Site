<ul class="usinf">
<li><div class="ui-c1">Аватар</div> <div class="ui-c2"><img src="{foto}" width="60" alt="image"></div></li>
<li><div class="ui-c1">Логин</div> <div class="ui-c2">{usertitle}</div></li>
<li><div class="ui-c1">Имя</div> <div class="ui-c2">{fullname}[not-fullname]Неизвестно[/not-fullname]</div></li>
<li><div class="ui-c1">Группа</div> <div class="ui-c2">{status}</div></li>
<li><div class="ui-c1">Статус</div> <div class="ui-c2">[online]<span style="color: #70bb39;">Онлайн</span>[/online][offline]Офлайн[/offline]</div></li>
<li><div class="ui-c1">Место жительства</div> <div class="ui-c2">{land}[not-land]Неизвестно[/not-land]</div></li>
<li><div class="ui-c1">Рейтинг на сайте</div> <div class="ui-c2">{rate}</div></li>
<li><div class="ui-c1">Зарегистрирован</div> <div class="ui-c2">{registration}</div></li>
<li><div class="ui-c1">Последняя активность</div> <div class="ui-c2">{lastdate}</div></li>
<li><div class="ui-c1">Кол-во публикаций</div> <div class="ui-c2">{news-num}&nbsp;&nbsp; [ {news} ]</div></li>
<li><div class="ui-c1">Кол-во комментариев</div> <div class="ui-c2">{comm-num}&nbsp;&nbsp; [ {comments} ]</div></li>
<li><div class="ui-c1">О себе</div> <div class="ui-c2">{info}</div></li>
<li><div class="ui-c1">Подпись</div> <div class="ui-c2">{signature}</div></li>
</ul>

[not-logged]

<br><div class="zgdh-title">Редактировать информацию</div>

<div class="blog-comments-form"><div class="form">

<div class="form-group">
<label for="fullname">Ваше имя</label>
<input type="text" name="fullname" id="fullname" value="{fullname}">
</div>

<div class="form-group">
<label for="email">Ваш e-mail</label>
<input type="email" name="email" id="email" value="{editmail}" required>
</div>

<div class="form-group">
<label for="land">Место проживания</label>
<input type="text" name="land" id="land" value="{land}">
</div>

<div class="form-group categoryselect">
<label>Часовой пояс</label>
{timezones}
</div>

<div class="form-group">
<label for="altpass">Старый пароль</label>
<input type="password" name="altpass" id="altpass" class="form-control">
</div>

<div class="form-group">
<label for="password1">Новый пароль</label>
<input type="password" name="password1" id="password1" class="form-control">
</div>

<div class="form-group">
<label for="password2">Повторите новый пароль</label>
<input type="password" name="password2" id="password2" class="form-control">
</div>

<div class="form-group">
<label for="image">Загрузите аватар</label>
<input type="file" name="image" id="image" class="form-control">
</div>

<div class="form-group">
<label for="info">О себе</label>
<textarea name="info" id="info" rows="9" class="form-control">{editinfo}</textarea>
</div>

<div class="form-group">
<label for="signature">Подпись</label>
<textarea name="signature" id="signature" rows="9" class="form-control">{editsignature}</textarea>
</div>

[group=1,2,3]
<div class="form-group">
<label for="allowed_ip">Блокировка по IP</label>
<textarea placeholder="Примеры: 192.48.25.71 or 129.42.*.*" rows="9" name="allowed_ip" id="allowed_ip" class="form-control">{allowed-ip}</textarea>
</div>
[/group]

<div class="form-group">
<button name="submit" class="bbcodes" type="submit"><i class="fa fa-save"></i> Сохранить</button>
<input name="submit" type="hidden" id="submit" value="submit">
</div>

</div></div>

[/not-logged]