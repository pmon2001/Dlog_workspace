<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">

<style>
    .container-fluid input[type="text"], .container-fluid input[list="category"]{
        width:784px; 
        height: 35px; 
        border: .5px solid darkgrey;
        padding-left: 10px;
    }
    .card-body>label{
        margin: 13px 0;
    }
    #topicOptions{
        background:rgb(228, 228, 228);
        padding:20px;
        width:200px;
        position:relative;
        left:75px;
        top:-40px;
        display:none;
        margin-bottom: 0;
    }
    #topicSelected:hover, #topicBtn:hover{
        cursor: pointer;
    }
    
</style>
</head>
<body>
	
	<jsp:include page="../../common/diaryHeader.jsp"/>
	<!--**********************************
	    Content body start
	***********************************-->
	<div class="content-body" style="float: left;">
	    <div class="row page-titles mx-0">
	        <div class="col p-md-0">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="">프리노트</a></li>
	                <li class="breadcrumb-item active">글쓰기</li>
	            </ol>
	        </div>
	    </div>
	    <!-- row -->
	
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-12">
	                <div class="card" style="width:900px;">
	                    <div class="card-body">
	                        <form action="" type="get">
	                            <div align="center">
	                                <input type="text" name="title" placeholder="제목을 작성해주세요" required>
	                            </div>
	                            <div class="card-body" style="padding-top: 15px;">
	                                <textarea class="summernote" name="content">
	                                </textarea>
	                            </div>
	                            <div class="card-body" style="padding-top: 0px; padding-bottom: 0;">
	                                <label for="category1"><b>카테고리</b>&emsp;</label>
	                                <input list="category" name="category" id="category1" style="width: 160px;" required>
	                                <datalist id="category">
	                                    <option value="카테고리1">
	                                    <option value="카테고리2">
	                                    <option value="카테고리3">
	                                </datalist>
	                                <br>
	                                <label id="topicBtn" onclick="showTopic();"><b>주제 &nbsp;&gt;</b></label>&emsp;&emsp;&nbsp;<span id="topicSelected" onclick="showTopic();">주제 선택 안함</span>
	                                <br>
	                                <div id="topicOptions">   
	                                    <h5>주제 설정</h5>
	                                    <input type="radio" name="topic" id="art" value="엔터테인먼트/예술"><label for="art">&nbsp;엔터테인먼트/예술</label><br>
	                                    <input type="radio" name="topic" id="life" value="생활/노하우/쇼핑"><label for="life">&nbsp;생활/노하우/쇼핑</label><br>
	                                    <input type="radio" name="topic" id="hobby" value="취미/여가/여행"><label for="hobby">&nbsp;취미/여가/여행</label><br>
	                                    <input type="radio" name="topic" id="knowledge" value="지식/동향"><label for="knowledge">&nbsp;지식/동향</label><br>
	                                    <input type="radio" name="topic" id="none" value="주제선택안함" checked><label for="none">&nbsp;주제선택안함</label><br>
	                                </div>
	                                <label><b>공개 설정</b>&emsp;</label>
	                                <input type="radio" value="Y" id="privacyY" name="privacy" required><label for="privacyY">&nbsp;공개</label>&emsp;
	                                <input type="radio" value="N" id="privacyN" name="privacy" required><label for="privacyN">&nbsp;비공개</label>
	                                <br>
	                                <label><b>커뮤니티 공개 설정</b>&emsp;</label>
	                                <input type="radio" value="Y" id="commPrivacyY" name="commPrivacy"><label for="commPrivacyY">&nbsp;공개</label>&emsp;
	                                <input type="radio" value="N" id="commPrivacyN" name="commPrivacy"><label for="commPrivacyN">&nbsp;비공개</label>
	                                <br>
	                                <label><b>댓글 설정</b>&emsp;</label>
	                                <input type="radio" value="Y" id="commentY" name="comment"><label for="commentY">&nbsp;허용</label>&emsp;
	                                <input type="radio" value="N" id="commentN" name="comment"><label for="commentN">&nbsp;비허용</label>
	                            </div>
	                            <div class="card-body" id="moreOption" style="padding-top: 0px;display: none;">
	                                <label><b>커뮤니티 공개 설정</b>&emsp;</label>
	                                <input type="radio" value="Y" id="commPrivacyY" name="commPrivacy"><label for="commPrivacyY">&nbsp;공개</label>&emsp;
	                                <input type="radio" value="N" id="commPrivacyN" name="commPrivacy"><label for="commPrivacyN">&nbsp;비공개</label>
	                                <br>
	                                <label><b>댓글 설정</b>&emsp;</label>
	                                <input type="radio" value="Y" id="commentY" name="comment"><label for="commentY">&nbsp;허용</label>&emsp;
	                                <input type="radio" value="N" id="commentN" name="comment"><label for="commentN">&nbsp;비허용</label>
	                            </div>
	                            <div align="center">
	                                <button class="btn btn-secondary">취소</button>
	                                <input type="submit" value="등록" class="btn btn-success">
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- #/ container -->
	</div>        
	<!--**********************************
	    Content body end
	***********************************-->  
	
	<script>
        $(function(){
            $("input[name=privacy]").click(function(){
                if($(this).val()=='Y'){
                    $("input:radio[name='comment']").removeAttr("checked");
                    $("input:radio[name='commPrivacy']").removeAttr("checked");
                    $("input:radio[name='comment']").removeAttr("disabled");
                    $("input:radio[name='commPrivacy']").removeAttr("disabled");
                    
                }else{                            
                    $("input:radio[name='comment']").removeAttr("checked");
                    $("input:radio[name='commPrivacy']").removeAttr("checked");

                    $("#commPrivacyN").attr("checked", true);
                    $("#commentN").attr("checked", true);

                    $("input:radio[name='commPrivacy']").attr("disabled", true);
                    $("input:radio[name='comment']").attr("disabled", true);
                }
            })
        })

        function showTopic(){
            if($("#topicOptions").css("display")=="none"){
                $("#topicOptions").css("display", "block");
            }else{
                $("#topicOptions").css("display", "none");
            }
        }

        $("input[name=topic]").click(function(){
            $("#topicSelected").text($(this).val());
            $("#topicOptions").css("display", "none");
        })
    </script>
	
	
	<jsp:include page="../../common/diaryWidget.jsp"/>
	
	<jsp:include page="../../common/diaryFooter.jsp"/>

</body>
</html>