<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.photo{
	/* position: relative; */
}
.filebox input[type="file"] {
	display: none;
}

.filebox label {
	position: absolute;
	width: 162px;
	height: 162px;
	top: 0;
    color: #fff;
    text-align: center;
    padding-top: 60px;
    border-radius: 50%;
    cursor: pointer;
	top: 85px;
	left: 10px;
}

/* named upload */
.filebox .upload-name {
	display: none;
}

/* imaged preview */
.filebox .upload-display {

}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 162px;
	height: 162px;
	border-radius: 50%;
	overflow: hidden;
	cursor: pointer;
	position: absolute;
	top: 85px;
	left: 10px;
}

.filebox .upload-display img {
	display: block;
	height: 100%;
}

.over {
    background:black;
    opacity:0.6;
}

.over:after{
    color:#fff;
    line-height: 3em;
    content:'프로필 사진 바꾸기';
    text-align:center;
    font-size:13px;
}

</style>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<div id="banner_wrap">
	<div id="banner" class="user">
		<div class="inner_wrap">
			<div class="inner">
				<div id="change_user_image" class="user_image i_wrap">
					<!-- <div class="image border_radius circle profile_image" id="btn-upload">
						<button type="button" id="btn-upload"></button>
					</div>
					<input type="file" id="file" name="file" onchange="changeValue(this)" />
					<div class="border_radius circle"></div> -->
					<div class="photo filebox bs3-primary preview-image">
						<div class="upload-display">
							<div class="upload-thumb-wrap">
								<img src="/fooding/resources/images/common/no-image.png">
							</div>
						</div>

						<!-- 현재 프로필인 사진 경로 -->
						<input class="upload-name" value="파일선택" disabled="disabled">
						<label for="input_file" class="img_text">&nbsp;</label>
						<input type="file" id="input_file" class="upload-hidden">

					</div>
					<!-- photo -->
				</div>
				<!-- change_user_image -->

				<div class="name">
					<span>${ userId }</span>
				</div>
				<!-- name -->
				<div class="intro">맛있는 발견의 즐거움 - Fooding</div>
				<div class="info">
					<a>예약 0</a> &nbsp; <a>리뷰 0</a>
				</div>
				<!-- info -->
			</div>
			<!-- inner -->
		</div>
		<!-- inner_wrap -->
	</div>
	<!-- banner.user -->
</div>
<!-- banner_wrap -->


<script type="text/javascript">
/* 	$(function() {
		$('#btn-upload').click(function(e) {
			e.preventDefault();
			$('#file').click();
		});
	});

	function changeValue(obj) {
		alert(obj.value);
	} */
	
	//프로필사진 변경
	$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});
	
	$(function(){
		$('.img_text').mouseover(function(){
			$(this).addClass('over');
		});
		$('.img_text').mouseout(function(){
			$(this).removeClass('over');
		});
	});
	
</script>
