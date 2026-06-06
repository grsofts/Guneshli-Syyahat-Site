<div class="blog-comments-form"><div class="form">
    
<div class="form-group">
<label for="alt_name" class="imp">Заголовок</label>
<input type="text" name="title" id="title" value="{title}" required>
</div>

[urltag]
<div class="form-group">
<label for="alt_name" class="imp">URL новости</label>
<input type="text" name="alt_name" id="alt_name" value="{alt-name}">
</div>
[/urltag]

<div class="form-group categoryselect">
<label for="category" class="imp">Категория</label>
{category}
</div>

<div class="form-group">
<label><a href="#" class="bbcodes" onclick="$('.addvote').toggle();return false;">Добавить Опрос</a></label>
</div>

<div class="form-group addvote" style="display:none;">
<label for="vote_title" >Заголовок опроса</label>
<input type="text" name="vote_title" value="{votetitle}" class="wide" />
</div>

<div class="form-group addvote" style="display:none;">
<label for="frage" >Вопрос</label>
<input type="text" name="frage" value="{frage}" class="wide" />
</div>

<div class="form-group textarea addvote" style="display:none;">
<label for="vote_body" >Список ответов</label>
<textarea name="vote_body" rows="8" placeholder="Каждая новая строка является новым вариантом ответа">{votebody}</textarea><br /><label><input type="checkbox" name="allow_m_vote" value="1" {allowmvote}> Разрешить выбор нескольких вариантов</label>
</div>

<div class="form-group textarea">
<label for="short_story" class="imp">Краткое описание</label>
[not-wysywyg]
<div class="bb-editor">
{bbcode}
<textarea name="short_story" id="short_story" onfocus="setFieldName(this.name)" rows="8" required>{short-story}</textarea>
</div>
[/not-wysywyg]
{shortarea}
</div>

<div class="form-group textarea">
<label for="full_story">Полное описание</label>
[not-wysywyg]
<div class="bb-editor">
{bbcode}
<textarea name="full_story" id="full_story" onfocus="setFieldName(this.name)" rows="8" >{full-story}</textarea>
</div>
[/not-wysywyg]
{fullarea}
</div>
    
<div class="form-group">
<label for="alt_name">Ключевые слова</label>
<input placeholder="Вводите через запятую" type="text" name="tags" id="tags" value="{tags}" maxlength="150" autocomplete="off">
</div>
    
</div></div>

<div class="form-group">
<div class="admin_checkboxs">{admintag}</div>
</div>

[recaptcha]
<div class="form-group">
<label for="recaptcha">Защита от спама</label>
{recaptcha}
</div>
[/recaptcha]
			
<div class="form-group">
<button class="bbcodes" type="submit" name="add">Отправить</button>
<button class="bbcodes" onclick="preview()" type="submit" name="nview">Предпросмотр</button>
</div>