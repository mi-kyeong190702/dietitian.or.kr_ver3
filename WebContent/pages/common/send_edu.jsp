<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<form name="frm" method="post">
<input type="hidden" name="user_id" value="${info.id }"/>
<input type="hidden" name="user_name" value="${info.pers_name }"/>
<input type="hidden" name="code_member" value="${info.code_member }"/>
<input type="hidden" name="pass" value="${info.pers_hp }"/>
<input type="hidden" name="check" value="${check }"/>
<input type="hidden" name="s_url" value="${s_url }" />
</form>


<script>

	var id = '${info.id}';
	var url = '${s_url}';	
	
	if(id == ""){
		location.href=url;
	}else{
		document.frm.action=url+"/bbs/login_check_home.php";
		document.frm.submit();
	}

</script>
