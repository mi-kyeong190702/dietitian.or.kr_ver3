/**
 * $RCSfile: ParamUtils.java,v $
 * $Revision: 1.2 $
 * $Date: 2003/06/17 03:14:44 $
 *
 * Copyright (C) 2000 CoolServlets.com. All rights reserved.
 *
 * ===================================================================
 * The Apache Software License, Version 1.1
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        CoolServlets.com (http://www.coolservlets.com)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Jive" and "CoolServlets.com" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please
 *    contact webmaster@coolservlets.com.
 *
 * 5. Products derived from this software may not be called "Jive",
 *    nor may "Jive" appear in their name, without prior written
 *    permission of CoolServlets.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL COOLSERVLETS.COM OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of CoolServlets.com. For more information
 * on CoolServlets.com, please see <http://www.coolservlets.com>.
 *
 *
 * history : 2003.08.25    (��)�ؽ�Ʈ���� �̻�� : 
              issac������� ���� �Ķ���͸޼ҵ�� ����.
 *            ������ �޼ҵ�
 *                getParameter( HttpServletRequest request, 
 *                                  String paramName, String defaultParam )
 *                getBooleanParameter( HttpServletRequest request, 
 *                                  String paramName )
 *                getIntParameter( HttpServletRequest request, 
 *                                  String paramName, int defaultNum )
 *                getCheckboxParameter( HttpServletRequest request, 
 *                                  String paramName )
 *                getParameter( HttpServletRequest request, 
                                    String paramName, boolean emptyStringsOK )
 *            �߰��� �޼ҵ�
 *                issacwebData( HttpServletRequest request, String paramName )
 */

package kda.utils;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 *  This class assists skin writers in getting parameters.
 */
public class ParamUtils 
{
    public static String getParameter( HttpServletRequest request, String paramName ) 
    {    	
		return getParameter( request, paramName, false );
    }
    
    public static String getParameter( HttpServletRequest request, String paramName, String defaultParam ) 
    {    	
    	String temp = request.getParameter(paramName);
    	if(temp != null && !temp.equals("")) {    		
    		return temp;
    	}else {
    		
    		return defaultParam;
    	}
    }
    
    public static String[] getParameterSA(HttpServletRequest req, String[][] paramName){
        String[] returnParam    = new String[paramName.length] ;
        for(int i=0 ; i<paramName.length ; i++){
            returnParam[i] = paramName[i][0];
            returnParam[i] = req.getParameter(paramName[i][0]);
            if(returnParam[i] ==null){
                returnParam[i] = paramName[i][1] ;
            }
        }
        return returnParam ;
    }

    public static String getParameter( HttpServletRequest request, String paramName, boolean emptyStringsOK ) {
    	
    	String temp = request.getParameter(paramName);		
	    if( temp != null ) {
	    	
	        if( temp.equals("") && !emptyStringsOK )
	            return "";
	        else
	            return temp;
	    }else {
	    	
	        return "";
	    }
    }

    public static boolean getBooleanParameter( HttpServletRequest request, String paramName ) {
    	
    	String temp = request.getParameter(paramName);
        
        if( temp != null && temp.equals("true") )
			return true;
		else
			return false;
    }

    public static int getIntParameter( HttpServletRequest request, String paramName, int defaultNum ) {
    	
    	String temp = request.getParameter(paramName);
		
		if( temp != null && !temp.equals("") ) {
			
	        int num = defaultNum;
	        try {
	        	
	            num = Integer.parseInt(temp);
	        }catch( Exception ignored ) {System.out.println(ignored.toString());}		
			return num;
		}else {
			return defaultNum;
		}
    }

    public static boolean getCheckboxParameter( HttpServletRequest request, String paramName ) {    	
        String temp = request.getParameter(paramName);        
        if( temp != null && temp.equals("on") )
            return true;
        else
            return false;
    }
    
    public static String getAttribute( HttpServletRequest request, String attribName ) {    	
    	return getAttribute( request, attribName, false );
    }

    public static String getAttribute( HttpServletRequest request, String attribName, boolean emptyStringsOK ) 
    {    	
		String temp = (String)request.getAttribute(attribName);		
        if( temp != null ) {        	
            if( temp.equals("") && !emptyStringsOK )
                return null;
            else
                return temp;
        }else {        	
            return null;
        }
    }
    
    public static boolean getBooleanAttribute( HttpServletRequest request, String attribName ) {    	
        String temp = (String)request.getAttribute(attribName);        
        if( temp != null && temp.equals("true") )
			return true;
        else
			return false;
    }

    public static int getIntAttribute( HttpServletRequest request, String attribName, int defaultNum ) {
    	
        String temp = (String)request.getAttribute(attribName);        
        if( temp != null && !temp.equals("") ) {        	
        	int num = defaultNum;        	
	        try {	        	
	            num = Integer.parseInt(temp);
	        }catch( Exception ignored ) {System.out.println(ignored.toString());}	        
			return num;
        }else {        	
        	return defaultNum;
        }
    }
    
    public static Map<String, String> getParamMap(HttpServletRequest request) {
    	Map paramMap = new HashMap();
		Enumeration eParam = request.getParameterNames();
		while (eParam.hasMoreElements()) {
			String pName = (String)eParam.nextElement();
			String pValue = request.getParameter(pName);
			paramMap.put(pName, pValue);
		}
		return paramMap;
    }
    
    public static String getParamString(HttpServletRequest request) {
    	
    	String paramStr = "";
		Enumeration eParam = request.getParameterNames();
		while (eParam.hasMoreElements()) {
			String pName = (String)eParam.nextElement();
			String pValue = request.getParameter(pName);
			if( !paramStr.equals("") ) {
				paramStr += "&";
			}
			paramStr += pName + "=" + pValue;
		}
		return paramStr;
    }
}
