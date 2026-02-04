<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
opener.document.IPIN.AUTHINFO.value = "${memberJoin.authinfo}";
opener.document.IPIN.IPIN_PERS_NAME.value = "${memberJoin.pers_name}";
opener.doIpinCheckComplete(); 
self.close();
</script>
