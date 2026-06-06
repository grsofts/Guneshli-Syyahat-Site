<h2 class="sidebar-title">{title}</h2>

[votelist]
<form method="post" name="vote">
[/votelist]

<div class="vote_list">{list}</div>

[voteresult]
<div class="vote_votes grey">Проголосовало: {votes}</div>
[/voteresult]

[votelist]
<input type="hidden" name="vote_action" value="vote">
<input type="hidden" name="vote_id" id="vote_id" value="{vote_id}">
<button class="bbcodes" type="button" onclick="doVote('vote'); return false;">Голосовать</button>
<button class="bbcodes" type="button" onclick="doVote('results'); return false;">Результаты</button>
</form>
[/votelist]
