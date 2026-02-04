package kda.utils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import javax.net.ssl.SSLContext;
import org.apache.http.client.methods.*;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.*;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class NhnAlimtalkWithSmsFallback {

    // === NHN Cloud keys ===
    private final String alimtalkAppKey;   // 알림톡 appKey
    private final String alimtalkSecret;   // 알림톡 X-Secret-Key
    private final String smsAppKey;        // SMS appKey
    private final String smsSecret;        // SMS X-Secret-Key

    // 알림톡/ SMS 엔드포인트 (버전은 가이드 최신 문서에 맞추세요)
    private static final String ALIMTALK_SEND_URL_FMT =
            "https://api-alimtalk.cloud.toast.com/alimtalk/v2.3/appkeys/%s/messages";
    // ↑ v2.3 가이드 기준 엔드포인트 (문서상의 베이스/버전은 가이드 확인)  :contentReference[oaicite:6]{index=6}
    private static final String SMS_SEND_URL_FMT =
            "https://api-sms.cloud.toast.com/sms/v2.4/appKeys/%s/sender/sms";     
    private static final String MMS_SEND_URL_FMT =
            "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/%s/sender/mms";
    
    private final CloseableHttpClient client;

    public NhnAlimtalkWithSmsFallback(String alimtalkAppKey, String alimtalkSecret,
                                      String smsAppKey, String smsSecret) throws Exception {
        this.alimtalkAppKey = alimtalkAppKey;
        this.alimtalkSecret = alimtalkSecret;
        this.smsAppKey = smsAppKey;
        this.smsSecret = smsSecret;

        // TLS 1.2 강제 
        SSLContext sslContext = SSLContexts.custom().useProtocol("TLSv1.2").build();
        
        SSLConnectionSocketFactory sf = new SSLConnectionSocketFactory(
        		sslContext,
                new String[]{"TLSv1.2"},
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER // ★ 4.3.x 방식
        ); 
         
        RequestConfig rc = RequestConfig.custom()
                .setConnectTimeout(7000).setSocketTimeout(10000).build(); 
        this.client = HttpClients.custom()
                .setSSLSocketFactory(sf)
                .setDefaultRequestConfig(rc)
                .build(); 
        
        System.out.println("javax.net.ssl.trustStore = " + System.getProperty("javax.net.ssl.trustStore")); // null이면 기본은 <java.home>\lib\security\cacerts
    }

    /**
     * 알림톡 전송 + 실패 시 SMS 대체
     * @param senderKey   카카오 비즈 채널 SenderKey (알림톡)
     * @param templateCode 알림톡 템플릿 코드
     * @param to          수신번호 (예: 01012345678)
     * @param body        템플릿 변수 치환이 끝난 메시지(알림톡)
     * @param smsSendNo   SMS 발신번호 (SMS 서비스에 등록된 번호)
     * @param smsBody     SMS 본문(90byte/국문45자 이내 권장)  :contentReference[oaicite:8]{index=8}
     */
    public boolean sendWithFallback(String templateCode,
                                   String to, JSONObject body, String title,
                                   String smsSendNo, String smsBody) throws IOException {

        boolean alimOk = sendAlimtalk( templateCode, to, body); 
    	 
        if (alimOk) return true;

        // 알림톡 실패 판단 시 SMS로 대체
        return sendLmsMms(title, smsBody, smsSendNo, to);
    }

    // === 알림톡 전송 ===
    public boolean sendAlimtalk(String templateCode, String to, JSONObject body) throws IOException {
        String url = String.format(ALIMTALK_SEND_URL_FMT, alimtalkAppKey);
        
        //알림톡 센더키
        String senderKey  = "3a59e0b288e88706a879c2bb0b8418dea7882a55";

        JSONObject req = new JSONObject();
        req.put("senderKey", senderKey);
        req.put("templateCode", templateCode); 
        // 수신자 리스트
        JSONObject r = new JSONObject();
        r.put("recipientNo", to);
        r.put("templateParameter", body);
        
        JSONArray recips = new JSONArray();
        recips.add(r);
        req.put("recipientList", recips);

        HttpPost post = new HttpPost(url);
        post.setHeader("Content-Type", "application/json;charset=UTF-8");
        post.setHeader("X-Secret-Key", alimtalkSecret); // :contentReference[oaicite:9]{index=9}
        post.setEntity(new StringEntity(req.toJSONString(), StandardCharsets.UTF_8));

        HttpResponse resp = client.execute(post);
        int code = resp.getStatusLine().getStatusCode();
        String json = EntityUtils.toString(resp.getEntity(), StandardCharsets.UTF_8);

        
        System.out.println("code:::::" + code);
        System.out.println("json:::::" + json);
        // 구현 포인트:
        // 1) HTTP 200인지
        // 2) 응답 JSON의 resultCode/resultStatus로 성공 여부 판단(가이드 기준)
        //    실패 사유(템플릿 불일치, 친구톡 전환 불가 등)에 따라 바로 SMS 대체
        return code == 200 && json.contains("\"resultMessage\":\"success\"");
        // ↑ 실제 필드명은 가이드의 응답 스펙에 맞춰 파싱하세요.
    }

    // === SMS 전송 ===
    public boolean sendSms(String sendNo, String to, String body) throws IOException {
        String url = String.format(SMS_SEND_URL_FMT, smsAppKey);

        JSONObject req = new JSONObject();
        req.put("sendNo", sendNo);
        req.put("body", body);

        JSONObject recipient = new JSONObject();
        recipient.put("recipientNo", to); // 국내 형식
        JSONArray rs = new JSONArray();
        rs.add(recipient);
        req.put("recipientList", rs); 

        HttpPost post = new HttpPost(url);
        post.setHeader("Content-Type", "application/json;charset=UTF-8");
        post.setHeader("X-Secret-Key", smsSecret);
        post.setEntity(new StringEntity(req.toJSONString(), StandardCharsets.UTF_8));

        HttpResponse resp = client.execute(post);
        int code = resp.getStatusLine().getStatusCode();
        String json = EntityUtils.toString(resp.getEntity(), StandardCharsets.UTF_8);
        return code == 200 && json.contains("\"status\":\"READY\"");
        // SMS는 READY/COMPLETED 등 상태가 다를 수 있습니다. 최신 가이드 응답코드에 맞게 수정하세요. :contentReference[oaicite:10]{index=10}
    }
    
    public boolean sendLmsMms(String title, String body, String sendNo, String to) throws IOException {
        String url = String.format(MMS_SEND_URL_FMT, smsAppKey);

        // 최소 유효성 (제목 120자, 본문 4000자 내)
        if (title == null) title = "";
        if (body == null) body = "";
        if (title.length() > 120) title = title.substring(0, 120);
        if (body.length() > 4000) body = body.substring(0, 4000);

        org.json.simple.JSONObject req = new org.json.simple.JSONObject();
        req.put("title", title);
        req.put("body", body);
        req.put("sendNo", sendNo);

        org.json.simple.JSONObject recipient = new org.json.simple.JSONObject();
        recipient.put("recipientNo", to);

        org.json.simple.JSONArray list = new org.json.simple.JSONArray();
        list.add(recipient);
        req.put("recipientList", list);

        HttpPost post = new HttpPost(url);
        post.setHeader("Content-Type", "application/json;charset=UTF-8");
        post.setHeader("X-Secret-Key", smsSecret);

        post.setEntity(new StringEntity(req.toJSONString(), StandardCharsets.UTF_8));

        HttpResponse resp = client.execute(post);
        int code = resp.getStatusLine().getStatusCode();
        String json = EntityUtils.toString(resp.getEntity(), StandardCharsets.UTF_8);

        // v3.0 응답은 header.isSuccessful / resultCode / resultMessage를 봅니다.
        // (빠르게는 문자열 포함 체크, 실서비스는 JSON 파싱 권장)
        boolean ok = code == 200 && json.contains("\"isSuccessful\":true");
        System.out.println("[LMS/MMS] http=" + code + " body=" + json);
        return ok;
    }

    public void close() throws IOException { 
    	client.close(); 
    }
 
}