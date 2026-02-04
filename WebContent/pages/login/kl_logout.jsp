<%@ page import="java.util.*" %>
<%

	if ( request.getProtocol().compareTo("HTTP/1.0") == 0 ) {
		response.setHeader("Pragma", "no-cache");
	} else if ( request.getProtocol().compareTo("HTTP/1.1") == 0 ) {
		response.setHeader("Cache-Control", "no-cache");
	}

	response.setDateHeader("Expires", 0);

	Enumeration em = session.getAttributeNames ();
	String sName = "";
	while ( em.hasMoreElements() ) {
		sName = (String)em.nextElement();
		session.removeAttribute ( sName );
	}

	session.invalidate();
%>

<script type="text/javascript">
	document.location.href = "/index.jsp"
</script>
