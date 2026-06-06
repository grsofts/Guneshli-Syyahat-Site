<div class="uf-wrapper">

<span class="mfp-close">&times;</span>

<div class="uf-header">Заказать звонок</div>
    
[debug]<div class="uf-content">{debug}</div>[/debug]

[error]
<div class="berrors">
<b>Ошибка</b>
<ul>
[uf_token_error]<li>Ошибка сессии, попробуйте ещё раз.</li>[/uf_token_error]
[uf_error_name]<li>Вы не указали Ваше имя</li>[/uf_error_name]
[uf_error_phone]<li>Вы не указали номер телефона</li>[/uf_error_phone]
</ul>
</div>
[/error]

[success]
<div class="berrors2"><b>Ваша заявка принята!</b> <br> Ждите звонка менеджера в удобное для вас время.</div>
[/success]

[form]
<div class="contact-form-area" style="margin-top:0;box-shadow:none">
<div class="form" style="margin-top:0">

<div class="form-group" style="margin-top:0">
<label>Ваше имя<span class="req_red">*</span></label>
<input type="text" name="name" required>
</div>

<div class="form-group">
<label>Номер телефона<span class="req_red">*</span></label>
<input type="text" name="phone" required>
</div>
    
<div class="form-group"></div>
<div class="cheking"><input name="cheking" required id="cheking" type="radio" value="0"><label for="cheking">  Я согласен на <a href="/rules.html" style="color:#f3a712">обработку персональных данных</a></label></div>

<div class="form-group button">
<button type="submit" class="bizwheel-btn theme-2 btn-block">Заказать звонок</button>
</div>
								
</div></div>

[/form]
    
</div>