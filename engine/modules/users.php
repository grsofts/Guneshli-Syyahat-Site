<?php

if (!defined('DATALIFEENGINE')) {
    die("Hacking attempt!");
}

include_once ENGINE_DIR . '/classes/parse.class.php';
$parse            = new ParseFilter();
$parse->safe_mode = true;

$tpl->load_template('users_search.tpl');

$g = 0;

$_GET['count']      = intval($_GET['count']);
$_GET['order']      = addslashes($_GET['order']);
$_GET['sort']       = addslashes($_GET['sort']);
$_GET['usergroups'] = intval($_GET['usergroups']);
$_GET['login']      = addslashes($_GET['login']);

while ($g++ <= 9) {
    $u = $g * 10;
    if ($_GET['count'] != $u)
        $sel_num .= '<option value="' . $u . '">' . $u . '</option>';
    else
        $sel_num .= '<option value="' . $u . '" selected>' . $u . '</option>';
}

$tpl->set('{count}', $sel_num);

$orders = array(
    'name' => 'Логин',
    'user_group' => 'Группа',
    'reg_date' => 'Регистрация',
    'lastdate' => 'Вход',
    'news_num' => 'Новостей',
    'comm_num' => 'Комментариев'
);

foreach ($orders as $key => $value) {
    if ($_GET['order'] == $key)
        $order .= '<option value="' . $key . '" selected>' . $value . '</option>';
    else
        $order .= '<option value="' . $key . '">' . $value . '</option>';
}

$tpl->set('{order}', $order);

$sorts = array(
    'ASC' => 'По возрастанию',
    'DESC' => 'По убыванию'
);

foreach ($sorts as $key => $value) {
    if ($_GET['sort'] == $key)
        $sort .= '<option value="' . $key . '" selected>' . $value . '</option>';
    else
        $sort .= '<option value="' . $key . '">' . $value . '</option>';
}

$tpl->set('{sort}', $sort);

$usergroups = $db->query("SELECT * FROM " . USERPREFIX . "_usergroups");

while ($row = $db->get_row($usergroups)) {
    if ($_GET['usergroups'] == $row['id'])
        $group_s .= '<option value="' . $row['id'] . '" selected>' . $row['group_name'] . '</option>';
    else
        $group_s .= '<option value="' . $row['id'] . '">' . $row['group_name'] . '</option>';
}

$tpl->set('{usergroups}', $group_s);

if ($_GET['count'] != "") {
    $searchcount = intval($_GET['count']);
    $postfix .= "&count=$searchcount";
} else {
    $searchcount = 10;
}

if ($_GET['order'] != "") {
    $order_by = $_GET['order'];
    $postfix .= "&order=" . $_GET['order'];
} else
    $order_by = "user_group";

if ($_GET['sort'] != "") {
    $sort_by = $_GET['sort'];
    $postfix .= "&sort=" . $_GET['sort'];
} else {
    $sort_by = "ASC";
}

if ($_GET['usergroups'] != "" or $_GET['login'] != "")
    $where_w = "WHERE ";

if ($_GET['usergroups'] != "") {
    $where_w .= "user_group=" . $_GET['usergroups'];
    $postfix .= "&usergroups=" . $_GET['usergroups'];
}

if ($_GET['login'] != "") {
    if ($_GET['usergroups'] != "")
        $where_w .= " AND ";
    $where_w .= "name like '%" . $_GET['login'] . "%'";
    $postfix .= "&login=" . $_GET['login'];
    $login_val = $_GET['login'];
}

$tpl->set('{login}', $login_val);

$sql_count = "SELECT COUNT(*) as count FROM " . PREFIX . "_users $where_w";

$row       = $db->super_query($sql_count);
$count_all = $row['count'];

function pluralForm($count_all, $numb1, $numb2, $numb3)
{
    $count_all = abs($count_all) % 100;
    $n1        = $count_all % 10;
    if ($count_all > 10 && $count_all < 20)
        return $numb3;
    if ($n1 > 1 && $n1 < 5)
        return $numb2;
    if ($n1 == 1)
        return $numb1;
    return $numb3;
}

$tpl->set('{numbers}', pluralForm($count_all, 'Найден', 'Найдено', 'Найдено') . ' ' . $count_all . ' ' . pluralForm($count_all, 'пользователь', 'пользвателя', 'пользователей'));

$tpl->compile('content');


if (!isset($cstart) or ($cstart < 1)) {
    $cstart      = 1;
    $cstartlimit = 0;
} else {
    $cstartlimit = ($cstart - 1) * $searchcount;
}

$i = $cstartlimit;

$sql_result = $db->query("SELECT * FROM " . USERPREFIX . "_users $where_w ORDER BY $order_by $sort_by LIMIT $cstartlimit,$searchcount");

$tpl->load_template('users.tpl');

while ($row = $db->get_row($sql_result)) {
    
    if ($row['banned'] == 'yes')
        $user_group[$row['user_group']]['group_name'] = $lang['user_ban'];
    
    $i++;
    
    $tpl->set('{numb}', "$i");
    
    if ($row['allow_mail']) {
        if (!$user_group[$member_id['user_group']]['allow_feed'] AND $row['user_group'] != 1) {
            $tpl->set_block("'\\[email\\](.*?)\\[/email\\]'si", "");
            $tpl->set('{email}', "");
            $tpl->set('[not-email]', "");
            $tpl->set('[/not-email]', "");
        } else {
            $tpl->set('[email]', "");
            $tpl->set('[/email]', "");
            $tpl->set('{email}', "$PHP_SELF?do=feedback&amp;user=$row[user_id]");
            $tpl->set_block("'\\[not-email\\](.*?)\\[/not-email\\]'si", "");
        }
    } else {
        $tpl->set_block("'\\[email\\](.*?)\\[/email\\]'si", "");
        $tpl->set('{email}', "");
        $tpl->set('[not-email]', "");
        $tpl->set('[/not-email]', "");
    }
    
    if ($user_group[$member_id['user_group']]['allow_pm']) {
        $tpl->set('[pm]', "");
        $tpl->set('[/pm]', "");
        $tpl->set('{pm}', "$PHP_SELF?do=pm&amp;doaction=newpm&amp;user=" . $row['user_id']);
        $tpl->set_block("'\\[not-pm\\](.*?)\\[/not-pm\\]'si", "");
    } else {
        $tpl->set_block("'\\[pm\\](.*?)\\[/pm\\]'si", "");
        $tpl->set('{pm}', "");
        $tpl->set('[not-pm]', "");
        $tpl->set('[/not-pm]', "");
    }
    
    if (count(explode("@", $row['foto'])) == 2) {
        $tpl->set('{gravatar}', $row['foto']);
        
        $tpl->set('{foto}', 'http://www.gravatar.com/avatar/' . md5(trim($row['foto'])) . '?s=' . intval($user_group[$row['user_group']]['max_foto']));
        
    } else {
       
        if ($row['foto']) {
           
            if (strpos($row['foto'], "//") === 0)
                $avatar = "http:" . $row['foto'];
            else
                $avatar = $row['foto'];
           
            $avatar = @parse_url($avatar);
           
            if ($avatar['host']) {
               
                $tpl->set('{foto}', $row['foto']);
               
            } else
                $tpl->set('{foto}', $config['http_home_url'] . "uploads/fotos/" . $row['foto']);
           
        } else
            $tpl->set('{foto}', "{THEME}/dleimages/noavatar.png");
       
    }
    
    $tpl->set('{usertitle}', stripslashes($row['name']));
    
    if ($row['fullname']) {
        $tpl->set('[fullname]', "");
        $tpl->set('[/fullname]', "");
        $tpl->set('{fullname}', stripslashes($row['fullname']));
        $tpl->set_block("'\\[not-fullname\\](.*?)\\[/not-fullname\\]'si", "");
        
    } else {
        $tpl->set_block("'\\[fullname\\](.*?)\\[/fullname\\]'si", "");
        $tpl->set('{fullname}', "");
        $tpl->set('[not-fullname]', "");
        $tpl->set('[/not-fullname]', "");
    }
    
    if ($row['land']) {
        $tpl->set('[land]', "");
        $tpl->set('[/land]', "");
        $tpl->set('{land}', stripslashes($row['land']));
        $tpl->set_block("'\\[not-land\\](.*?)\\[/not-land\\]'si", "");
        
    } else {
        $tpl->set_block("'\\[land\\](.*?)\\[/land\\]'si", "");
        $tpl->set('{land}', "");
        $tpl->set('[not-land]', "");
        $tpl->set('[/not-land]', "");
    }
    
    if ($row['info']) {
        $tpl->set('[info]', "");
        $tpl->set('[/info]', "");
        $tpl->set('{info}', stripslashes($row['info']));
        $tpl->set_block("'\\[not-info\\](.*?)\\[/not-info\\]'si", "");
    } else {
        $tpl->set_block("'\\[info\\](.*?)\\[/info\\]'si", "");
        $tpl->set('{info}', "");
        $tpl->set('[not-info]', "");
        $tpl->set('[/not-info]', "");
    }
    
    if (($row['lastdate'] + 1200) > $_TIME) {
        
        $tpl->set('[online]', "");
        $tpl->set('[/online]', "");
        $tpl->set_block("'\\[offline\\](.*?)\\[/offline\\]'si", "");
        
    } else {
        $tpl->set('[offline]', "");
        $tpl->set('[/offline]', "");
        $tpl->set_block("'\\[online\\](.*?)\\[/online\\]'si", "");
    }
    
    $tpl->set('{status}', $user_group[$row['user_group']]['group_prefix'] . $user_group[$row['user_group']]['group_name'] . $user_group[$row['user_group']]['group_suffix']);
    $tpl->set('{registration}', langdate("j F Y H:i", $row['reg_date']));
    $tpl->set('{lastdate}', langdate("j F Y H:i", $row['lastdate']));
    
    if ($user_group[$row['user_group']]['icon'])
        $tpl->set('{group-icon}', "<img src=\"" . $user_group[$row['user_group']]['icon'] . "\" border=\"0\" />");
    else
        $tpl->set('{group-icon}', "");
    
    if ($is_logged and $user_group[$row['user_group']]['time_limit'] and ($member_id['user_id'] == $row['user_id'] or $member_id['user_group'] < 3)) {
        
        $tpl->set_block("'\\[time_limit\\](.*?)\\[/time_limit\\]'si", "\\1");
        
        if ($row['time_limit']) {
            
            $tpl->set('{time_limit}', langdate("j F Y H:i", $row['time_limit']));
            
        } else {
            
            $tpl->set('{time_limit}', $lang['no_limit']);
            
        }
        
    } else {
        
        $tpl->set_block("'\\[time_limit\\](.*?)\\[/time_limit\\]'si", "");
        
    }
    
    if ($row['comm_num']) {
        
        $tpl->set('[comm-num]', "");
        $tpl->set('[/comm-num]', "");
        $tpl->set('{comm-num}', $row['comm_num']);
        $tpl->set('{comments}', "<a href=\"$PHP_SELF?do=lastcomments&amp;userid=" . $row['user_id'] . "\">" . $lang['last_comm'] . "</a>");
        $tpl->set_block("'\\[not-comm-num\\](.*?)\\[/not-comm-num\\]'si", "");
        
    } else {
        
        $tpl->set('{comments}', $lang['last_comm']);
        $tpl->set('{comm-num}', 0);
        $tpl->set_block("'\\[comm-num\\](.*?)\\[/comm-num\\]'si", "");
        $tpl->set('[not-comm-num]', "");
        $tpl->set('[/not-comm-num]', "");
    }
    
    if ($row['news_num']) {
        
        if ($config['allow_alt_url']) {
            
            $tpl->set('{news}', "<a href=\"" . $config['http_home_url'] . "user/" . urlencode($row['name']) . "/news/" . "\">" . $lang['all_user_news'] . "</a>");
            $tpl->set('[rss]', "<a href=\"" . $config['http_home_url'] . "user/" . urlencode($row['name']) . "/rss.xml" . "\" title=\"" . $lang['rss_user'] . "\">");
            $tpl->set('[/rss]', "</a>");
            
        } else {
            
            $tpl->set('{news}', "<a href=\"" . $PHP_SELF . "?subaction=allnews&amp;user=" . urlencode($row['name']) . "\">" . $lang['all_user_news'] . "</a>");
            $tpl->set('[rss]', "<a href=\"engine/rss.php?subaction=allnews&amp;user=" . urlencode($row['name']) . "\" title=\"" . $lang['rss_user'] . "\">");
            $tpl->set('[/rss]', "</a>");
        }
        
        $tpl->set('{news-num}', $row['news_num']);
        $tpl->set('[news-num]', "");
        $tpl->set('[/news-num]', "");
        $tpl->set_block("'\\[not-news-num\\](.*?)\\[/not-news-num\\]'si", "");
        
    } else {
        
        $tpl->set('{news}', $lang['all_user_news']);
        $tpl->set_block("'\\[rss\\](.*?)\\[/rss\\]'si", "");
        $tpl->set('{news-num}', 0);
        $tpl->set_block("'\\[news-num\\](.*?)\\[/news-num\\]'si", "");
        $tpl->set('[not-news-num]', "");
        $tpl->set('[/not-news-num]', "");
    }
    
    if ($row['signature'] and $user_group[$row['user_group']]['allow_signature']) {
        
        $tpl->set_block("'\\[signature\\](.*?)\\[/signature\\]'si", "\\1");
        $tpl->set('{signature}', stripslashes($row['signature']));
        
    } else {
        
        $tpl->set_block("'\\[signature\\](.*?)\\[/signature\\]'si", "");
        $tpl->set('{signature}', "");
    }
    
    if ($config['allow_alt_url']) {
        
        $profile = $config['http_home_url'] . "user/" . urlencode($row['name']) . "/";
        
    } else {
        
        $profile = $PHP_SELF . "?subaction=userinfo&user=" . urlencode($row['name']);
        
    }
    
    $tpl->set('{profile}', $profile);
    $tpl->set('{profile_m}', "onclick=\"ShowProfile('" . urlencode($row['name']) . "', '" . $profile . "', '" . $user_group[$member_id['user_group']]['admin_editusers'] . "'); return false;\"");
    
    $xfieldsaction = "list";
    $xfieldsadd    = false;
    $xfieldsid     = $row['xfields'];
    include(ENGINE_DIR . '/inc/userfields.php');
    $tpl->set('{xfields}', $output);
    
    // Обработка дополнительных полей
    $xfieldsdata = xfieldsdataload($row['xfields']);
    
    foreach ($xfields as $value) {
        
        $preg_safe_name = preg_quote($value[0], "'");
        
        if ($value[5] != 1 OR ($is_logged AND $member_id['user_group'] == 1) OR ($is_logged AND $member_id['user_id'] == $row['user_id'])) {
            
            if (empty($xfieldsdata[$value[0]])) {
                
                $tpl->copy_template = preg_replace("'\\[xfgiven_{$preg_safe_name}\\](.*?)\\[/xfgiven_{$preg_safe_name}\\]'is", "", $tpl->copy_template);
                $tpl->copy_template = str_replace("[xfnotgiven_{$preg_safe_name}]", "", $tpl->copy_template);
                $tpl->copy_template = str_replace("[/xfnotgiven_{$preg_safe_name}]", "", $tpl->copy_template);
                
            } else {
                
                $tpl->copy_template = preg_replace("'\\[xfnotgiven_{$preg_safe_name}\\](.*?)\\[/xfnotgiven_{$preg_safe_name}\\]'is", "", $tpl->copy_template);
                $tpl->copy_template = str_replace("[xfgiven_{$preg_safe_name}]", "", $tpl->copy_template);
                $tpl->copy_template = str_replace("[/xfgiven_{$preg_safe_name}]", "", $tpl->copy_template);
                
            }
            
            $tpl->copy_template = preg_replace("'\\[xfvalue_{$preg_safe_name}\\]'i", stripslashes($xfieldsdata[$value[0]]), $tpl->copy_template);
            
        } else {
            
            $tpl->copy_template = preg_replace("'\\[xfgiven_{$preg_safe_name}\\](.*?)\\[/xfgiven_{$preg_safe_name}\\]'is", "", $tpl->copy_template);
            $tpl->copy_template = preg_replace("'\\[xfvalue_{$preg_safe_name}\\]'i", "", $tpl->copy_template);
            $tpl->copy_template = preg_replace("'\\[xfnotgiven_{$preg_safe_name}\\](.*?)\\[/xfnotgiven_{$preg_safe_name}\\]'is", "", $tpl->copy_template);
            
        }
        
    }
    // Обработка дополнительных полей
    
    $tpl->compile('content');
    
}

$tpl->clear();
$db->free($sql_result);

//####################################################################################################################
//         Навигация по пользователям
//####################################################################################################################

$number = $searchcount;

$tpl->load_template('navigation.tpl');
//----------------------------------
// Previous link
//----------------------------------
if ($cstart > 1) {
    $prev = $cstart - 1;
    
    if ($prev == 1)
        $prev_page = $PHP_SELF . "?do=users" . $postfix;
    else
        $prev_page = $PHP_SELF . "?do=users&amp;cstart=" . $prev . $postfix;
    
    $tpl->set_block("'\[prev-link\](.*?)\[/prev-link\]'si", "<a href=\"" . $prev_page . "\">\\1</a>");
    
} else {
    
    $tpl->set_block("'\[prev-link\](.*?)\[/prev-link\]'si", "<span>\\1</span>");
    $no_prev = TRUE;
    
}

//----------------------------------
// Pages
//----------------------------------

if ($number) {
    
    $enpages_count = @ceil($count_all / $number);
    $pages         = "";
    
    if ($enpages_count <= 10) {
        
        for ($j = 1; $j <= $enpages_count; $j++) {
            if ($j != $cstart) {
                
                if ($j == 1)
                    $pages .= "<a href=\"$PHP_SELF?do=users{$postfix}\">$j</a> ";
                else
                    $pages .= "<a href=\"$PHP_SELF?do=users&amp;cstart=$j{$postfix}\">$j</a> ";
                
            } else {
                $pages .= "<span>$j</span> ";
            }
        }
        
    } else {
        
        $start      = 1;
        $end        = 10;
        $nav_prefix = "<span class=\"nav_ext\">{$lang['nav_trennen']}</span>";
        
        if ($cstart > 0) {
            
            if ($cstart > 6) {
                
                $start = $cstart - 4;
                $end   = $start + 8;
                
                if ($end >= $enpages_count) {
                    $start      = $enpages_count - 9;
                    $end        = $enpages_count - 1;
                    $nav_prefix = "";
                } else
                    $nav_prefix = "<span class=\"nav_ext\">{$lang['nav_trennen']}</span>";
                
            }
            
        }
        
        if ($start >= 2) {
            $pages .= "<a href=\"$PHP_SELF?do=users{$postfix}\">1</a> <span class=\"nav_ext\">...</span> ";
        }
        
        for ($j = $start; $j <= $end; $j++) {
            
            if ($j != $cstart) {
                $pages .= "<a href=\"$PHP_SELF?do=users&amp;cstart=$j{$postfix}\">$j</a> ";
            } else {
                $pages .= "<span>$j</span> ";
            }
            
        }
        
        if ($cstart != $enpages_count) {
            $pages .= $nav_prefix . "<a href=\"$PHP_SELF?do=users&amp;cstart={$enpages_count}{$postfix}\">{$enpages_count}</a>";
        } else
            $pages .= "<span>{$enpages_count}</span>";
        
    }
    
    $tpl->set('{pages}', $pages);
    
}

//----------------------------------
// Next link
//----------------------------------
if ($number < $count_all and $i < $count_all) {
    $next_page = $cstart + 1;
    
    $next = $PHP_SELF . "?do=users&amp;cstart=" . $next_page . $postfix;
    
    $tpl->set_block("'\[next-link\](.*?)\[/next-link\]'si", "<a href=\"" . $next . "\">\\1</a>");
    
} else {
    
    $tpl->set_block("'\[next-link\](.*?)\[/next-link\]'si", "<span>\\1</span>");
    $no_next = TRUE;
    
}


if (!$no_prev or !$no_next) {
    $tpl->compile('content');
}

$tpl->clear();

?>