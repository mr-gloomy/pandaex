<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 헤더 -->	
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/css.jsp" %>
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- css -->
<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 

<style type="text/css">
.form-check-input {
    position: absolute;
    margin-top: 0.25rem;
    margin-left: 0rem;
}
.select_img {
	margin: 20px;
}
.cl0 {
    color: #1d1d1d;
}
.container {
    max-width: 1399px;
    
}
</style>
</head>
<body class="animsition">
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-10 p-tb-92" >
	<h2 class="ltext-105 cl0 txt-center">
		중고상품등록
	</h2>
</section>

<!-- Content page -->
 <section class="bg0 p-t-75 p-b-120">
  <div class="container">
	<form action="regist" method="post" enctype="multipart/form-data">
	  <div class="row mb-3">
	  	<!-- 상품번호 --> 
	    <input type="hidden" name="goods_no">
	    <!-- 상품찜 -->
	    <input type="hidden" name="goods_like" value="off">
	    <!-- 판매현황 --> 
	    <input type="hidden" name="goods_trade" value="판매중">
	    <!-- 작성자 -->
	    <input type="hidden" name="${sessionScope.user_nick}" value="user_nick">
	    
	  	<!-- 보이는 항목 -->
	    <table>
	      <tr>
    		<th>이미지</th>
    		<td>
    		<div class='uploadDiv'>
    			<input type="file" name="uploadFile" id="goods_img" multiple="multiple">
    		</div>
    		
    		<div class='uploadResult'>
				<ul>
		
				</ul>
			</div>
    		
    			<br> <b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b> 
				<br>- 상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여집니다. 
				<br>- 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다. 
				<br>- 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다. 
				<br>- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다. 
				<br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다. 
				<br>최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
	    	  </td>
	    	</tr>
	    	<tr>
	    	  <th>카테고리</th>
    		  <td>
    		    <select class="form-select" name="goods_category" >
				  <option selected>카테고리를 입력하세요</option>
				  <option value=".machine">전자기기</option>
				  <option value=".beauty">의류/뷰티/잡화</option>
				  <option value=".kitchen">생활가전/주방</option>
				  <option value=".interior">인테리어/가구</option>
				  <option value=".book">도서/티켓/교환권</option>
				  <option value=".food">식품</option>
				  <option value=".etc">기타 중고물품</option>
			    </select>
    		  </td>
	    	</tr>
	    	<tr>
	    		<th>상품명</th>
	    		<td>
	    		  <input type="text" class="form-control" name="goods_title" placeholder="제목을 입락하세요.">
	    		</td>
	    	</tr>
	    	<tr>
	    	  <th>상품상태</th>
	    		<td>
	    		  <div class="col-sm-10">
			       <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="goods_condition" value="새상품">
					  <label class="form-check-label" for="inlineRadio1">새상품</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="goods_condition" value="거의 새 것">
					  <label class="form-check-label" for="inlineRadio2">거의 새 것</label>
				  	</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="goods_condition" value="사용감 있음">
					  <label class="form-check-label" for="inlineRadio3">사용감 있음</label>
				    </div>
		
				   </div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>상품환불여부</th>
	    		<td>
	    		  <div class="col-sm-10">
		    		<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="goods_refund" value="가능">
					  <label class="form-check-label" for="inlineRadio1">가능</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="goods_refund" value="불가능">
					  <label class="form-check-label" for="inlineRadio2">불가능</label>
				  	</div>
				  </div>
	    		</td>
	    	</tr>
	    	<tr>
    		<th>가격제안여부</th>
    		   <td>
	    		<div class="col-sm-10">
			       <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="goods_discount" value="가능">
					  <label class="form-check-label" for="inlineRadio1">가능</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="goods_discount" value="불가능"> 
					  <label class="form-check-label" for="inlineRadio2">불가능</label>
				  	</div>
			   	</div>
    		  </td>
	    	</tr>
	    	<tr>
    		  <th>상품가격</th>
    		  <td>
    		    <input type="number" class="form-control" name="goods_price" placeholder="금액을 입력하세요.">
    		  </td>
	    	</tr>
	    	<tr> 
	    	  <th>상품소개</th>
	    	  <td>
	    		 <textarea id="summernote" name="goods_detail"></textarea>
	    		 <script>
    			  $('#summernote').summernote({
    			        placeholder: '내용을 입력해주세요.',
    			        tabsize: 2,
    			        height: 120,
    			        toolbar: [
    			          ['style', ['style']],
    			          ['font', ['bold', 'underline', 'clear']],
    			          ['color', ['color']],
    			          ['para', ['ul', 'ol', 'paragraph']],
    			          ['table', ['table']],
    			          ['insert', ['link', 'picture', 'video']],
    			          ['view', ['fullscreen', 'codeview', 'help']]
    			        ]
    			      });
				 </script>
	    	  </td>
	    	</tr>
		</table>
		<!-- 버튼 -->
		<div class="col-sm-7" align="center" style="margin: 20px">
	            <button type="submit" class="btn btn-primary" id="uploadBtn">작성완료</button>
	            <button type="reset" class="btn btn-primary">초기화</button>
	            <button type="submit" class="btn btn-primary">목록이동</button>
	  	</div>
    </form>
    </div>
</section>	
<!--   푸터 -->
<%@ include file="../include/footer.jsp" %>
</body>
</html>