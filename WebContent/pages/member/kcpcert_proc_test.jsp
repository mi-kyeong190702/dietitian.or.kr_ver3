


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>*** KCP Online Payment System [Jsp Version] ***</title>
        <script type="text/javascript">
            window.onload=function()
            {
                try
                {
                    opener.auth_data( document.form_auth ); // 부모창으로 값 전달

                    window.close();// 팝업 닫기
                }
                catch(e)
                {
                    alert(e); // 정상적인 부모창의 iframe 를 못찾은 경우임
                }
            }
        </script>
    </head>
    <body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
        <form name="form_auth" method="post">
            <input type="hidden" name="DI" value=""/>
            <input type="hidden" name="cert_enc_use" value="Y"/>
            <input type="hidden" name="server_hash" value=""/>
            <input type="hidden" name="Ret_URL" value="MjAxNzA5MTUwOTMzMDje2Zu1eUvr8LTnJV8TmJygh3OCgTVHfbl7TJc%2FeqqSf3mPAETmLLtj2G1Jb8NmP0xt%2B3cNdDh57E%2FXAnIupUV61seCBxsKzglk5xAxSxysR2UrLSIEVkBLknFBCtSrWeBJ7IHp9Jo63l25ciXdFl%2F%2By4bkPDYsZ16ZFFEpZ53FIkChZOtjbYA%2FmzyB3C78XZI%3D"/>
            <input type="hidden" name="Ret_Noti" value=""/>
            <input type="hidden" name="DI_URL" value=""/>
            <input type="hidden" name="cert_02_yn" value="Y"/>
            <input type="hidden" name="log_trace_no" value="V2175bIBKs7KJvTC"/>
            <input type="hidden" name="per_cert_no" value="20170915434609"/>
            <input type="hidden" name="birth_day" value=""/>
            <input type="hidden" name="reg_dt" value=""/>
            <input type="hidden" name="re_otp" value=""/>
            <input type="hidden" name="dn_hash" value="375C2C995DD60873FB945BDC9B87B7C98DB52CF6"/>
            <input type="hidden" name="user_name_url_yn" value=""/>
            <input type="hidden" name="sex_code" value=""/>
            <input type="hidden" name="ordr_idxx" value="TEST201709150933040000619"/>
            <input type="hidden" name="cert_guard_yn" value="N"/>
            <input type="hidden" name="comm_id" value="SKT"/>
            <input type="hidden" name="otp_no_vKey" value=""/>
            <input type="hidden" name="CI_ENC_YN" value=""/>
            <input type="hidden" name="web_siteid_hashYN" value=""/>
            <input type="hidden" name="phone_no" value=""/>
            <input type="hidden" name="otp_no_rKey" value=""/>
            <input type="hidden" name="cert_01_yn" value="Y"/>
            <input type="hidden" name="up_hash" value="77A6E6E74F5526DB41728E24349FD8E5A9A996C3"/>
            <input type="hidden" name="cert_no" value="20170915434609"/>
            <input type="hidden" name="enc_cert_data" value="419E06B8FC3E9366C87830E0F348B0391D3D983849C4D017A89D76BAE5589FF0C7B65D8793E30FC4F1920C95F68A69904FBCC6FE893139EE3ACC6C30329035E8D25B4E5A1053E8410F08AC2A4067F0975CE35E9872FBC34EF8389111B9013E7C52E39BD918622CAABC2D77F58C7D071333917A03D36CC37572C1098E47EF1DBE5F81ACBE009DDE33DA2497AC9023F12EEBB6FD44DC4EC6393471BBA2F1871DC4723E6C05E41799A1BE7A199CE1617DD8E9DA704BA8902235658EB10F20BCC0CD950B4DF410C623C01713F2CEBF20F58978D53050D69484DD291B91B212846AE62476CD36DDF1F55F03FD01E931980979CF46B7DDC73BFAB982F8BA20E0DE51045ED850EDD799019F0C8221F05FFE47849A7EC78C8A3320A7A757CADF70FD7D814DF0FBFF274ECE33F9C5A6C77FD1C3C52294B641CDDF2C47CE260830866FC762EA0D6C335A070647617A7E4C05BA54642CAB6DE712B93B8572FFC710C4E85734EFBAB6496CFA1B38AFF3115A04A06EFF3FD64A1B0A61624CCC788ECA60B2C183606F7D7813009E207C34DE61A71EE2D49F580BA4A16362B8ECA03CC8E4F8A4F07771DF3C9D2D6F2DC661BE1EDE051E32CEC99F2D172488AEA1E2FFB81D1E9A533F2089DDCB411F92DEDEDE4B1055A35789396FDD890D6617CD1CD85662A988D4B07D68F3C5A4600E5BAA82742BBC3FA0"/>
            <input type="hidden" name="local_code" value=""/>
            <input type="hidden" name="site_cd" value="J00290000001"/>
            <input type="hidden" name="cert_otp_use" value="N"/>
            <input type="hidden" name="Logo_URL" value=""/>
            <input type="hidden" name="info_code" value=""/>
            <input type="hidden" name="res_cd" value="0000"/>
            <input type="hidden" name="safe_guard_yn" value="N"/>
            <input type="hidden" name="res_msg" value="???????"/>
            <input type="hidden" name="CI" value=""/>
            <input type="hidden" name="site_key" value=""/>
            <input type="hidden" name="web_siteid" value=""/>
            <input type="hidden" name="param_opt_1" value="opt1"/>
            <input type="hidden" name="param_opt_2" value="opt2"/>
            <input type="hidden" name="param_opt_3" value="opt3"/>
            <input type="hidden" name="CI_URL" value=""/>
            <input type="hidden" name="site_url" value="dietitian.or.kr"/>
            <input type="hidden" name="user_name" value=""/>
            <input type="hidden" name="req_tx" value="otp_auth"/>
        </form>
    </body>
</html>
