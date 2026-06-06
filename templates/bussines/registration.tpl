<div class="blog-comments-form" style="margin-top:0"><div class="form">
    
[registration]
<div class="form-group">
<label for="name">Логин</label>
<input type="text" name="name" id="name" required>
</div>

<div class="form-group">
<label for="password1">Пароль</label>
<input type="password" name="password1" id="password1" required>
</div>

<div class="form-group">
<label for="password2">Повторите пароль</label>
<input type="password" name="password2" id="password2" required>
</div>

<div class="form-group">
<label for="email">E-mail</label>
<input type="email" name="email" id="email" required>
</div>
		
[recaptcha]
<div class="form-group">
<label for="lostname">Защита от спама</label>
{recaptcha}
</div>
[/recaptcha]

[/registration]

[validation]
<div class="form-group">
<label for="fullname">Ваше имя</label>
<input type="text" id="fullname" name="fullname">
</div>

<div class="form-group">
<label for="land">Место жительства</label>
<input type="text" id="land" name="land">
</div>

<div class="form-group">
<label for="image">О себе</label>
<textarea id="info" name="info" rows="8"></textarea>
</div>

<div class="form-group">
<label for="image">Аватар</label>
<input type="file" id="image" name="image">
</div>

[/validation]

</div></div>
    
<div class="form-group">
<button class="bbcodes" name="submit" type="submit">Зарегистрироваться</button>
</div>