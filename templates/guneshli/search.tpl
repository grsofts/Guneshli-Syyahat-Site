<div class="blog-comments-form search-form" style="margin-top:0"><div class="form">

[simple-search]
<div class="form-group">
<label>Введите слово(а) для поиска</label>{searchfield}<br><br>
<button type="button" class="bbcodes" name="dosearch" id="dosearch" onclick="javascript:list_submit(-1); return false;">Найти</button>
<button type="button" class="bbcodes" name="dofullsearch" id="dofullsearch" onclick="javascript:full_submit(1); return false;">Расширенный поиск</button>
</div>
[/simple-search]

[extended-search]
<div class="row">

<div class="col-md-6">

<div class="form-group">
<label>Слова для поиска</label>
{searchfield}
</div>

<div class="form-group">
<label>Поиск по</label>
{search-area}
</div>

<div class="form-group">
<label>Искать статьи с комментариями</label>
<div class="row">
<div class="col-md-6">{news-option}</div>
<div class="col-md-6">{comments-num}</div>
</div>
</div>

</div>

<div class="col-md-6">

<div class="form-group">
<label>Имя пользователя</label>
<div id="userfield">{userfield}</div>
</div>

<div class="form-group">
<label>Поиск по разделам</label>
{category-option}
</div>

<div class="form-group">
<label>Временной период</label>
<div class="row">
<div class="col-md-6">{date-option}</div>
<div class="col-md-6">{date-beforeafter}</div>
</div></div>

</div></div>

<div class="form-group">
<label>Сортировка результатов</label>
<div class="row">
<div class="col-md-6">{sort-option}</div>
<div class="col-md-6">{order-option}</div>
</div></div>

<div>
<button type="button" class="bbcodes" name="dosearch" id="dosearch" onclick="javascript:list_submit(-1); return false;">Искать</button>
<button type="button" class="bbcodes" name="doclear" id="doclear" onclick="javascript:clearform('fullsearch'); return false;">Сбросить</button>
<button type="reset" class="bbcodes" name="doreset" id="doreset">Вернуть</button>
</div>
<br><br>
[/extended-search]

</div></div>

[searchmsg]
<div class="berrors">
<strong>Уважаемый пользователь!</strong><br>
{searchmsg}
</div>
[/searchmsg]