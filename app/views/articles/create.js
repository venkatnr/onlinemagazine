  $('#article_form')[0].reset();
	$(".article_list").html("<%= escape_javascript(render :partial => 'articles',:locals=>{:articles =>@articles })%>");	