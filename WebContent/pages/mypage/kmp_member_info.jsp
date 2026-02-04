<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String lic_ck_val =""; //면허중복확인
%>
<script type="text/javascript">

    var interval;

    $(document).ready(function() 
    {
        $("#use_button_license").hide();        
        $("#use_button_id").hide();
        
        loadGroupCode();
    });
    
    function loadGroupCode()
    {
        // --030 :우편물 발송지 구분, 018:발송호칭 010:직렬, 011:직급, 027:최종학력, 019:학위, 028:출신학교
        $.ajax ( {
            type        : "POST"
            , url       : "/common_groupcode_option.do"
            , dataType  : "text"
            , data      : "groupCode=003"       // 근무처분류
            , cache     : false
            , success   : handleLoadGroupCode003
        });
    
        var param = "groupCode=010"; // 직렬
        $.ajax ( {
            type        : "POST"
            , url       : "/common_groupcode_option.do"
            , dataType  : "text"
            , data      : param
            , cache     : false
            , success   : handleLoadGroupCode010                            
        });
        
        var param = "groupCode=011"; // 직급
        $.ajax ( {
            type        : "POST"
            , url       : "/common_groupcode_option.do"
            , dataType  : "text"
            , data      : param
            , cache     : false
            , success   : handleLoadGroupCode070                            
        }); 
        
        var param = "groupCode=030"; // 우편물 발송지 구분
        $.ajax ( {
            type        : "POST"
            , url       : "/common_groupcode_option.do"
            , dataType  : "text"
            , data      : param
            , cache     : false
            , success   : handleLoadGroupCode030                            
        });         
        
        var param = "groupCode=018"; // 우편물 발송지 구분
        $.ajax ( {
            type        : "POST"
            , url       : "/common_groupcode_option.do"
            , dataType  : "text"
            , data      : param
            , cache     : false
            , success   : handleLoadGroupCode018                            
        });         
    
    }
    
    
    function handleLoadGroupCode003(data)
    {
        //근무처 분류
        $("#code_part").html(data);
        var code_part = '${requestScope.memberInfo.code_part}';
        if(code_part != '') {
            $("#code_part").val(code_part);
            $("#code_part").val('${requestScope.memberInfo.code_part}').attr("selected", "selected");
            onChangeCodePart();
        }
        else {
            $("#code_part").val('0');
            onChangeCodePart();
        }
    }
    
    function handleLoadGroupCode010(data)
    {
        data = "<option value='0'>직렬선택</option>" + data
        $("#job_line_code").html(data);
        $("#job_line_code").val('${requestScope.memberInfo.job_line_code}').attr("selected", "selected");
    }
    
    function handleLoadGroupCode070(data)
    {
        data = "<option value='0'>직급선택</option>" + data
        $("#job_level_code").html(data);
        $("#job_level_code").val('${requestScope.memberInfo.job_level_code}').attr("selected", "selected");
    }

    function handleLoadGroupCode030(data)
    {
        data = "<option value='0'>수신처</option>" + data
        $("#code_place").html(data);
        $("#code_place").val('${requestScope.memberInfo.code_place}').attr("selected", "selected");
    }

    function handleLoadGroupCode018(data)
    {
        data = "<option value='0'>호칭</option>" + data
        $("#code_call").html(data);
        $("#code_call").val('${requestScope.memberInfo.code_call}').attr("selected", "selected");
    }
    
    function handleLoadGroupCode004(data)
    {
        data = "<option value=''></option>" + data  ;   
        $("#code_great").html(data);
        $("#code_small").html("<option value=''></option>");
        var code_great = '${requestScope.memberInfo.code_great}';   
        if(code_great != '') {
            $("#code_great").val(code_great);
            $("#code_great").val('${requestScope.memberInfo.code_great}').attr("selected", "selected");
            onChangeCodeGreat();
        }
        else {
            $("#code_great").val('000');
            $("#code_great").val('000').attr("selected", "selected");
            onChangeCodeGreat();
        }
    }
    
    function handleLoadGroupCode005(data)
    {
        data = "<option value=''></option>" + data  ;   
        $("#code_small").html(data);
        var code_small = '${requestScope.memberInfo.code_small}';
        if(code_small != '') {
            $("#code_small").val(code_small);
            $("#code_big").val($("#code_great").val());
            $("#code_small").val('${requestScope.memberInfo.code_small}').attr("selected", "selected");
        }
        else {
            $("#code_small").val('00000');
            $("#code_big").val($("#code_great").val());
            $("#code_small").val('00000').attr("selected", "selected");
        }
    }
    
    function onChangeCodePart()
    {
        var tempcd2 = $("#code_part").val();        
        var param = "groupCode=004&tempcd2="+tempcd2; // 근무처 구분
    
        $.ajax ( {
            type        : "POST"
            , url       : "/common_groupcode_option.do"
            , dataType  : "text"
            , data      : param
            , cache     : false
            , success   : handleLoadGroupCode004
        });
    }
    
    function onChangeCodeGreat()
    {
        var tempcd2 = $("#code_great").val();       
        var param = "groupCode=005&tempcd2="+tempcd2; // 근무처 구분
    
        $.ajax ( {
            type        : "POST"
            , url       : "/common_groupcode_option.do"
            , dataType  : "text"
            , data      : param
            , cache     : false
            , success   : handleLoadGroupCode005
        });
    }
    
    function doShowCheckPopup()
    {   
        //interval = setInterval(setFocusCheck,1);
        //$("#use_button_license").hide();
        //$("#ck_license").val( $("#lic_no").val() );
        $('#popup_check').bPopup();         
    }
    
    function doShowCheckPopup2()
    {   
        //interval = setInterval(setFocusCheck,1);
        //$("#use_button_license").hide();
        //$("#ck_license").val( $("#lic_no").val() );
        $('#popup_check2').bPopup();        
    }
    /*
    function setFocusCheck()
    {
        $("#ck_license").focus();
        clearInterval(interval);
    }
    */

    function doShowCompanyPopup()
    {   
        interval = setInterval(setFocusCompany,1);
        $('#popup_company').bPopup();       
    }
    
    function setFocusCompany()
    {
        //$("#ck_license").focus();
        clearInterval(interval);
    }
    
    function doShowLicensePopup()
    {   
        interval = setInterval(setFocusLicense,1);
        $("#use_button_license").hide();
        $("#ck_license").val( $("#lic_no").val() );
        $('#popup_license').bPopup();       
    }
    
    function setFocusLicense()
    {
        $("#ck_license").focus();
        clearInterval(interval);
    }
    
    function doCheckLicense()
    {       
        var ck_license = $("#ck_license").val();
        
        if( ck_license == $("#lic_no").val() ) {
            alert("수정할 면허번호를 입력하여 주십시요");
            $("#ck_license").focus();
            return;
        }
        
        var param = "ck_val=" + ck_license;
        $.ajax ( {
              type      : "POST"
            , url       : "/member_checkLicNo.do"
            , dataType  : "text"
            , data      : param
            , cache     : false
            , success   : handleLicenseCheck                            
        });
    }
    
    function handleLicenseCheck(data)
    {
        var ck_license = $("#ck_license").val();
        if ( data == "" ){                      
            alert("[" + ck_license + "] 사용가능한 면허번호입니다.");
            $("#use_button_license").show();
        } else {
            alert("[" + ck_license + "] 이미 등록된 면허번호입니다.");
        }
    }

    function doUseLicense()
    {
        var ck_license = $("#ck_license").val();
        $("#lic_no").val ( ck_license );
        $('#popup_license').bPopup();
        
        $(".bClose").click();
    }
    
    function doShowIdPopup()
    {   
        interval = setInterval(setFocusId,1);
        $("#use_button_id").hide();
        $('#popup_id').bPopup();
        $(".bClose").click();
    }
    
    function setFocusId()
    {
        $("#ck_id").focus();
        clearInterval(interval);
    }
    
    function doCheckId()
    {
        var ck_id = $("#ck_id").val();
        var param = "ck_val=" + ck_id;      
        
        $.ajax ( {
              type      : "POST"
            , url       : "/member_checkLicNo.do"
            , dataType  : "text"
            , data      : param
            , cache     : false
            , success   : handleIdCheck                         
        });
    }
    
    function handleIdCheck(data)
    {
        var ck_id = $("#ck_id").val();
        if ( data == "" )
        {                       
            alert("[" + ck_id + "] 사용가능한 아이디 입니다.");
            $("#use_button_id").show();
        }
        else
        {
            alert("[" + ck_id + "] 이미 등록된 아이디 입니다.");
        }
    }   

    function doUseId()
    {
        var ck_id = $("#ck_id").val();
        $("#id").val ( ck_id );
        $(".bClose").click();
    }   

    function getMailAddChk(item)
    {
        if(item == "직장")
        {
            if(    document.join.code_post3.value == "" 
                || document.join.code_post4.value == "" 
                || document.join.company_add.value == "" )
            {
                alert("근무처주소를 입력하지 않으면 '직장'으로 선택 할 수 없습니다.");
                document.join.code_place.options[0].selected=true;
                document.join.code_place.options[1].selected=false;
            }
        }
    }

    function openJusoPopup() 
    {
        var pop = window.open("/pages/juso/jusoPopup.jsp","jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    }
    
    function jusoCallBack( roadFullAddr
                         , roadAddrPart1
                         , addrDetail
                         , roadAddrPart2
                         , engAddr
                         , jibunAddr
                         , zipNo
                         , admCd
                         , rnMgtSn
                         , bdMgtSn)
    {
        document.join.pers_add.value        = roadAddrPart1 ;       
        document.join.pers_add_detail.value = addrDetail + " " + roadAddrPart2;
/*      document.join.ppost.value       = zipNo.substring(0,3) + zipNo.substring(4,7);*/
        document.join.ppost.value       = zipNo ;
    }

    function openJusoPopup2() 
    {
        var pop = window.open("/pages/juso/jusoPopup2.jsp","jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    }

    function jusoCallBack2( roadFullAddr
                          , roadAddrPart1
                          , addrDetail
                          , roadAddrPart2
                          , engAddr
                          , jibunAddr
                          , zipNo
                          , admCd
                          , rnMgtSn
                          , bdMgtSn)
    {
        document.join.company_add.value         = roadAddrPart1;
        document.join.company_add_detail.value  = addrDetail + " " + roadAddrPart2;
//      document.join.cpost.value           = zipNo.substring(0,3) + zipNo.substring(4,7);
        document.join.cpost.value           = zipNo ;
    }

    function check()
    {   
        try
        {
            document.join.code_sex.value = $("input:radio[name='code_sex']:checked").val();
            
            if(document.join.lic_no.value.length < 1){
                alert("면허번호를 정확히 입력하세요.");
                document.join.lic_no.focus();
                return false;
            }
            

            var pw = document.join.passwd.value;
            if( pw.length > 0 ) {
                if( !checkPassword("passwd") )
                    return false;
            }
            
            if(document.join.passwd.value != document.join.passwd2.value ){
                alert("비밀번호확인 번호가 서로 다릅니다.");
                document.join.passwd2.focus();
                return false;
            }       
            
            if(document.join.email1.value.length < 1){
                alert("이메일을 정확히 입력하세요.");
                document.join.email1.focus();
                return false;
            }           
            
            if(document.join.email2.value.length < 4){
                alert("이메일을 정확히 입력하세요.");
                document.join.email2.focus();
                return false;
            }
            
            document.join.email.value = document.join.email1.value + "@" + document.join.email2.value;

            if(document.join.pers_tel.value.length < 2 || document.join.pers_tel.value.length > 11){
                alert("자택 전화번호를 정확히 입력하세요.");
                document.join.pers_tel.focus();
                return false;
            }
            
            if(document.join.pers_hp.value.length < 3 || document.join.pers_hp.value.length > 11){
                alert("휴대전화 번호를 정확히 입력하세요.");
                document.join.pers_hp.focus();
                return false;
            }
            
            if(document.join.ppost.value.length < 1){
                alert("자택 주소를 정확히 입력하세요.");
                document.join.code_post.focus();
                return false;
            }
            
            if(document.join.pers_add.value.length < 1){
                alert("자택 주소를 정확히 입력하세요.");
                document.join.pers_add.focus();
                return false;
            }
            
            if(document.join.pers_add_detail.value.length < 1){
                alert("자택 주소를 정확히 입력하세요.");
                document.join.pers_add_detail.focus();
                return false;
            }

            if(document.join.code_part.value == ''){
                alert("근무처 분류를 선택하세요.");
                document.join.code_part.focus();
                return false;
            }

            if(document.join.code_great.value == ''){
                alert("근무처 대분류를 선택하세요.");
                document.join.code_great.focus();
                return false;
            }

            if(document.join.code_small.value == ''){
                alert("근무처 소분류를 선택하세요.");
                document.join.code_small.focus();
                return false;
            }
            
            if( $("#code_place").val() == "0" ) {
                alert("수신처를 선택하여 주십시요");
                $("#code_place").focus();
                return false;
            }
            //근무처명 or 근무처 주소가 변경되었고, 
            //근무처분류(3가지중 1개)가 수정이 안되었으면 안내메시지 
            if((document.join.company_name.value       != document.join.company_name_org.value) ||
               (document.join.cpost.value              != document.join.company_post_org.value) || 
               (document.join.company_add.value        != document.join.company_add_org.value)  ||
               (document.join.company_add_detail.value != document.join.company_add_detail_org.value)){
                
                if((document.join.code_great.value == document.join.code_great_org.value) ||
                   (document.join.code_part.value  == document.join.code_part_org.value)  ||
                   (document.join.code_small.value == document.join.code_small_org.value)) {
                    /*
                    if( confirm("근무처가 변경되었습니다. 근무처분류도 수정하시겠습니까?\n(※근무처정보에 따라 소속 시·도영양사회와 분과가 조정될 수 있습니다.)") ) {
                        //확인 클릭 시 기본정보수정 화면
                        return false;
                    }
                    else {
                        //취소 클릭 시 저장
                        return true;
                    }
                    */
                    doShowCheckPopup(); 
                    return;
                    
                    
                }
                    
            }
            if((document.join.company_name.value       == document.join.company_name_org.value) ||
               (document.join.cpost.value              == document.join.company_post_org.value) || 
               (document.join.company_add.value        == document.join.company_add_org.value)  ||
               (document.join.company_add_detail.value == document.join.company_add_detail_org.value) ||
               (document.join.code_great.value == document.join.code_great_org.value) ||
               (document.join.code_part.value  == document.join.code_part_org.value)  ||
               (document.join.code_small.value == document.join.code_small_org.value)) {
                
                /*
                if( confirm("근무처정보에 따라 소속 시·도영양사회와 분과가 조정될 수 있습니다.\n[확인]을 선택하면 정보수정 페이지로 돌아갑니다.") ) {
                    //확인 클릭 시 기본정보수정 화면
                    return false;
                }
                else {
                    //취소 클릭 시 저장
                    return true;
                }
                */
                doShowCheckPopup2();        
                return;
            }
            
        }
        catch(e)
        {
            alert(e);
        }
        
        //return true;
    }
    
    function doWrite()
    {   
        /*
        if ( check() ) {            
            var f = document.forms["join"];
            f.method = "post";
            f.action = "/update_member_info.do";
            f.submit();             
        }
        */
         check();
    }
    
    function doWrite2()
    {   
        var f = document.forms["join"];
        f.method = "post";
        f.action = "/update_member_info.do";
        f.submit();         
                    
    }
</script>

<form name="join" method="post">
<input type='hidden' name="code_pers" id="code_pers" value="${requestScope.memberInfo.code_pers}" title="회원번호">
<input type='hidden' name="code_big" id="code_big" value="${requestScope.memberInfo.code_big}">
<input type="hidden" name="comp_seq" value="${requestScope.memberInfo.comp_seq}" title="">
<input type="hidden" name="pers_tel_org" value="${requestScope.memberInfo.pers_tel}" />
<input type="hidden" name="pers_hp_org" value="${requestScope.memberInfo.pers_hp}" />
<input type="hidden" name="email_org" value="${requestScope.memberInfo.email}" />
<input type="hidden" name="email" value="${fn:split(requestScope.memberInfo.email,'@')[0]}" />
<input type="hidden" name="code_great_org" value="${requestScope.memberInfo.code_great}" />
<input type="hidden" name="code_part_org" value="${requestScope.memberInfo.code_part}" />
<input type="hidden" name="code_small_org" value="${requestScope.memberInfo.code_small}" />
<input type="hidden" name="code_post_org" value="${requestScope.memberInfo.ppost}" />
<input type="hidden" name="pers_add_org" value="${requestScope.memberInfo.pers_add}" />
<input type="hidden" name="pers_add_detail_org" value="${requestScope.memberInfo.pers_add_detail}" />
<input type="hidden" name="company_name_org" value="${requestScope.memberInfo.company_name}" />
<input type="hidden" name="company_post_org" value="${requestScope.memberInfo.cpost}" />
<input type="hidden" name="company_add_org" value="${requestScope.memberInfo.company_add}" />
<input type="hidden" name="company_add_detail_org" value="${requestScope.memberInfo.company_add_detail}" />
<input type="hidden" name="code_place_org" value="${requestScope.memberInfo.code_place}" />

 
    <div class="s_page">
        <div class="sp_head">
            <div class="sp_title">
                <h3 class="title bold t1 s1 i_b_t1">
                    <mark class="cm">기본</mark>정보수정
                </h3>
            </div>
            <div class="sp_navi">
                <ul>
                    <li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
                    <li><a href="/kmp_member_info.do">마이페이지</a></li>
                    <li><a href="/kmp_member_info.do">회원정보 관리</a></li>
                    <li><a href="/kmp_member_info.do" class="cm">기본정보 수정</a></li>
                </ul>
            </div>
        </div>
        <hr />
        <div class="sp_body">
            <p class="text middle cb s1 mt10">
                ※ 정보수정이 원활하게 되지 않을 경우,<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">기본정보 수정 요청서</font>를 다운로드 후 작성하시어 담당자에게<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의주시면 처리해드리겠습니다.<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/assets/ver2/mypage/docu/2025/[대한영양사협회] 기본정보수정 요청서.docx" class="btn t2" target="_blank" title="새창으로 보기">기본정보 수정 요청서(docx.)<span class="icon quick"></span></a>
                <a href="/assets/ver2/mypage/docu/2025/[대한영양사협회] 기본정보수정 요청서.hwp" class="btn t2" target="_blank" title="새창으로 보기">기본정보 수정 요청서(hwp.)<span class="icon quick"></span></a>
                <br>
            </p>
            
            <div class="box t2 bgs mt50 p20 text">
                <div class="area">
                    <h5 class="title i_b_t6 bold s1">
                        <mark class="cm">회원</mark> 정보 수정 
                    </h5>
                    <div class="box t1 r5 mt10 p10">
                        <h6 class="title s1 i_b_t3">
                            <mark class="bold">기본정보</mark>
                            <span class="ssmall">( <span class="i_b_t5"> 표시는
                                    필수항목입니다.</span> )
                            </span>
                        </h6>
                        <div class="form mt10 line bt bcm">
                            <div class="f_wrap line bb p5">
                                <div class="f_field div1">
                                    <label for="inputid1" class="ff_title2 i_b"><strong>성명</strong></label>
                                    <div class="ff_wrap ml120">
                                        <div class="area">
                                            <input type="text" class="input s1 fl w80" id="pers_name"
                                                name="pers_name" value="${requestScope.memberInfo.pers_name}" readonly />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="f_wrap line bb p5">
                                <div class="f_field div2">
                                    <label for="inputid2" class="ff_title2 i_b"><strong>생년월일</strong></label>
                                    <div class="ff_wrap ml120">
                                        <div class="area">
                                            <input type="text" class="input s1 fl w80" id="pers_birth"
                                                name="pers_birth" value="${requestScope.memberInfo.pers_birth}" readonly />
                                        </div>
                                    </div>
                                </div>
                                <div class="f_field div2">
                                    <div class="ff_title2 i_b">
                                        <strong>성별</strong>
                                    </div>
                                    <div class="ff_wrap ml120 text">
                                        <div class="area">
                                            <input type="radio" class="mr5" id="code_sex" name="code_sex"   value="1" <c:if test="${requestScope.memberInfo.code_sex == '1'}"> checked </c:if>> 
                                                <label for="radio1_1" class="mr20">남자</label> 
                                                <input type="radio" class="mr5" id="code_sex" name="code_sex" value="0"
                                                <c:if test="${requestScope.memberInfo.code_sex == '0' || requestScope.memberInfo.code_sex == ''}"> checked </c:if> />
                                                <label for="radio1_2" class="mr20">여자</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${(requestScope.memberInfo.code_member == '07') || (requestScope.memberInfo.code_member == '08')|| (requestScope.memberInfo.code_member == '12') }">
                                    <input type="hidden" name="lic_no" id="lic_no" value="0">
                                </c:when>
                                <c:otherwise>
                                    <div class="f_wrap line bb p5">
                                        <div class="f_field div1">
                                            <label for="inputid3" class="ff_title2 i_b"><strong>면허번호</strong></label>
                                            <div class="ff_wrap ml120">
                                                <div class="area">
                                                    <input type="text" class="input s1 fl w80" id="lic_no" name="lic_no" 
                                                        value="${requestScope.memberInfo.lic_no}" onKeyPress="onlyNumber()" maxlength="6" readonly /> 
                                                    <a href="javascript:doShowLicensePopup();" class="btn form_s1 p5 t1 fl ml5">면허번호 중복확인</a> 
                                                    <a href="https://lic.mohw.go.kr" target="_blank" 
                                                        class="btn form_s1 p5 t4 fl ml5">보건복지부 온라인 면허조회 바로가기</a>
                                                </div>
                                                <div class="area mt5 text ca s1">
                                                    <!-- <mark class="cb bold">면허번호</mark>-->
                                                    ※ 보건복지부 면허민원 안내를 통해 면허번호를 정확하게 확인하신 후 가입하여 주시기 바랍니다.<br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학생이나 영양사가 아니신 분은 면허번호를 공란으로 두십시오.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <div class="f_wrap line bb p5">
                                <div class="f_field div1">
                                    <label for="inputid4" class="ff_title2 i_b"><strong>이용자ID</strong></label>
                                    <div class="ff_wrap ml120">
                                        <div class="area">
                                            <input type="text" class="input s1 fl w200" id="id" name="id"
                                                size="12" value="${requestScope.memberInfo.id}" readonly />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="f_wrap line bb p5">
                                <div class="f_field div2">
                                    <label for="inputid5" class="ff_title2 i_b"><strong>비밀번호</strong></label>
                                    <div class="ff_wrap ml120">
                                        <div class="area">
                                            <input type="password" class="input s1 fl w200" id="passwd" name="passwd" size="20" value=""/>
                                        </div>
                                        <div class="area">
                                            <p class="fl text cp s1 ml00">※ 영문, 숫자, 특수문자 2종류, 8자리 이상</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f_field div2">
                                    <label for="inputid6" class="ff_title2 i_b"><strong>재입력</strong></label>
                                    <div class="ff_wrap ml120">
                                        <div class="area">
                                            <input type="password" class="input s1 fl w200" id="passwd2" name="passwd2" size="20"  value=""/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="f_wrap line bb p5">
                                <div class="f_field div1">
                                    <label for="inputid7" class="ff_title2 i_b"><strong>이메일</strong></label>
                                    <div class="ff_wrap ml120">
                                        
                                        <div class="area">
                                            <input type="text" class="input s1 fl w200" id="email1" name="email1" value="${fn:split(requestScope.memberInfo.email,'@')[0]}" />
                                                <label for="email2" class="fl text2 ml10 mr10">@</label> 
                                                <!-- 190626modi -->
                                                <input type="text" class="input s1 fl w150" id="email2" name="email2" value="${fn:split(requestScope.memberInfo.email,'@')[1]}" />
                                                <!-- 190626modi -->
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="f_wrap line bb p5">
                                <div class="f_field div1">
                                    <div class="ff_title2 i_b">
                                        <strong>전화번호</strong>
                                    </div>
                                    <div class="ff_wrap ml120">
                                        <ul>
                                            <!-- 190626modi -->
                                            <li>
                                                <div class="area">
                                                    <label for="inputid10" class="fl w70 text2 bold cm">자택</label>
                                                    <input type="text" class="input s1 fl w100"  id="pers_tel" name="pers_tel"
                                                        size="20" value="${requestScope.memberInfo.pers_tel}" style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
                                                    <label for="inputid13" class="fl w80 text2 bold cm ml40">휴대폰</label>
                                                    <input type="text" class="input s1 fl w100" id="pers_hp" name="pers_hp" size="20" 
                                                    value="${requestScope.memberInfo.pers_hp}" maxlength="12"  style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
                                                </div>
                                            </li>
                                            <!--// 190626modi -->
                                            <!-- 
                                            <li>
                                                <div class="area">
                                                    <label for="inputid10" class="fl w80 text2 bold cm">자택</label>
                                                    <input type="text" class="input s1 fl w100"  id="pers_tel" name="pers_tel"
                                                        size="20" value="${requestScope.memberInfo.pers_tel}" style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
                                                </div>
                                            </li>
                                            <li class="mt5">
                                                <div class="area">
                                                    <label for="inputid13" class="fl w80 text2 bold cm">휴대폰</label>
                                                    <input type="text" class="input s1 fl w100" id="pers_hp" name="pers_hp" size="20" 
                                                    value="${requestScope.memberInfo.pers_hp}" maxlength="12"  style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
                                                </div>
                                            </li>
                                             -->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h6 class="title s1 i_b_t3 mt20">
                            <mark class="bold">자택 및 근무처 정보</mark>
                            <span class="ssmall">( 우편물 수신처 )</span>
                        </h6>
                        <div class="form mt10 line bt bcm">
                            <div class="f_wrap line bb p5">
                                <div class="f_field div1">
                                    <label for="inputid16" class="ff_title2 i_b"><strong>자택주소</strong></label>
                                    <div class="ff_wrap ml120">
                                        <div class="area">
                                            <input type="text" class="input s1 fl w80" id="ppost"
                                                name="ppost" value="${requestScope.memberInfo.ppost}"
                                                onFocus="document.join.pers_add.focus();" readonly /> <a
                                                href="javascript:openJusoPopup();"
                                                class="btn form_s1 t1 fl ml5">주소검색</a>
                                        </div>
                                        <div class="area mt5">
                                            <label for="inputid17" class="ti">상세주소</label> 
                                            <input type="text" class="input s1" id="pers_add" name="pers_add" value="${requestScope.memberInfo.pers_add}" readonly /> 
                                            <br> <input type="text" class="input s1" id="pers_add_detail" name="pers_add_detail" value="${requestScope.memberInfo.pers_add_detail}" readonly />
                                        </div>
                                        <div class="area mt5 text2 ca s1">
                                            우편 발송시 문제가 될수 있으니
                                            <mark class="cm">새주소</mark>
                                            로 주소를 입력해 주시고 세부주소를 이어서 입력해 주세요.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="f_wrap line bb p5">
                                <div class="f_field div1">
                                    <div class="ff_title2">
                                        <strong>근무처</strong>
                                    </div>
                                    <div class="ff_wrap ml120">
                                        <ul>
                                            <!-- 190626modi -->
                                            <li>
                                                <div class="area">
                                                <label for="company_name2" class="fl w80 text2 bold cm">근무처분류</label>
                                                <select class="select s2 fl w150" id="code_part" name="code_part" onChange="javascript:onChangeCodePart();"></select>
                                                <label for="code_great2" class="ti"><strong>근무처분류2</strong></label>
                                                <select class="select s2 fl w150 ml5" id="code_great" name="code_great" onChange="javascript:onChangeCodeGreat();">
                                                <option value="">없음</option>
                                                </select>
                                                <label for="code_small2" class="ti"><strong>근무처분류3</strong></label>                                     
                                                <select class="select s2 fl w150 ml5" id="code_small" name="code_small">
                                                <option value="">없음</option>
                                                </select>   
                                                </div>
                                            </li>
                                            <li>
                                                <div class="area ml80 mt5">
                                                <p class="fl text2 cp">※근무처에 따라 근무처분류가 변경될 수 있습니다.</p><a href="javascript:doShowCompanyPopup();" class="btn form_s1 p5 t1 fl ml5">근무처분류 상세보기</a> 
                                                </div>
                                            </li>
                                            <!--//190626modi -->
                                            <li>
                                                <div class="area">
                                                    <label for="company_name" class="fl w80 text2 bold cm">근무처명</label>
                                                    <input type="text" class="input s1 fl w200" id="company_name" name="company_name" value="${requestScope.memberInfo.company_name}" />
                                                </div>
                                            </li>
                                            <li class="mt5">
                                                <div class="area">
                                                    <label for="job_dept" class="fl w80 text2 bold cm">부서 및 직급</label> 
                                                    <input type="text" class="input s1 fl w200" id="inputid19" name="job_dept" value="${requestScope.memberInfo.job_dept}" /> 
                                                    <span class="fl text2 ml10 mr10">부</span> 
                                                    <label for="job_line_code" class="ti">직렬</label>
                                                    <select class="select s2 fl w100" id="job_line_code" name="job_line_code"></select> 
                                                    <label for="job_level_code" class="ti">직급</label> 
                                                    <select class="select s2 fl w100 ml5" id="job_level_code" name="job_level_code"></select>
                                            </li>
                                            <li class="mt5 pt5 line bt">
                                                <div class="area">
                                                    <label for="inputid22" class="fl w80 text2 bold cm">근무처 주소</label>
                                                    <div class="ml80">
                                                        <div class="area">
                                                            <input type="text" class="input s1 fl w80" id="inputid22" name="cpost" value="${requestScope.memberInfo.cpost}" readonly/> 
                                                            <a href="javascript:openJusoPopup2();" class="btn form_s1 t1 fl ml5">주소검색</a>
                                                        </div>
                                                        <div class="area mt5">
                                                            <label for="company_add" class="ti">상세주소</label> 
                                                            <input type="text" class="input s1" id="company_add" name="company_add" value="${requestScope.memberInfo.company_add}" readonly /> 
                                                            <br> <input type="text" class="input s1" id="company_add_detail" name="company_add_detail" value="${requestScope.memberInfo.company_add_detail}" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="f_wrap line bb p5">
                                <div class="f_field div1">
                                    <div class="ff_title2">
                                        <strong>전화번호</strong>
                                    </div>
                                    <div class="ff_wrap ml120">
                                        <ul>
                                            <li>
                                                <div class="area">
                                                    <label for="inputid24" class="fl w80 text2 bold cm">근무처</label>
                                                    <input type="text" class="input s1 fl w100"
                                                        id="company_tel" name="company_tel"
                                                        value="${requestScope.memberInfo.company_tel}" style="ime-mode:disabled;width:150px;"  onKeyPress="return digit_check(event);" />
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="f_wrap line bb p5">
                                <div class="f_field div2">
                                    <label for="code_place" class="ff_title2"><strong>우편물 수신처</strong></label>
                                    <div class="ff_wrap ml120">
                                        <div class="area">
                                            <select class="select s2 w150" id="code_place" size="1"
                                                name="code_place" onChange="getMailAddChk(this.value);"></select>
                                        </div>
                                    </div>
                                </div>
                                <div class="f_field div2">
                                    <label for="code_call" class="ff_title2"><strong>수취인 호칭</strong></label>
                                    <div class="ff_wrap ml120">
                                        <div class="area">
                                            <select class="select s2 w150" id="code_call" name="code_call"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn_wrap mt30">
                <ul>
                    <li><a href="javascript:doWrite();" class="btn big t2">수정</a></li>
                    <li><a href="javascript:history.back();" class="btn big t1">취소</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="popup_company" class="p_style"
        style="width: 530px; height: 750px">
        <div id="popup">
            <div class="p_head" style="width: 500px;">
                <h2 class="title t3 cw bold s1 i_b_t6">근무처분류 상세보기</h2>
            </div>
            <div class="p_body text ca small center">
                <div class="p30">
                <img src="/images/common/popup_company.png" width="500" alt="" usemap="#imgmap" border="0">
                <div class="p_foot line bt">
                    <div class="btn_wrap mt20">
                        <ul>
                            <li><a href="#" class="bClose">닫기</a></li>
                        </ul>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
    

    <div id="popup_license" class="p_style"
        style="width: 600px; height: 270px">
        <div id="popup">
            <div class="p_head" style="width: 570px;">
                <h2 class="title t3 cw bold s1 i_b_t6">면허번호 중복확인</h2>
            </div>
            <div class="p_body text ca small center">
                <div class="p30">
                    <div class="area">면허번호를 입력해주세요.</div>
                    <div class="area mt20">
                        <input type="text" class="input s1 w200" id="ck_license"
                            name="ck_license" /> <a href="javascript:doCheckLicense();"
                            class="btn form_s1 p5 t1">검색</a> <a
                            href="javascript:doUseLicense();" class="btn form_s1 p5 t3"
                            id="use_button_license">사용</a>
                    </div>
                </div>
            </div>
            <div class="p_foot line bt">
                <div class="btn_wrap mt20">
                    <ul>
                        <li><a href="#" class="bClose">닫기</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="popup_id" class="p_style" style="width: 600px; height: 270px">
        <div id="popup">
            <div class="p_head" style="width: 570px;">
                <h2 class="title t3 cw bold s1 i_b_t6">아이디 중복확인</h2>
            </div>
            <div class="p_body text ca small center">
                <div class="p30">
                    <div class="area">아이디를 입력해주세요.</div>
                    <div class="area mt20">
                        <input type="text" class="input s1 w200" id="ck_id" name="ck_id" />
                        <a href="javascript:doCheckId();" class="btn form_s1 p5 t1">검색</a> <a href="javascript:doUseId();" class="btn form_s1 p5 t3" id="use_button_id">사용</a>
                    </div>
                </div>
            </div>
            <div class="p_foot line bt">
                <div class="btn_wrap mt20">
                    <ul>
                        <li><a href="#" class="bClose">닫기</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="popup_check" class="p_style"
        style="width: 600px; height: 270px">
        <div id="popup">
            <div class="p_head" style="width: 570px;">
                <h2 class="title t3 cw bold s1 i_b_t6">알림</h2>
            </div>
            <div class="p_body text ca small center">
                <div class="p30">
                    <div class="area">근무처가 변경되었습니다. 근무처분류도 수정하시겠습니까?</br>(※근무처정보에 따라 소속 시·도영양사회와 분과가 조정될 수 있습니다.)</div>
                    <!-- 
                    <div class="area mt20">
                        <input type="text" class="input s1 w200" id="ck_license"
                            name="ck_license" /> <a href="javascript:doCheckLicense();"
                            class="btn form_s1 p5 t1">검색</a> <a
                            href="javascript:doUseLicense();" class="btn form_s1 p5 t3"
                            id="use_button_license">사용</a>
                    </div>
                     -->
                </div>
            </div>
            <div class="p_foot line bt">
                <div class="btn_wrap mt20">
                    <ul>
                        <li><a href="#" onclick = "return true;"class="bClose">변경</a></li>
                        <li><a href="javascript:doWrite2();" class="bbutton">완료</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div id="popup_check2" class="p_style"
        style="width: 600px; height: 270px">
        <div id="popup">
            <div class="p_head" style="width: 570px;">
                <h2 class="title t3 cw bold s1 i_b_t6">알림</h2>
            </div>
            <div class="p_body text ca small center">
                <div class="p30">
                    <div class="area">입력하신 정보로 수정하시겠습니까?</div>
                    <!-- 
                    <div class="area mt20">
                        <input type="text" class="input s1 w200" id="ck_license"
                            name="ck_license" /> <a href="javascript:doCheckLicense();"
                            class="btn form_s1 p5 t1">검색</a> <a
                            href="javascript:doUseLicense();" class="btn form_s1 p5 t3"
                            id="use_button_license">사용</a>
                    </div>
                     -->
                </div>
            </div>
            <div class="p_foot line bt">
                <div class="btn_wrap mt20">
                    <ul>
                        <li><a href="#" onclick = "return true;"class="bClose">취소</a></li>
                        <li><a href="javascript:doWrite2();"  class="bbutton">확인</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</form>