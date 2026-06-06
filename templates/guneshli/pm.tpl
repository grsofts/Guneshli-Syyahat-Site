<div style="box-shadow:0 0 15px #0000001c;padding:20px;margin-bottom:20px">

<div class="text-center row">
<div class="col-md-4"><a class="bbcodes btn-block" href="/index.php?do=pm&amp;folder=inbox">Входящие</a></div>
<div class="col-md-4"><a class="bbcodes btn-block" href="/index.php?do=pm&amp;folder=outbox">Отправленные</a></div>
<div class="col-md-4"><a class="bbcodes btn-block" href="/index.php?do=pm&amp;doaction=newpm">Написать</a></div>
</div>

<p style="margin-top:15px;font-size:14px">Папки персональных сообщений заполнены на:</p>
{pm-progress-bar}
<p style="font-size:14px">{proc-pm-limit}% от лимита ({pm-limit} сообщений)</p>

</div>

[pmlist]
<br><div class="zgdh-title">Список сообщений</div>
<div>{pmlist}</div>
<br /><br />
[/pmlist]

[newpm]<br>
<div class="zgdh-title">Отправить сообщение</div>
<div class="blog-comments-form"><div class="form">
    
<div class="form-group">
<input type="text" name="name" id="name" value="{author}" placeholder="Получатель">
</div>
    
<div class="form-group">
<input type="text" name="subj" id="subj" value="{subj}" placeholder="Тема">
</div>
    
<div class="form-group">
<textarea name="comments" id="comments" rows="8" placeholder="Сообщение" onfocus="setNewField(this.name, document.getElementById( 'dle-comments-form' ))"></textarea>
</div>
    
[recaptcha]
<div class="form-group">
<label>Защита от спама</label>
{recaptcha}
</div>
[/recaptcha]

<div class="form-group">
<button name="add" type="submit" id="submit" class="bbcodes">Отправить</button><br><br>
</div>

</div></div>
[/newpm]

[readpm]<br>
<div style="border:#565656 1px solid; padding:0px 7px 7px 7px;"><h3 align="center">{subj}</h3><div class="raz55"></div>{text}<div class="raz55"></div>
<div>Вам написал: <strong>{author}</strong> &nbsp; | &nbsp; [reply]Ответить[/reply] &nbsp; | &nbsp; [del]Удалить[/del]</div></div>
[/readpm]