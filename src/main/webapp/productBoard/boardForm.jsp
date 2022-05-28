<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
	body{margin:0; padding:0;}

	*{box-sizing:border-box;}

	textarea{
		resize:none;
		border:0px;
	}
	
	.inputImage{
		margin:10px;
	}
	
	*{
		font-family: "맑은 고딕", serif;
	}

	/* 파일첨부영역 colspan 없이 좌우로 붙이기 */
    #tr td{
        float:left;
    }
    

	.filebox label {
    	display: inline-block;
    	padding: 7px 13px;
    	min-height:33.5px;
    	color: white;
    	background-color: dodgerblue;
    	cursor: pointer;
    	margin-left: 9px;
   	 	margin-right: 7px;
   	 	margin-top: 12px;
   	 	border-radius:4px;
   	 	font-weight:normal;
	}

	.filebox input[type="file"] {
    	position: absolute;
    	width: 0;
   	 	height: 0;
   	 	padding: 0;
    	overflow: hidden;
    	border: 0;
	}
	
	
	
</style>
</head>
<body>
	
	<div class="container">
	
	<div class="row">
	
	<div class="col-12 col-lg-7 m-auto">
	
	<div class="row">
	
	<div class="col-12">


	<form action="/writeConfirm.productBoard" method="post" enctype="multipart/form-data" id=form>
	
	<table class="table">
        <tr>
            <th style="text-align:center; vertical-align:middle; height:100px; font-size:2.5rem;">상품 등록하기
        </tr>
        <tr>
            <td>
            	&nbsp;
                <input type="text" id=title name=title placeholder="글 제목을 입력하세요." style="width:90%;">
            </td>
        </tr>
        <tr>
        	<td colspan="3" height=40>
        		&nbsp;
        		<select id=category name=category>
        			<option value=의류>의류
        			<option value=잡화>잡화
        			<option value=가전>가전
        			<option value=취미>취미
        			<option value=아동>아동
        			<option value=기타>기타
        		</select>
        		<span style="color:crimson;">&nbsp;* 카테고리</span>
        	</td>
        </tr>
        <tr>
        	<td colspan="3" height=40>
        		&nbsp;
        		<select id=sellingOptionSelect name=sellingOption>
        			<option value="물물교환 & 금전거래">물물교환 & 금전거래
        			<option value="물물교환만">물물교환만
        			<option value="금전거래만">금전거래만
        		</select>
        		<span style="color:crimson;">&nbsp;* 거래방식</span>
        	</td>
        </tr>
        <tr>
        	<td colspan=3 height=40>
        		&nbsp;
        		<input type=text id=pname name=pname placeholder="상품명을 입력해주세요.">
        	</td>
        </tr>
        <tr id=priceBox>
        	<td colspan="3" height=40>
        		&nbsp;
        		<input type=text id=submitPrice name=price placeholder="가격을 입력해주세요."> 원
        	</td>
        </tr>
        <tr>
        	<td colspan="3">
        		<button type=button class="btn btn-success" id=fileAddBtn style="width:120px; margin:10px;">파일첨부하기</button>
        	</td>
        </tr>
        
        <tr id="tr">
        	
        </tr>

		<tr>
			<td colspan="3"><br><textarea id=summernote class=summernote name=contents></textarea>
		</tr>
		
        <tr>
            <td colspan="3" align=center style="height:50px;">
                <a href="/list.productBoard?currPage=1"><input type="button" class="btn btn-primary" value="목록으로"></a>&nbsp;
                <button class="btn btn-primary">작성완료</button>
            </td>
        </tr>
    </table>
	
	</form>
	
	</div>
	
	</div>
	
	</div>
	
	</div>
	
	</div>
	
	
	
	
	<script>
	
		$("#title").focus()
		
        // 파일 첨부하기
        let i = 0
        
    	$("#fileAddBtn").on("click", function(){
    		
            i += 1
            
            if($(".td").length >= 3) {
            	alert("이미지는 최대 3장까지만 등록 가능합니다.")
            	return false
            }
            
            let td = $("<td class='td filebox' style='width:150px; padding:20px 0; padding-left:18px;'>")
            let previewImage = "<img style='width:135px; height:135px; object-fit:cover; border:1px solid black; border-radius:20px;' class=previewImage id=previewImage" + i + " src='https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image'>"
            let label = "<label for='inputImage" + i + "'>찾기</label>"
            let inputImage = "<input type=file style='width:77px; margin:auto; margin-bottom:10px;' class=inputImage id=inputImage" + i + " class=inputTypeFile accept='image/*' name=file" + i + ">"
			let deleteImgBtn = "<button type=button class='deleteImageBtn btn btn-danger' style='height:35px; margin-top:-4px;'>삭제</button>"
            
            td.append(previewImage)
			td.append(label)
    		td.append(inputImage)
            td.append(deleteImgBtn)
            
            $("#tr").append(td)

            $(".inputImage").on("change", function(e){
            	
                let input = e.target

                if(input.files && input.files[0]) {
                	// 첨부파일 사이즈 체크
                	var maxSize = 5 * 1024 * 1024;
            		var fileSize = input.files[0].size;

            		if(fileSize > maxSize){
            			alert("이미지 사이즈는 5MB 이내로 등록 가능합니다.");
            			$(this).val('');
            			return false;
            		}
                	
                	// 첨부파일 확장자 체크
                	pathpoint = input.value.lastIndexOf('.');
            		filepoint = input.value.substring(pathpoint+1,input.length);
            		filetype = filepoint.toLowerCase();
            		
            		// 정상적인 이미지 확장자 파일인 경우
            		if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
            			let reader = new FileReader()
                    	reader.onload = e => {
                       		$(this).siblings().attr("src", e.target.result)
                       		$(this).siblings().css("border", "none")
                    	}

                    	reader.readAsDataURL(input.files[0])

            		} else {
            			alert('이미지 파일만 업로드 하실 수 있습니다.');
						$(this).val("")
//             			$(this).closest(".td").remove()

            			return false;
            		}
                	
                }
            	
            })
            
            $(".deleteImageBtn").on("click", function(){
            	$(this).closest(".td").remove()
            })

		})
		
	
		// 판매방식 선택에 따른 가격입력칸 표시
		$("#sellingOptionSelect").on("change", function(){
			console.log("test")
    			if($(this).val() == "물물교환 & 금전거래") {
    				$("#submitPrice").removeAttr("disabled")
    				$("#submitPrice").val("")
    			} else if($(this).val() == "물물교환만") {
    				$("#submitPrice").attr("disabled", "")
    				$("#submitPrice").val("없음")
    			} else if($(this).val() == "금전거래만") {
    				$("#submitPrice").removeAttr("disabled")
    				$("#submitPrice").val("")
    			}
    	})
		
		
		// 썸머노트
		$('.summernote').summernote({
			disableResizeEditor : false,
			height : 400,
			leng : 'ko-KR',
			disableDragAndDrop : true,
		  	toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
// 			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  	});
		
		
		// 제출시
		$("#form").on("submit", function(){
			
			// 가격 정규표현식
			let priceRegex = /^[\d]{1,10}$/g;
			let inputPrice = $("#submitPrice").val()
			
			if($("#title").val() == "") {
				alert("제목을 입력해주세요.")
				$("#title").focus()
				return false
			} else if($("#pname").val() == "") {
				alert("상품명을 입력해주세요.")
				$("#pname").focus()
				return false
			} else if($("#sellingOption").val() != "물물교환만") {
				if($("#price").val() == "") {
					alert("가격을 입력해주세요.")
					$("#price").focus()
					return false
				} else if(priceRegex.test(inputPrice) == false && inputPrice != "없음") {
					alert("가격을 숫자로만 입력해주세요.")
					$("#price").focus()
					return false
				}
			} 
			
			// else if 로 작성하면 왜인지 작동하지 않는다.
			if($("#summernote").summernote('isEmpty')) {
				alert("내용을 입력해주세요.")
				$("#summernote").summernote('focus')
				return false
			}
			
			// 이미지는 최소 1장 이상 첨부하도록 한다
			if($(".td").length == 0 || $(".inputImage").val() == "") {
				alert("상품이미지를 한 장 이상 등록해주세요.")
				return false
			}
			
			if(confirm("상품게시글을 등록하시겠습니까?")) {
				$("#submitPrice").removeAttr("disabled")
				return true
			} else {
				return false
			}
			
		})
		
	</script>
	
	
</body>
</html>