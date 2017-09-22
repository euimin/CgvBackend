<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
<META HTTP-EQUIV="IMAGETOOLBAR" CONTENT="no">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<meta name="keywords" content="">
<link type="text/css" rel="stylesheet" href="/30/cssX/main.css">
<link type="text/css" rel="stylesheet"
	href="/30/B201/ko/cssX/template.css">
<link type="text/css" rel="stylesheet" href="/sescrow/css/sescrow.css">


<script type="text/javascript" charset="utf-8" src="/e/js/prototype.js"></script>
<script type="text/javascript" charset="utf-8" src="/30/js/checkForm.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/30/js/common_util.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/30/js/common_multibbs.js"></script>

<script type="text/javascript" charset="utf-8" src="/e/js/locale_ko.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/sescrow/js/sescrow.js"></script>
<script type="text/javascript" charset="utf-8" src="/ttalk/ttalk.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/30/js/ajax/scriptaculous.js"></script>

<title>:: 앨범형 게시판</title>
<!-- { include!! -->


<!--[if IE]>
<style type="text/css">/* fixing IE 5.x win */
.subMenu LI {
padding:0;
margin:0px;
white-space:nowrap;
display:inline;
zoom:1;
vertical-align:top;
height:22px;
}
</style>
<![endif]-->
<script>
<!--
	var _maxWidth = 600;
	var _maxBlogWidth = 580;
	var j_PointLevel = new Array(8);
	j_PointLevel[0] = Array("70", "");
	j_PointLevel[1] = Array("60", "");
	j_PointLevel[2] = Array("50", "");
	j_PointLevel[3] = Array("40", "");
	j_PointLevel[4] = Array("30", "");
	j_PointLevel[5] = Array("20", "");
	j_PointLevel[6] = Array("10", "");
	j_PointLevel[7] = Array("0", "");
	if (tnaruconfig.showSubG1.width == 0) {
		tnaruconfig.showSubG1.leftmargin = 0;
		tnaruconfig.showSubG1.width = 800;
		tnaruconfig.showSubG1.topmargin = -5;
		tnaruconfig.showSubG1.align = null;
	}
//-->
</script>
<script>
	var opts = new Array();
</script>
<!-- include!! } -->

<script type="text/javascript">
<!--
	var j_TBL = 'board';
	var j_BCODE = '2';
	var j_BUFF = '1';
	var j_FOLDERNAME = "앨범형 게시판";
	var j_MENUNAME = "게시판";
	var j_TCODE = 'B201';
	var tcode = 'B201';

	var VARLIST = new Array();
	var VARTLIST = new Array();

	DVISIT = "2";
	VARLIST[0] = "DVISIT";
	TVISIT = "16750";
	VARLIST[1] = "TVISIT";
	LOGOIMG_STR = "<img style=\"cursor:pointer;\" onclick=\"goUrl(\'/web/index\');\" src=\"/files/logo/thumb/%ED%81%AC%EA%B8%B0%EB%B3%80%ED%99%98_%ED%99%A9%EC%83%89%EB%B2%A0%EB%84%88%EC%A0%84%ED%99%94%EB%B2%88%ED%98%B8.jpg\" border=\"0\" width=\"190\" height=\"50\"\>";
	VARLIST[2] = "LOGOIMG_STR";
	LOGOIMGB_STR = "<a href=\"//www.tnaru.com/hub4/\" target=\"_blank\"\><img src=\"/30/B201/ko/imgX/common/img_ad.gif\" alt=\"\" border=\"0\" style=\"z-index:0;\"\></a\>";
	VARLIST[3] = "LOGOIMGB_STR";
	TMENU_STR = "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" id=\"topmenu\"\>\r\n<tr\>\r\n<td height=\"34\" id=\'main\' class=\"tMenu01offBox\" onmouseover=\"showSubG1(\'main\',0,800,-5);\" onmouseout=\"clearSub(\'main_sub\');\"\>\r\n<span onclick=\"goUrl(\'/web/index\',0);\" class=\"tMenu01off ellipsis\"\>Home</span\>\r\n<div id=\"main_sub\" class=\"subMenuEmpty\"\></div\>\r\n</td\>\r\n<td height=\"34\" id=\'intro\' class=\"tMenu01offBox\" onmouseover=\"showSubG1(\'intro\',0,800,-5);\" onmouseout=\"clearSub(\'intro_sub\');\"\>\r\n<span onclick=\"goUrl(\'/web/board/board_top?tbl=intro\',0);\" class=\"tMenu01off ellipsis\"\>회사소개</span\>\r\n<div id=\"intro_sub\" class=\"subMenu\"\>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"subMenuTable\"\>\r\n<tr valign=\"bottom\"\>\r\n<td colspan=\"3\" height=\"5\"\><img src=\"/30/imgX/ko/common/img_space.gif\" width=\"1\" height=\"1\" alt=\"\"\></td\>\r\n</tr\>\r\n<tr valign=\"bottom\"\>\r\n<td width=\"17\" height=\"100%\"\><img width=\"17\" height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_left_01.gif\"\></td\>\r\n<td valign=\"middle\" align=\"center\" nowrap id=\"intro_td\" style=\"padding:2px 4px 0px 4px;\" class=\"subMenuBox\"\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=intro&bcode=5&buff=a\" class=\"subMenu01_on\"\><span class=\"subtext\"\>회사소개</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=intro&bcode=3&buff=0\" class=\"subMenu01_on\"\><span class=\"subtext\"\>보도자료</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=intro&bcode=4&buff=4\" class=\"subMenu01_on\"\><span class=\"subtext\"\>행사일정</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=intro&bcode=6&buff=b\" class=\"subMenu01_on\"\><span class=\"subtext\"\>오시는길</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=intro&bcode=1&buff=c\" class=\"subMenu01_on\"\><span class=\"subtext\"\>CEO인사말</span\></a\>\r\n</nobr\>\r\n</td\>\r\n<td height=\"100%\"\><img height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_right_01.gif\"\></td\>\r\n</tr\>\r\n</table\>\r\n</div\>\r\n</td\>\r\n<td height=\"34\" id=\'notievent\' class=\"tMenu01offBox\" onmouseover=\"showSubG1(\'notievent\',0,800,-5);\" onmouseout=\"clearSub(\'notievent_sub\');\"\>\r\n<span onclick=\"goUrl(\'/web/board/board_top?tbl=notievent\',0);\" class=\"tMenu01off ellipsis\"\>공지/뉴스</span\>\r\n<div id=\"notievent_sub\" class=\"subMenu\"\>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"subMenuTable\"\>\r\n<tr valign=\"bottom\"\>\r\n<td colspan=\"3\" height=\"5\"\><img src=\"/30/imgX/ko/common/img_space.gif\" width=\"1\" height=\"1\" alt=\"\"\></td\>\r\n</tr\>\r\n<tr valign=\"bottom\"\>\r\n<td width=\"17\" height=\"100%\"\><img width=\"17\" height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_left_01.gif\"\></td\>\r\n<td valign=\"middle\" align=\"center\" nowrap id=\"notievent_td\" style=\"padding:2px 4px 0px 4px;\" class=\"subMenuBox\"\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=notievent&bcode=1&buff=9\" class=\"subMenu01_on\"\><span class=\"subtext\"\>공지/뉴스</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=notievent&bcode=2&buff=0\" class=\"subMenu01_on\"\><span class=\"subtext\"\>이벤트</span\></a\>\r\n</nobr\>\r\n</td\>\r\n<td height=\"100%\"\><img height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_right_01.gif\"\></td\>\r\n</tr\>\r\n</table\>\r\n</div\>\r\n</td\>\r\n<td height=\"34\" id=\'board\' class=\"tMenu01onBox\" onmouseover=\"showSubG1(\'board\',0,800,-5);\" onmouseout=\"clearSub(\'board_sub\');\"\>\r\n<span onclick=\"goUrl(\'/web/board/board_top?tbl=board\',0);\" class=\"tMenu01on ellipsis\"\>게시판</span\>\r\n<div id=\"board_sub\" class=\"subMenu\"\>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"subMenuTable\"\>\r\n<tr valign=\"bottom\"\>\r\n<td colspan=\"3\" height=\"5\"\><img src=\"/30/imgX/ko/common/img_space.gif\" width=\"1\" height=\"1\" alt=\"\"\></td\>\r\n</tr\>\r\n<tr valign=\"bottom\"\>\r\n<td width=\"17\" height=\"100%\"\><img width=\"17\" height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_left_01.gif\"\></td\>\r\n<td valign=\"middle\" align=\"center\" nowrap id=\"board_td\" style=\"padding:2px 4px 0px 4px;\" class=\"subMenuBox\"\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=1&buff=0\" class=\"subMenu01_on\"\><span class=\"subtext\"\>일반형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=2&buff=1\" class=\"subMenu01_on\"\><span class=\"subtext\"\>앨범형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=4&buff=2\" class=\"subMenu01_on\"\><span class=\"subtext\"\>프로필형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=9&buff=3\" class=\"subMenu01_on\"\><span class=\"subtext\"\>방명록형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=10&buff=4\" class=\"subMenu01_on\"\><span class=\"subtext\"\>캘린더형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=3&buff=5\" class=\"subMenu01_on\"\><span class=\"subtext\"\>블로그형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=6&buff=6\" class=\"subMenu01_on\"\><span class=\"subtext\"\>자료실형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=7&buff=7\" class=\"subMenu01_on\"\><span class=\"subtext\"\>QnA형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=8&buff=8\" class=\"subMenu01_on\"\><span class=\"subtext\"\>1&#58;1QnA형 게시판</span\></a\>\r\n</nobr\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=board&bcode=5&buff=9\" class=\"subMenu01_on\"\><span class=\"subtext\"\>프로필+인덱스형 게시판</span\></a\>\r\n</nobr\>\r\n</td\>\r\n<td height=\"100%\"\><img height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_right_01.gif\"\></td\>\r\n</tr\>\r\n</table\>\r\n</div\>\r\n</td\>\r\n<td height=\"34\" id=\'product\' class=\"tMenu01offBox\" onmouseover=\"showSubG1(\'product\',0,800,-5);\" onmouseout=\"clearSub(\'product_sub\');\"\>\r\n<span onclick=\"goUrl(\'/web/board/board_top?tbl=product\',0);\" class=\"tMenu01off ellipsis\"\>겔러리</span\>\r\n<div id=\"product_sub\" class=\"subMenu\"\>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"subMenuTable\"\>\r\n<tr valign=\"bottom\"\>\r\n<td colspan=\"3\" height=\"5\"\><img src=\"/30/imgX/ko/common/img_space.gif\" width=\"1\" height=\"1\" alt=\"\"\></td\>\r\n</tr\>\r\n<tr valign=\"bottom\"\>\r\n<td width=\"17\" height=\"100%\"\><img width=\"17\" height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_left_01.gif\"\></td\>\r\n<td valign=\"middle\" align=\"center\" nowrap id=\"product_td\" style=\"padding:2px 4px 0px 4px;\" class=\"subMenuBox\"\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=product&bcode=2&buff=1\" class=\"subMenu01_on\"\><span class=\"subtext\"\>겔러리</span\></a\>\r\n</nobr\>\r\n</td\>\r\n<td height=\"100%\"\><img height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_right_01.gif\"\></td\>\r\n</tr\>\r\n</table\>\r\n</div\>\r\n</td\>\r\n<td height=\"34\" id=\'cscenter\' class=\"tMenu01offBox\" onmouseover=\"showSubG1(\'cscenter\',0,800,-5);\" onmouseout=\"clearSub(\'cscenter_sub\');\"\>\r\n<span onclick=\"goUrl(\'/web/board/board_top?tbl=cscenter\',0);\" class=\"tMenu01off ellipsis\"\>고객센터</span\>\r\n<div id=\"cscenter_sub\" class=\"subMenu\"\>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"subMenuTable\"\>\r\n<tr valign=\"bottom\"\>\r\n<td colspan=\"3\" height=\"5\"\><img src=\"/30/imgX/ko/common/img_space.gif\" width=\"1\" height=\"1\" alt=\"\"\></td\>\r\n</tr\>\r\n<tr valign=\"bottom\"\>\r\n<td width=\"17\" height=\"100%\"\><img width=\"17\" height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_left_01.gif\"\></td\>\r\n<td valign=\"middle\" align=\"center\" nowrap id=\"cscenter_td\" style=\"padding:2px 4px 0px 4px;\" class=\"subMenuBox\"\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=cscenter&bcode=1&buff=7\" class=\"subMenu01_on\"\><span class=\"subtext\"\>Q&A</span\></a\>\r\n</nobr\>\r\n</td\>\r\n<td height=\"100%\"\><img height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_right_01.gif\"\></td\>\r\n</tr\>\r\n</table\>\r\n</div\>\r\n</td\>\r\n<td height=\"34\" id=\'mc01\' class=\"tMenu01offBox\" onmouseover=\"showSubG1(\'mc01\',0,800,-5);\" onmouseout=\"clearSub(\'mc01_sub\');\"\>\r\n<span onclick=\"goUrl(\'/web/board/board_top?tbl=mc01\',0);\" class=\"tMenu01off ellipsis\"\>추가메뉴1</span\>\r\n<div id=\"mc01_sub\" class=\"subMenu\"\>\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"subMenuTable\"\>\r\n<tr valign=\"bottom\"\>\r\n<td colspan=\"3\" height=\"5\"\><img src=\"/30/imgX/ko/common/img_space.gif\" width=\"1\" height=\"1\" alt=\"\"\></td\>\r\n</tr\>\r\n<tr valign=\"bottom\"\>\r\n<td width=\"17\" height=\"100%\"\><img width=\"17\" height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_left_01.gif\"\></td\>\r\n<td valign=\"middle\" align=\"center\" nowrap id=\"mc01_td\" style=\"padding:2px 4px 0px 4px;\" class=\"subMenuBox\"\>\r\n<nobr\>\r\n<a href=\"/web/board/board_list?tbl=mc01&bcode=1&buff=7\" class=\"subMenu01_on\"\><span class=\"subtext\"\>Q&A</span\></a\>\r\n</nobr\>\r\n</td\>\r\n<td height=\"100%\"\><img height=\"100%\" src=\"/30/B201/ko/imgX/common/tm_box_right_01.gif\"\></td\>\r\n</tr\>\r\n</table\>\r\n</div\>\r\n</td\>\r\n</tr\>\r\n</table\>";
	VARLIST[4] = "TMENU_STR";
	CPR_STR = "\t<style\>P {margin-top:0px;margin-bottom:0px;}</style\>\r\n\t<span id=\"CPR_STR\"\><span\>since2010<br /\>\r\nhttp//wowchicken.com<br /\>\r\ntel: 02-2282-5777/ e-mail:</span\> <span onclick=\"javascript:getSiteMailtoAdmindiv(event);\" style=\"cursor: pointer;\"\><a href=\"mailto:chonamjong@naver.com\"\>chonamjong@naver.com</a\></span\></span\>\r\n\r\n<div id=\"CPREDITBTN\" style=\"display: block;\"\><img alt=\"edit\" border=\"0\" height=\"11\" src=\"http://chonamjong.tnaru.net/30/B201/ko/imgX/buttons/common/b_edit.gif\" style=\"margin-bottom: 3px;\" width=\"32\" /\></div\>\r\n\r\n";
	VARLIST[5] = "CPR_STR";
	FOLDERNAME_STR = "앨범형 게시판";
	VARLIST[6] = "FOLDERNAME_STR";
	MENUNAME = "게시판";
	VARLIST[7] = "MENUNAME";
	BANNER1BOX = "";
	VARLIST[8] = "BANNER1BOX";
	PAGEL_STR = "<a href=\"javascript:goPage(1);\" class=\"pageon\"\><b\>1</b\></a\></a\>";
	VARLIST[9] = "PAGEL_STR";
	LMENU_STR = "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=1&buff=0\" class=\"lMenu01_off\"\"\>일반형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\><img src=\"/30/B201/ko/imgX/common/bu_arrow_02.gif\" alt=\"\" class=\"bullet04\"\></td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=2&buff=1\" class=\"lMenu01_on\"\"\>앨범형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=4&buff=2\" class=\"lMenu01_off\"\"\>프로필형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=9&buff=3\" class=\"lMenu01_off\"\"\>방명록형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=10&buff=4\" class=\"lMenu01_off\"\"\>캘린더형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=3&buff=5\" class=\"lMenu01_off\"\"\>블로그형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=6&buff=6\" class=\"lMenu01_off\"\"\>자료실형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=7&buff=7\" class=\"lMenu01_off\"\"\>QnA형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=8&buff=8\" class=\"lMenu01_off\"\"\>1&#58;1QnA형 게시판</a\></td\></tr\><tr\><td colspan=\"3\" class=\"lmLine\"\></td\></tr\><tr\><td class=\"lmLeftPad\"\>&nbsp;</td\><td class=\"lmLeftBul\"\>&nbsp;</td\><td class=\"lmLeftCon\"\><a href=\"/web/board/board_list?tbl=board&bcode=5&buff=9\" class=\"lMenu01_off\"\"\>프로필+인덱스형 게시판</a\></td\></tr\></table\>";
	VARLIST[10] = "LMENU_STR";

	BLIST_STR = " <tr valign=\"top\"\><td style=\"width: 100%\"\><div class=\"albumgallery_each_width\" style=\"display: inline-block;\"\><div class=\"thumbAlbumGallery\" onclick=\"location.href=\'/web/board/board_read?tbl=board&key=4&page=1&bcode=2&buff=1&bt=1&pbcode=2&ilistcnt=15\';\" style=\"display: inline-block;position: relative;overflow: hidden;cursor: pointer;\"\><img src=\'/files/mc/board/0/4/thumb/2.jpg\' alt=\'\' border=\'0\' style=\"position: absolute;\" onload=\"checkthumimg(this);\"\></div\><div align=\"left\" style=\"padding:8 1 0 3;\"\><input name=\"checkbox\" type=\"checkbox\" value=\'4\' style=\"margin: 0 0 -1 -3;display:none\" id=\"delList0\" value=\"4\"\><span class=\"number_dark\"\>1.&nbsp;</span\><a href=\"/web/board/board_read?tbl=board&key=4&page=1&bcode=2&buff=1&bt=1&pbcode=2&ilistcnt=15\" class=\"subject\"\>앨범형 게시판입</a\><div align=\"left\" style=\"padding:4 0 0 0;\"\><span class=\'pfdiv_login \'\><img class=\'pfimg_login\' src=\'/pfimg/Tnaru_Guide/pfimg\' onload=\"checkpfimg(this,\'Tnaru_Guide\');\"\></span\><span class=\"idname clickable\" onclick=\"se_seease(event,\'Tnaru_Guide\');\"\>Tnaru_Guide</span\><br\><span class=\"date mopt3_wdate\"\>2008-02-28</span\><span class=\"number mopt3_views\"\><span class=\"fo11line\"\>ㅣ</span\>102</span\></div\></div\></div\></td\></tr\>";
	VARTLIST[0] = "BLIST_STR";
	MOVESELECT = " ";
	VARTLIST[1] = "MOVESELECT";
//-->
</script>
<style>
.mopt3_wdate {
	display: table-cell;
}

.mopt3_views {
	display: table-cell;
}
</style>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-34999833-1' ]);
	_gaq.push([ '_setDomainName', 'none' ]);
	_gaq.push([ '_setAllowLinker', true ]);
	_gaq.push([ '_trackPageview' ]);
	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
</head>
<body marginheight="0" marginwidth="0" topmargin="0" leftmargin="0"
	rightmargin="0" id="BOARD_LIST">
	<div id="wrap">
		<!-- { top start -->
		<div
			style="position: absolute; top: 0px; left: 420px; width: 520px; height: 20px; z-index: 0; text-align: right;">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="right" id="qmenu"><span id="LOGOUTBTN"
						style="display: none;"><a href="/web/transparent/logout"><img
								src="/30/B201/ko/imgX/buttons/common/b_logout2.gif" alt=""
								border="0"></a></span><span id="MAILBTN" style="display: none;"><a
							href="#" id="MAILBTNLN"><img
								src="/30/B201/ko/imgX/buttons/common/b_mail.gif" alt=""
								border="0"></a></span><span id="WHDBTN" style="display: none;"><a
							href="#" id="WHDBTNLN"><img
								src="/30/B201/ko/imgX/buttons/common/b_whd.gif" alt=""
								border="0"></a></span><span id="SITEMAPBTN"><a
							href="/web/sitemap"><img
								src="/30/B201/ko/imgX/buttons/common/b_sitemap.gif" border="0"
								alt=""></a></span><span id="MYINFOBTN" style="display: none;"><a
							id="MYINFOBTNLN"
							<a id="MYINFOBTNLN" href="#"><img src="/30/B201/ko/imgX/buttons/common/b_myinfo.gif"  border="0" alt=""></a></span><span
						id="TOPTSEARCHBTN"><img
							src="/30/B201/ko/imgX/buttons/common/b_tsearch.gif" border="0"
							alt=""></span></td>
				</tr>
			</table>
		</div>

		<!-- { top start -->
		<table width="891" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="200" nowrap rowspan="2" valign="top"
					style="padding: 11px 0px 0px 25px;"><div id="LOGOIMG_STR"></div>
					<a href="#" id="LOGOEDITLN"><img
						src="/30/B201/ko/imgX/buttons/common/b_edit.gif" id="LOGOEDITBTN"></a></td>
				<td height="48" valign="top">
					<div id="LOGIN_AREA1" style="display: none;">
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="91" height="17"
									style="background: url(/30/B201/ko/imgX/common/bg_id.gif) left no-repeat;"><input
									type="text" name="id" id="LOGIN_ID" class="idbox"></td>
								<td width="2"><img
									src="/30/B201/ko/imgX/common/img_space.gif" width="1"
									height="1" alt=""></td>
								<td width="91"
									style="background: url(/30/B201/ko/imgX/common/bg_pw.gif) left no-repeat;"><input
									type="password" name="pwd" id="LOGIN_PWD" class="pwbox"></td>
								<td width="3"><img
									src="/30/B201/ko/imgX/common/img_space.gif" width="1"
									height="1" alt=""></td>
								<td width="38"><img
									src="/30/B201/ko/imgX/buttons/common/b_login.gif" alt="로그인"
									border="0" id="LOGINBTN"></td>
								<td width="3"><img
									src="/30/B201/ko/imgX/common/img_space.gif" width="1"
									height="1" alt=""></td>
								<td width="53" id="JOINBTN" style="display: none;"><a
									href="/web/minim/member_top"><img
										src="/30/B201/ko/imgX/buttons/common/b_member.gif" alt="회원가입"
										border="0"></a></td>
								<td width="14"><img
									src="/30/B201/ko/imgX/common/img_space.gif" width="1"
									height="1" alt=""></td>
								<td><a href="#" id="FINDIDLN"><img
										src="/30/B201/ko/imgX/buttons/common/b_findid.gif" alt=""
										border="0"></a><img
									src="/30/B201/ko/imgX/common/img_findidpwline.gif" alt=""
									border="0"><a href="#" id="FINDPWLN"><img
										src="/30/B201/ko/imgX/buttons/common/b_findpw.gif" alt=""
										border="0"></a></td>
							</tr>
						</table>
					</div>
					<div id="LOGIN_AREA2" style="display: none;">
						<span id="LOGININFO">* <span id="MYPOINTICON"><a
								href="#" id="MYPOINTICONLN"><img
									src="/30/imgX/ko/common/img_space.gif" alt="" border="0"
									id="MYPOINTICONIMG" width="14" height="13"></a></span><span
							class="pfdiv_login"><img src="/pfimg//pfimg"
								class="pfimg_login" onload="checkpfimg(this);"></span><span
							id="MYID"></span>&nbsp;(<span id="MYGRADE"></span>) : <a href="#"
							id="MYPOINTLN"><span id="MYPOINT"></span></a>&nbsp;&nbsp;&nbsp;
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<td valign="top" colspan="2">
					<div id="TMENU_STR"
						style="width: 701px; height: 79px; vertical-align: top;"></div>
				</td>
			</tr>
		</table>
		<!-- top finish } -->
		<!-- { middle start -->
		<div
			style="width: 891px; margin-left: 26px; background: url(/30/B201/ko/imgX/common/bg_middle.jpg); background-repeat: repeat-y;">
			<table width="100%" cellpadding="0" cellspacing="0" border="0"
				style="background: url(/30/B201/ko/imgX/common/bg_top.jpg) no-repeat top left;">
				<tr>
					<td width="183" height="100%" valign="top">
						<!-- { left start -->
						<table width="171" height="100%" cellpadding="0" cellspacing="0"
							border="0" id="LMENU">
							<tr>
								<td height="16"></td>
							</tr>
							<tr>
								<td width="171" valign="top">
									<table width="152" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td height="55" align="center" valign="top"
												class="lMenuTitle01"><span id="MENUNAME"></span></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="171" height="100%" valign="top">
									<table width="146" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="146">
												<div id="LMENU_STR"></div>
											</td>
										</tr>
										<tr>
											<td height="16"></td>
										</tr>
									</table>
									<div id="BOARDEDIT">
										<a href="#" id="BOARDEDITLN"><img
											src="/30/B201/ko/imgX/buttons/common/b_menu_manage.gif"
											border="0"></a>
									</div>
								</td>
							</tr>
							<tr>
								<td valign="bottom" colspan="2">
									<div id="BANNER1BOX"></div>
									<div id="BN1EDITBTN" style="display: none;">
										<a href="#" id="BN1EDITLN"><img
											src="/30/B201/ko/imgX/buttons/common/b_edit.gif" border="0"></a>
									</div>
								</td>
							</tr>
						</table> <!-- left finish } -->
					</td>
					<td width="5" valign="top"><img
						src="/30/B201/ko/imgX/common/img_space.gif" alt="" border="0"></td>
					<td width="704 " valign="top">
						<div id="SUBIMGDIV" style="margin-left: 29px; margin-top: 15px;">
							<table width="637" cellpadding="0" cellspacing="0" border="0"
								class="subimgBorder01">
								<tr>
									<td id="SUBIMG"><IMG
										src="/30/imgX/ko/common/img_space.gif" width="637"
										height="100" border="0" id="SUBIMGSRC"></td>
								</tr>
							</table>
						</div> <!-- { right content area start -->
						<table width="637" cellpadding="0" cellspacing="0" border="0"
							style="margin-top: 5px;">
							<tr>
								<td height="100%">
									<div id="viewAreaBox" style="width: 100%; min-height: 512px;">
										<table cellpadding="0" cellspacing="0" border="0"
											class="topbox">
											<tr>
												<td height="45" valign="top" class="subtitle subtitleText"><span
													id="FOLDERNAME_STR"></span></td>
											</tr>
										</table>
										<table cellpadding="0" cellspacing="0" border="0"
											class="topbox">
											<tr>
												<td class="topline"></td>
											</tr>
										</table>
										<table height="100%" cellpadding="0" cellspacing="0"
											border="0" class="topbox">
											<tr>
												<td class="topspace01"></td>
											</tr>
											<tr>
												<td height="400" valign="top">
													<!-- content start --> <!-- start -->
													<table border="0" cellpadding="0" cellspacing="0"
														class="box_listnumber conbox">
														<tr valign="top">
															<td class="bul_listnumber">화면의 게시물 수</td>
															<td><select id="LISTCNT">
																	<option value="1">1</option>
																	<option value="6">6</option>
																	<option value="9">9</option>
																	<option value="12">12</option>
																	<option value="15">15</option>
																	<option value="30">30</option>
															</select> <select id="LISTTYPE" style="margin-left: 1px;">
																	<option value='0'>리스트 형식으로 보기</option>
																	<option value='1'>갤러리 형식으로 보기</option>
																	<option value='2'>갤러리+레이어뷰어 형식으로 보기</option>
															</select></td>
														</tr>
													</table>
													<table border="0" cellspacing="0" cellpadding="0"
														class="albumgallery_top_space conbox">
														<tr>
															<td></td>
														</tr>
													</table> <!-- <table border="0" cellspacing="0" cellpadding="0" class="conbox">
										  <tr>
											  <td class="list_bottom_line"></td>
											</tr>
											<tr>
											  <td class="albumgallery_top_line"></td>
											</tr>
										  </table>--> <!-- list start -->
													<table border="0" cellpadding="0" cellspacing="0"
														class="conbox">
														<TBODY id="NOTILIST_STR">
														</TBODY>
														<TBODY id="BLIST_STR">
														</TBODY>
													</table> <!-- list end -->
													<table border="0" cellspacing="0" cellpadding="0"
														class="conbox">
														<tr>
															<td class="list_bottom_line"></td>
														</tr>
													</table> <!-- page&btn start -->
													<table border="0" cellspacing="0" cellpadding="0"
														class="box_pagenbtn conbox">
														<tr valign="top">
															<td width="20%">&nbsp;</td>
															<td align="center">
																<table border="0" cellspacing="0" cellpadding="0"
																	style="margin-top: 4px;">
																	<tr>
																		<td><a href="#" id="PREV01LN"><img
																				src="/30/B201/ko/imgX/template/btn/btn_page_first_01.gif"
																				style="margin: 2px 5px 4px 0px; vertical-align: middle;"></a></td>
																		<td nowrap="nowrap" class="pageoff"><a href="#"
																			class="pageoff" id="PREV02LN"><img
																				src="/30/B201/ko/imgX/template/btn/btn_page_before_01.gif"
																				style="margin: 0px 2px 3px 4px; vertical-align: middle;">이전</a><span
																			class="fo12line">ㅣ</span></td>
																		<td><span id="PAGEL_STR"></span></td>
																		<td nowrap="nowrap" style="padding-left: 2px;"
																			class="pageoff"><span class="fo12line">ㅣ</span><a
																			href="#" class="pageoff" id="NEXT02LN">다음<img
																				src="/30/B201/ko/imgX/template/btn/btn_page_next_01.gif"
																				style="margin: 0px 4px 2px 2px; vertical-align: middle;"></a></td>
																		<td><a href="#" id="NEXT01LN"><img
																				src="/30/B201/ko/imgX/template/btn/btn_page_end_01.gif"
																				style="margin: 2px 0px 3px 5px; vertical-align: middle;"></a></td>
																	</tr>
																</table>
															</td>
															<td align="right" width="20%"><span id="WRITEBTN"><a
																	href="#" id="WRITEBTNLN" style="display: none;"><img
																		src="/30/B201/ko/imgX/template/btn/btn_write_01.gif"
																		alt="글쓰기" align="absmiddle"></a></span><a href="#"
																id="REQDESIGNBTNLN" style="display: none;"><img
																	src="/30/B201/ko/imgX/template/btn/btn_design_order_01.gif"
																	alt="디자인요청" align="absmiddle"
																	style="margin-left: 5px; display: none;"></a></td>
														</tr>
													</table> <!-- page&btn end --> <!-- search start -->
													<div align="center">
														<table border="0" cellspacing="0" cellpadding="0"
															class="box_search">
															<tr>
																<td style="padding-right: 5px;"><select
																	name="BS_WHAT" id="BS_WHAT">
																		<option value="title">제목</option>
																		<option value="name">글쓴이</option>
																		<option value="cmtname">리플쓴이(베타)</option>
																		<option value="name_cmtname">글쓴이+리플쓴이(베타)</option>
																		<option value="content">내용+리플(베타)</option>
																</select></td>
																<td width="23" height="26"><img
																	src="/30/B201/ko/imgX/template/image/search_left_01.gif"></td>
																<td
																	background="/30/B201/ko/imgX/template/image/search_center_bg_01.gif"><input
																	type="text" id="BS_KEYWORD" class="input_searchon"
																	style="background: url(/30/B201/ko/imgX/template/image/text_search_01.gif) no-repeat 1 5;"
																	onFocus="this.style.backgroundImage='';" value=""></td>
																<td width="6"><img
																	src="/30/B201/ko/imgX/template/image/search_right_01.gif"></td>
																<td><a href="#"><img
																		src="/30/B201/ko/imgX/template/btn/btn_search_01.gif"
																		id="BS_SEARCHBTNIMG" alt="검색"
																		style="margin-left: 5px;"></a></td>
															</tr>
														</table>
													</div> <!-- search end --> <!-- adminmenu start -->
													<div id="MEMBERMENU" style="display: none;">
														<table border="0" cellspacing="0" cellpadding="0"
															class="box_admin conbox">
															<tr valign="top">
																<td></td>
															</tr>
														</table>
														<table border="0" cellspacing="0" cellpadding="0"
															class="conbox">
															<tr valign="top">
																<td><a href="#" id="DELBTNLN"
																	style="display: none;"><img
																		src="/30/B201/ko/imgX/template/btn/btn_del_01.gif"
																		alt="Delete" align="absmiddle" id="DELBTN"
																		style="margin-right: 1px;"></a> <span id="MOVEBTN"
																	style="display: none; margin-left: 20px;"><select
																		id="MOVESELECT" style="width: 140px;">
																			<option value="0">이동할 메뉴 선택</option>
																	</select> <a href="#" id="MOVEBTNLN"><img
																			src="/30/B201/ko/imgX/template/btn/btn_move_01.gif"
																			alt="이동" align="absmiddle" style="margin-left: 1px;"></a></span></td>
																<td align="right"><div id="BLADMINBTN"
																		style="display: none;">
																		<a href="#" id="U2TBTNLN"><img
																			src="/30/B201/ko/imgX/template/btn/btn_wellup_01.gif"
																			alt="맨위" align="absmiddle" id="U2TBTNIMG"></a><a
																			href="#" id="F2TBTNLN"><img
																			src="/30/B201/ko/imgX/template/btn/btn_always_view_01.gif"
																			alt="가져오기항상보임" align="absmiddle"
																			style="margin-left: 3px;" id="F2TBTNIMG"></a><a
																			href="#" id="RESORTBTNLN"><img
																			src="/30/B201/ko/imgX/template/btn/btn_arrangement_01.gif"
																			alt="자동정리" align="absmiddle"
																			style="margin-left: 3px;" id="RESORTBTNIMG"></a><a
																			href="#" id="CSVBTNLN"><img
																			src="/30/B201/ko/imgX/template/btn/btn_csv_01.gif"
																			alt="csv" align="absmiddle" style="margin-left: 3px;"></a>
																	</div></td>
															</tr>
														</table>
													</div> <!-- adminmenu  end -->

													<div id="tad_468x60"
														style="display: none; margin: 10px 0px 5px 0px;"></div> <!-- end -->
													<!-- content end -->
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</table> <!-- right content area finish } -->
					</td>
					<td valign="top">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td height="6"></td>
							</tr>
							<tr>
								<td height="1" class="solidLineBg02"><img
									src="/imgX/common/img_space.gif" width="1" height="1" alt=""></td>
							</tr>
						</table>
					</td>
					<td valign="top"></td>
				</tr>
				<tr>
					<td colspan="3"><img
						src="/30/B201/ko/imgX/common/bg_bottom.jpg" border="0"></td>
				</tr>
			</table>
		</div>
		<!-- middle finish } -->


		<!-- content finish } -->



	</div>

	<!-- {bottom start -->
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="164" height="84" valign="bottom" align="right"><img
				src="/30/B201/ko/imgX/common/img_copryright_1.gif" border="0"></td>
			<td width="728" valign="bottom" align="right"><img
				src="/30/B201/ko/imgX/common/img_copryright_1.gif" border="0"></td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<div id="wrap2">
		<div style="width: 1030; margin: 0 auto; position: relative;">
			<table width="1030" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="165" align="right" height="84"><div
							id="LOGOIMGB_STR"></div></td>
					<td width="30"></td>
					<td width="445"><span id="CPR_STR"></span>
					<div id="CPREDITBTN">
							<a href="#" id="CPREDITLN"><img
								src="/30/B201/ko/imgX/buttons/common/b_edit.gif" width="32"
								height="11" alt="edit" border="0" style="margin-bottom: 3px;"></a>
						</div></td>
					<td width="8"><img
						src="/30/B201/ko/imgX/common/img_copyright_line.gif" border="0"></td>
					<td width="260"><select name="myfriends" id="MYFRIENDS">
							<option value="0">Family Sites</option>
							<option value="0">------------------</option>
					</select></td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- bottom finish } -->
	<form name="searchf" method="post" style="margin: 0px">
		<input type="hidden" name="tbl" value="board"> <input
			type="hidden" name="page" value="1"> <input type="hidden"
			name="condition"> <input type="hidden" name="bcode" value="2">
		<input type="hidden" name="buff" value="1"> <input
			type="hidden" name="bt" value="1"> <input type="hidden"
			name="what"> <input type="hidden" name="keyword">
	</form>
	<form name="boardtype" style="margin: 0px">
		<input type="hidden" name="bt" value="1"> <input type="hidden"
			name="page" value="1"> <input type="hidden" name="tbl"
			value="board"> <input type="hidden" name="bcode" value="2">
		<input type="hidden" name="buff" value="1"> <input
			type="hidden" name="condition" value=""> <input type="hidden"
			name="listtype">
	</form>
	<form name="delf" method="post" style="margin: 0px">
		<input type="hidden" name="tbl" value="board"> <input
			type="hidden" name="bcode" value="2"> <input type="hidden"
			name="buff" value="1"> <input type="hidden" name="bt"
			value="1"> <input type="hidden" name="sflag" value="">
		<input type="hidden" name="mbcode" value=""> <input
			type="hidden" name="delListStr"> <input type="hidden"
			name="parentListStr">
	</form>
	<form name="listf" method="post" style="margin: 0px">
		<input type="hidden" name="tbl" value="board"> <input
			type="hidden" name="page"> <input type="hidden" name="bcode"
			value="2"> <input type="hidden" name="buff" value="1">
		<input type="hidden" name="bt" value="1"> <input type="hidden"
			name="condition" value=""> <input type="hidden"
			name="ilistcnt" value="15"> <input type="hidden" name="what"
			value=""> <input type="hidden" name="keyword" value="">
		<input type="hidden" name="mbcode1">
	</form>
	<form name="linkinfo3" style="margin: 0px;">
		<input type="hidden" name="linkstr">
	</form>
	<div id=linkinfo
		style="padding: 5 5 5 5; display: none; top: 0; left: 0; width: 450; height: 1; position: absolute; border: solid 1 FF9933; z-index: 110; background-color: #ffffff;"></div>
	<div id=linkinfo2
		style="padding: 5 5 5 5; display: none; top: 0; left: 0; width: 450; height: 1; position: absolute; border: solid 1 FF9933; z-index: 110; background-color: #ffffff;"></div>
	<script type="text/javascript">
	<!--
		$('BS_KEYWORD').value = "";
		if ($('BS_KEYWORD').value != '')
			$('BS_KEYWORD').style.background = '';
		setAddEvent($('LISTCNT'), 'change', goChgCnt);
		setAddEvent($('BS_KEYWORD'), 'keypress',
				function(event) {
					var chCode = ('charCode' in event) ? event.charCode
							: event.keyCode;
					if (chCode == 13)
						goSearch();
				});
		setAddEvent($('BS_SEARCHBTNIMG'), 'click', goSearch);
		$('PREV01LN').hide();
		$('PREV02LN').hide();
		$('NEXT02LN').hide();
		$('NEXT01LN').hide();
		$('WRITEBTNLN').show();
		$('WRITEBTNLN').href = "/web/board/board_write?tbl=board&bcode=2&page=1&buff=1&bt=1&ilistcnt=15";
		setAddEvent($('LISTTYPE'), 'change', chgMode30);
		var someNodeList = $('LISTCNT').getElementsByTagName('option');
		var nodes = $A(someNodeList);
		nodes.each(function(node) {
			if (node.innerHTML == 15) {
				node.selected = true;
			}
		});
		$('LISTTYPE').selectedIndex = 1;
	//-->
	</script>
	<form method="post" name="gourlf" style="margin: 0px;">
		<input type="hidden" name="myfriends">
	</form>
	<form name="fsrch" method="post" style="margin: 0px">
		<input type="hidden" name="keyword">
	</form>
	<form method="post" name="loginf" style="margin: 0px">
		<input type="hidden" name="id"> <input type="hidden"
			name="pwd">
	</form>
	<script type="text/javascript">
	<!--
		try {
			$('JOINBTN').style.display = '';
		} catch (e) {
		}
		var findidW = 400, findidH = 220, findpwW = 400, findpwH = 220;
		try {
			$('LOGIN_AREA1').style.display = 'inline-block';
			$('MAILBTN').style.display = 'inline-block';
		} catch (e) {
			se_reporte(e, "common_bottom getLOGIN_AREA1Btns");
		}
		try {
			setAddEvent($('LOGIN_ID'), 'keypress', memberLoginPressEnter);
			setAddEvent($('LOGIN_PWD'), 'keypress', memberLoginPressEnter);
			setAddEvent($('LOGINBTN'), 'click', memberLogin);
			Event.observe($('FINDIDLN'), 'click', function(event) {
				winPopEvt(event, '/web/minim/pop_findid?jsid=', findidW,
						findidH, 'findid');
			}, false);
			Event.observe($('FINDPWLN'), 'click', function(event) {
				winPopEvt(event, '/web/minim/pop_findpw?jsid=', findpwW,
						findpwH, 'findpw');
			}, false);
			Event.observe($('MAILBTNLN'), 'click', function(event) {
				getSiteMailtoAdmindiv(event);
			}, false);
		} catch (e) {
			se_reporte(e, "common_bottom getUserInfoBtns");
		}
		try {
			if ($('MAILBTN'))
				$('MAILBTN').style.display = 'inline-block';
			Event.observe($('MAILBTNLN'), 'click', function(event) {
				getSiteMailtoAdmindiv(event);
			}, false);
		} catch (e) {
		}
		try {
		} catch (e) {
			se_reporte(e, "common_bottom getOwnerBtns");
		}
		try {
		} catch (e) {
			se_reporte(e, "common_bottom getPointArea");
		}
		try {
			setAddEvent($('TOPTSEARCHBTN'), 'click', openMultiSearch);
		} catch (e) {
			se_reporte(e, "common_bottom getTopTsearch");
		}
		try {
			setAddEvent($('TKEYWORD'), 'click', new Function(
					"setReset($('TKEYWORD'))"));
			setAddEvent($('TKEYWORD'), 'keypress', searchAllPressEnter);
			setAddEvent($('TSEARCHBTN'), 'click', searchAll);
		} catch (e) {
			se_reporte(e, "common_bottom getTsearch");
		}
		try {
			if ($('REQDESIGNBTNLN') != null) {
				$('REQDESIGNBTNLN').target = "_blank";
				$('REQDESIGNBTNLN').href = "//tnaru.com/hub/new_mymenu/serviceorder.jsp";
			}
		} catch (e) {
			se_reporte(e, "common_bottom getReqDesign");
		}
		try {
			//getMgrBtns
		} catch (e) {
			se_reporte(e, "common_bottom getMgrBtns");
		}
		try {
			if ($('MEMBERMENU') != null) {
			}
		} catch (e) {
			se_reporte(e, "common_bottom getMEMBERMENU");
		}
		try {
			if ($('SUBIMG') != null) {
				$('SUBIMGSRC').src = "/30/B201/ko/imgX/common/sub_def.jpg";
			}
		} catch (e) {
			se_reporte(e, "common_bottom getSubImg");
		}
		try {
		} catch (e) {
			se_reporte(e, "common_bottom getNetworkBtns");
		}
		try {
		} catch (e) {
		}
		try {
			setPatternSingle("TM2");
		} catch (e) {
		}
		try {
			Event.observe($('MYFRIENDS'), 'change', moveSite, false);
		} catch (e) {
		}
		try {
			setMYFRIENDS(opts);
		} catch (e) {
		}
		/*
		 * for G2 only
		 */
		if (Abrowser.msie)
			if (window.attachEvent) {
				window.attachEvent('onload', function() {
					try {
						var height = $('leftmenutd').offsetHeight - 111;
						$('leftmenutable').style.height = height + 'px';
					} catch (e) {
					}
				});
			}
		try {
		} catch (e) {
		}
		//detect if some cheeky monkey has embedded us in an iframe
		try {
			// get the location of the parent window
			var p = window.parent.location;
			var str = new String(p);
		} catch (e) {
			if ((location.href.indexOf('tnaru.net') > 3)
					|| (location.href.indexOf('tnaru.com') > 3)) {
				alert('경고! 보안위험에 노출되었을 수 있습니다.\n\n주소창의 주소와 접속한 페이지의 실제 주소가 다릅니다.\n'
						+ location.host + ' 운영진에 문의하시기 바랍니다.');
				window.top.location.href = '//' + window.location.host;
			}
		}
		setTextFieldArray(VARLIST);
		try {
			setTableArray(VARTLIST);
			$('MOVESELECT').selectedIndex = 0;
		} catch (e) {
			console.log("setTableArray " + e);
		}
	//-->
	</script>
	<div id="updateBoard">
		<table width="132" cellpadding="0" cellspacing="0" border="0"
			style="background: url(/30/B201/ko/imgX/common/bg_update.gif) repeat-y;">
			<tr>
				<td colspan="2"><img
					src="/30/B201/ko/imgX/common/img_update_top.gif" border="0" alt=""></td>
			</tr>
			<tr>
				<td height="4" colspan="2"></td>
			</tr>
			<tr>
				<td id="TMENU2BOX"></td>
			</tr>
		</table>
		<table id="novc" width="132" height="24" cellpadding="0"
			cellspacing="0" border="0"
			background="/30/B201/ko/imgX/main/bg_vcount.gif">
			<tr>
				<td></td>
			</tr>
		</table>
		<table id="yesvc" style="display: none;" width="132" height="92"
			cellpadding="0" cellspacing="0" border="0"
			background="/30/B201/ko/imgX/main/bg_vcount.gif">
			<tr>
				<td height="49"></td>
			</tr>
			<tr>
				<td height="13" valign="top" align="left"
					style="padding-left: 31px;">
				<td valign="top" align="right"><div id="DVISIT"
						class="dvisitor"></div></td>
			</tr>
			<tr>
				<td height="3"></td>
			</tr>
			<tr>
				<td height="13"></td>
				<td align="right" valign="top"><div id="TVISIT"
						class="tvisitor"></div></td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		<div id="tad_200x200"
			style="display: none; z-index: 201; margin-top: 10px;"></div>
	</div>
	<div id="RQM0" style="z-index: 201;">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td height="5" width="5"><img height="5" width="5"
					src="/30/imgX/box_common_topleft_01.gif"></td>
				<td class="boxtopbottom" style="border-top: 1px solid #ddd;"><img
					src="/30/imgX/img_space.gif" width="1" height="1"></td>
				<td height="5" width="5"><img height="5" width="5"
					src="/30/imgX/box_common_topright_01.gif"></td>
			</tr>
			<tbody id="RQM0BODY">
				<tr id="SE_PANNEL" style="display: none;">
					<td colspan="3"><span id="MYACCOUNTBTN" style="display: none;">MyAct</span>
						<span id="se_CARTBTN" style="display: none;">Cart</span></td>
				</tr>
				<tr>
					<td colspan="3"><span id="RQM0MTITLE" class="ellipsis"
						style="width: 120px;"></span> <img id="RQM0EDITBTN"
						src="/30/C904/ko/imgX/buttons/main/b_bring.gif"
						style="display: none; margin-top: -3px; cursor: pointer; vertical-align: middle;">
					</td>
				</tr>
				<tr>
					<td id="RQM0DEF" colspan="3" class="RQAD0DEF"></td>
				</tr>
			</tbody>
			<tr id="RQAD0EDITBTNTR" style="display: none;">
				<td class="RQAD0DEF" colspan="3"><img id="RQAD0EDITBTN"
					src="/30/C904/ko/imgX/buttons/main/b_bring.gif"
					style="margin-top: -3px; cursor: pointer; vertical-align: middle;">
				</td>
			</tr>
			<tr>
				<td id="RQAD0DEF" class="RQAD0DEF" colspan="3"></td>
			</tr>
			<tr>
				<td height="5" width="5"><img height="5" width="5"
					src="/30/imgX/box_common_bottomleft_01.gif"></td>
				<td class="boxtopbottom" style="border-bottom: 1px solid #ddd;"><img
					src="/30/imgX/img_space.gif" width="1" height="1"></td>
				<td height="5" width="5"><img height="5" width="5"
					src="/30/imgX/box_common_bottomright_01.gif"></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	<!--
		var updatediv = $('updateBoard');
		$('wrap').appendChild(updatediv);
		var TM2SIZE = 7;
		function fillupTM2() {
			$('TMENU2BOX').innerHTML = "<table><tr><td><img src=\"/30/imgX/common/img_space.gif\" class=\"TM2NEW\" width=\"8\" height=\"1\" alt=\"\" align=\"absmiddle\"\></td><td><span onclick=\"goUrl(\'/web/board/board_top?tbl=intro\',0);\" class=\"TM2MENU ellipsis\"\>회사소개</span\></td><td align='right' class='TM2TODAY'>0/</td><td align='left' class='TM2ALL'>5</td></tr><tr><td><img src=\"/30/imgX/common/img_space.gif\" class=\"TM2NEW\" width=\"8\" height=\"1\" alt=\"\" align=\"absmiddle\"\></td><td><span onclick=\"goUrl(\'/web/board/board_top?tbl=notievent\',0);\" class=\"TM2MENU ellipsis\"\>공지/뉴스</span\></td><td align='right' class='TM2TODAY'>0/</td><td align='left' class='TM2ALL'>0</td></tr><tr><td><img src=\"/30/imgX/common/img_space.gif\" class=\"TM2NEW\" width=\"8\" height=\"1\" alt=\"\" align=\"absmiddle\"\></td><td><span onclick=\"goUrl(\'/web/board/board_top?tbl=board\',0);\" class=\"TM2MENU ellipsis\"\>게시판</span\></td><td align='right' class='TM2TODAY'>0/</td><td align='left' class='TM2ALL'>15</td></tr><tr><td><img src=\"/30/imgX/common/img_space.gif\" class=\"TM2NEW\" width=\"8\" height=\"1\" alt=\"\" align=\"absmiddle\"\></td><td><span onclick=\"goUrl(\'/web/board/board_top?tbl=product\',0);\" class=\"TM2MENU ellipsis\"\>겔러리</span\></td><td align='right' class='TM2TODAY'>0/</td><td align='left' class='TM2ALL'>1</td></tr><tr><td><img src=\"/30/imgX/common/img_space.gif\" class=\"TM2NEW\" width=\"8\" height=\"1\" alt=\"\" align=\"absmiddle\"\></td><td><span onclick=\"goUrl(\'/web/board/board_top?tbl=cscenter\',0);\" class=\"TM2MENU ellipsis\"\>고객센터</span\></td><td align='right' class='TM2TODAY'>0/</td><td align='left' class='TM2ALL'>13</td></tr><tr><td><img src=\"/30/imgX/common/img_space.gif\" class=\"TM2NEW\" width=\"8\" height=\"1\" alt=\"\" align=\"absmiddle\"\></td><td><span onclick=\"goUrl(\'/web/board/board_top?tbl=mc01\',0);\" class=\"TM2MENU ellipsis\"\>추가메뉴1</span\></td><td align='right' class='TM2TODAY'>0/</td><td align='left' class='TM2ALL'>0</td></tr><tr><td><img src=\"/30/imgX/common/img_space.gif\" class=\"TM2NEW\" width=\"8\" height=\"1\" alt=\"\" align=\"absmiddle\"\></td><td><span onclick=\"goUrl(\'/web/board/board_top?tbl=mc02\',0);\" class=\"TM2MENU ellipsis\"\>추가메뉴2</span\></td><td align='right' class='TM2TODAY'>0/</td><td align='left' class='TM2ALL'>0</td></tr></table>";
		}
		updatediv.style.display = '';
		fillupTM2();
		var rqm0div = $('RQM0');
		$('wrap').appendChild($('RQM0'));
		var RQM0SIZE = 1;
		var RQM0STR = "";
		RQM0STR = "<div class=\"UTFILEdiv UTFILE_oimagesdiv RQM0FILE RQM0FILE_oimagesdiv\" onmouseover=\"$(this).addClassName(\'UTFILEon\');shakeUTFILE(this.firstChild);\" onmouseout=\"$(this).removeClassName(\'UTFILEon\');\" \><img onload=\"checkUTFILE(this)\" onclick=\"location.href=\'/web/board/board_read?tbl=product&bcode=2&key=57&buff=1\'\" src=\"/files/mc/product/0/57/thumb/%EC%B9%98%ED%82%A8%EB%B1%85%EC%9D%B4.jpg\" border=\"0\" class=\"UTFILE UTFILE_oimages RQM0FILE RQM0FILE_oimages\" border=\"0\"\> </div\>";
		$('RQM0MTITLE').innerHTML = "<span onclick=\"location.href=\'/web/board/board_list?tbl=product&bcode=\'\" style=\"cursor:pointer;\"\>\r\n겔러리\r\n</span\>";
		$('RQM0DEF').innerHTML = RQM0STR;
		$('novc').style.display = 'none';
		$('yesvc').style.display = '';
		$('DVISIT').innerHTML = "2";
		$('TVISIT').innerHTML = "16750";
		qmTopStart = $(updatediv).offsetTop + $(updatediv).offsetHeight + 20;
		rqm0div.style.top = qmTopStart + "px";
		var stepf = 10;
		if (Abrowser.msie)
			stepf = 30;
		function moveRQM0() {
			if (rqm0div.widthChangeMemInt != null) {
				//console.log("here! rqm0div.widthChangeMemInt "+rqm0div.widthChangeMemInt);
				setTimeout("moveRQM0()", 100);
				return;
			}
			var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;
			var qmTopStart = $(updatediv).offsetTop + $(updatediv).offsetHeight
					+ 15;
			if (qmTopStart < 100) {
				setTimeout("moveRQM0()", 10);
				return;
			}
			var timeoutNextCheck = 100;
			yMenuFrom = rqm0div.offsetTop;
			yMenuTo = document.body.scrollTop + qmTopStart; // 위쪽 위치
			var yTo = document.getElementById('wrap').offsetHeight
					- rqm0div.offsetHeight - 20;
			if (yMenuTo > yTo)
				yMenuTo = yTo;
			if (yMenuTo < qmTopStart)
				yMenuTo = qmTopStart;
			if (yMenuFrom != yMenuTo) {
				var step = (yMenuTo - yMenuFrom) / stepf;
				if (step < 0)
					step = step * -1;
				doWidthChangeMem(rqm0div, yMenuFrom, yMenuTo, step, 1, 0.5);
			}
			setTimeout("moveRQM0()", timeoutNextCheck);
		}
		rqm0div.style.visibility = 'visible';
		moveRQM0();
		try {
			$('VCOUNT').style.display = '';
		} catch (e) {
		}
		try {
			Event.observe($('connectBtn'), 'click', function() {
				alert('운영진만 이용할 수 있습니다.');
			}, false);
			Event.observe($('rssBtn'), 'click', function() {
				alert('운영진만 이용할 수 있습니다.');
			}, false);
			$('connectBtn').style.width = "38px";
			$('rssBtn').style.height = "25px";
		} catch (e) {
		}
		if (!Abrowser.suck6) {
			try {
				var ttalk = new Element('div', {
					'id' : 'ttalk',
					'class' : 'ttalkdiv'
				})
				document.body.appendChild(ttalk);
				$('ttalk').onclick = function(event) {
					openttalk(event, '');
				};
				var ttalkN = null;
				var ttalkI = null;
				var doing = true;
				setTimeout(checkttalk, 3000);
			} catch (e) {
				console.log('ttalk ' + e)
			}
		}
		if (!Abrowser.suck6)
			setTimeout("listenon2('board_')", 3000);
	//-->
	</script>
	<!-- TAD OFF -->
</body>
</html>
