<div class="row">
<div class="col-12">
<div class="blog-single-main">

<div class="main-image"><img src="{image-1}" alt="{title}"></div>

<div class="blog-detail">

<ul class="news-meta">
<li><i class="fa fa-calendar"></i>{date=d-M-Y, H:i}</li>
<li><i class="fa fa-user"></i>{login}</li>
<li><i class="fa fa-eye"></i>{views}</li>
<li><i class="fa fa-comments"></i>{comments-num}</li>
[group=1]<li[desktop] class="pull-right"[/desktop]><a href="/admin.php?mod=editnews&amp;action=editnews&amp;id={news-id}" style="color:#179e66" target="_blank"><i class="fa fa-pencil"></i>Редактор</a></li>[/group]
</ul>
    
<h1 class="blog-title">{title}</h1>

<div class="blog-space">{full-story}</div>

</div></div></div></div>

<hr><div class="zgdh-title">Другие новости</div>
<div class="row">
{custom category="{category-id}" template="relatednews" aviable="global" from="0" limit="6" order="rand"}
</div>

<br><div class="zgdh-title">Комментарии ({comments-num})</div><br>
{comments}<br>

<div class="row">
<div class="col-12">
<div class="blog-comments-form">
<div class="bottom-title"><h2>Оставить комментарий</h2></div>
{addcomments}
</div></div></div>	