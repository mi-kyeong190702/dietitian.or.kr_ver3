<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
   let msg = "${return_msg}";
   if(msg !== "") {
     alert(msg);
   }
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">MY</mark> 구매정보</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/kp_publishing_login.do" class="cm">MY 구매정보</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	    <div class="container">
		    <div class="header">주문 시 작성하신 이름, 휴대폰번호, 생년월일을 입력해주세요</div>
		    <form action="/work/publication/kp_publishing_action.do" name="frmColumn" modelAttribute="column" method="post">
		      <div class="form-group">
		        <label for="name">이름</label>
		        <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
		      </div>
		      <div class="form-group">
		        <label for="phone">휴대폰번호</label>
		        <input type="tel" id="phone" name="phone" placeholder="01012345678" pattern="[0-9]{10,11}" required>
		      </div>
		      <div class="form-group">
		        <label for="birth">생년월일(8자리)</label>
		        <input type="text" id="birth" name="birth" placeholder="YYYYMMDD" maxlength="8" pattern="[0-9]{8}" required>
		      </div><button type="submit" class="submit-btn">구매내역 조회</button>
		    </form>
		    <br><br>
		    <div><font size="3" color="red">※ 구매내역은 2025년 10월 1일 이후 주문 건부터 조회 가능합니다.</font></div>
	    </div>
	</div> 
</div> 
			
<style>
    body {
      font-family: 'Noto Sans', sans-serif;
      background: #f5f5f5;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 600px;
      margin: 60px auto;
      background: #fff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .container .header {
      font-size: 18px;
      font-weight: 500;
      margin-bottom: 24px;
      border-top: 2px solid #333;
      padding-top: 10px;
      color: #333;
    }
    .form-group {
      display: flex;
      align-items: center;
      margin-bottom: 16px;
    }
    .form-group label {
      width: 140px;
      font-weight: bold;
      color: #555;
    }
    .form-group input {
      flex: 1;
      padding: 8px 12px;
      font-size: 14px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .form-group input:focus {
      outline: none;
      border-color: #007bff;
      box-shadow: 0 0 0 2px rgba(0,123,255,0.2);
    }
    button.submit-btn {
      width: 100%;
      padding: 14px;
      font-size: 16px;
      background: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background 0.3s;
    }
    button.submit-btn:hover {
      background: #0056b3;
    }
  </style>
  <script> 
  function f_Action() {  
	  document.frmColumn.submit();
   }
  
  </script>
