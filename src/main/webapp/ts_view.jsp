<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <title>view</title>
    <!-- <link rel="stylesheet" type="text/css" href="sub.css"> -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">
   

<body>
  <jsp:include page="topBar.jsp"></jsp:include>
    <div class="container r_view">
       
           <div class="top_view_img" >
               
            <h1 style="padding-bottom: 20px;"> 아무튼 여기에 무슨 제목을 넣어야되는데</h1>
                <ul class="view_img_line" >
                    <li class="slide_1">
                        <img src ="./img/view_rank/20001000.png" class="view_img">
                    </li>
                    <li class="slide_2">
                        <img src ="./img/view_rank/20001001.png" class="view_img">
                    </li>
                    
                    <li class="slide_3">
                        <img src ="img/view_rank/20001002.png" class="view_img">
                    </li>
               </ul>  
                    
                    <button class="pr3" >
                        &lt;
                    </button>
                    <button class="nx3">
                        &gt;
                    </button>
                    
               
                    
               </div>
                     <div class="view_title">
                        <!-- 이름 -->
                        <p><h1>아무튼튼 제목</h1></p>
                            <!-- 주소 -->
                        <p>주소 : 어느행성</p>

                            <!-- 전화번호 -->
                        <p>번호 : none</p>
                        <p><button class="gbtn"><img src="img/other/like.PNG" class="hehe">좋아요</button>
                           <button class="gbtn"><span class="heart"> &#x2661;</span> 찜하기</button></p>
                        
                       </div>
                 </div>
                <!-- 사진3개만가능 -->
                <script type="text/javascript">
                    // 조정버튼
                    let a= 1;
                  
        
                        $('button.pr3').click(function(){
                        
                        if(a==1){
            
                            a=3;
                            $('.slide_1').css('opacity',0);
                            $('.slide_3').css('opacity',1); 
                          
                         
                       }
                       else{
                       $('.slide_'+a+'').css('opacity',0);
                       $('.slide_'+(a-1)+'').css('opacity',1);
                       a=a-1;
                       }
                       $('.pr3').prop('disabled',false);
                       })

                        $('button.nx3').click(function(){
                       
                        $('.slide_'+a+'').css('opacity',0);
                        $('.slide_'+(a+1)+'').css('opacity',1);
                        a=a+1;
                        if(a>3){
                            a=1;
                            $('.slide_'+3+'').css('opacity',0);
                        $('.slide_'+a+'').css('opacity',1);
                        }
                        })
                   
                      
                      
                //    cn1.style.transform='translate(0vw)';
                   </script>
                
               
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/
            bootstrap.bundle.min.js">
            
            </script>
              
              
              
       
          <div class="view_li">
            <ul >
                <!-- 건드리지말기 -->
           
                <li class="view_tab"><button class="sul">설명</button></li>
                <li class="view_tab"><button class="posi">위치</button></li>
                <li class="view_tab"><button class="riew">리뷰</button></li>
               <hr>
            </ul>
          </div>
        
           
            <script>
                $('button.sul').click(function(){
                    
                        $('.view_map').css('opacity',0);
                        $('.view_sul').css('opacity',1);
                        $('.view_riew').css('opacity',0);
                   
                })
                $('button.posi').click(function(){
                    
                        $('.view_map').css('opacity',1);
                        $('.view_sul').css('opacity',0);
                        $('.view_riew').css('opacity',0);
                })
                $('button.riew').click(function(){
                    
                    $('.view_map').css('opacity',0);
                    $('.view_sul').css('opacity',0);
                    $('.view_riew').css('opacity',1);
               
            })
            </script>
            <div class="view_result">
                <!-- 설명 -->
                <div class = "view_sul">스타크래프트의 3종족 중 하나인 프로토스의 고향 행성이자 옛 프로토스 제국의 수도성.
                    스타크래프트 세계관의 행성 중에서 두번째로 큰 행성. 
                    첫번째는 모리아 행성이고 세번째가 지구이다. 
                    국내 발매 당시 유통사에서 번역한 매뉴얼에는 '아이우'로 표기되기도 했었다.
                     프로토스라면 누구든간에 모두 자신의 모성인 아이어를 사랑할 만큼 그들의 고향에 대한 애착은 가히 절대적이다. 
                     지구와 크기와 중력이 비슷하며 물로 된 바다와 대륙이 있고, 달과 비슷한 크기의 위성까지 하나 있다. 
                     식생이 풍부해 행성 표면 대부분을 울창한 정글과 밀림이 뒤덮고 있다.
                    </div>
                    <div class = "view_map">
                        <!-- 지도 -->
                        지도가 들어갑ㄴ디ㅏ
                    </div>
                    <div class="view_riew">
                        <ul class="review_main">
                        <!-- review_no는 리뷰가 하나도 없을 떄 ul안에서 실행 -->
                            <li class="review_no" style="text-align: center;">
                             
                                <P style="padding-left: 2%;">
                               
                                리뷰가 없습니다. 리뷰를 작성해 주세요.</P>
                             
                        </li>
                     	<!-- review_in은 리뷰가 있을때 반복문으로 돌리면서 보여주면 되지않을까?
                     	vutton은 아 나중에구현해봄 -->
                            <li class="review_in">
                                <p class="review_id" style="padding-left: 5%;">
 							<p style="padding-left:5%">제목제목제목제목제목제목제목제목제목s</p>
                               <span style="padding-left: 70% ;position:relative;">날짜 0000-00-00</span>
                               <span style="padding-left:5%">대충아디가길어</span>
                                <hr style="color: black;">
                                <P style="padding-left: 2%;">
                               <img src="img/other/like.PNG" class="review_img">
                                리ddddddd
                                dddddddddddddddddddddd
                                ddddddddddddddddddddddddddd뷰</P>
                             
                                <P class="deleteandrebuild"><button>수정</button>
                                    <button>x</button></P>
                                   
                                        
                        </li>
                        <li class="review_in">
                            <p class="review_id" style="padding-left: 5%;">
                            <span>아이디</span>
                             <span style="padding-left: 70%">날짜 0000-00-00</span>
                            </p>
                            <hr style="color: black;">
                            <P style="padding-left: 2%;">
                           
                            리ddddddd
                            dddddddddddddddddddddd
                            ddddddddddddddddddddddddddd뷰</P>
                         
                            <P class="deleteandrebuild"><button>수정</button>
                                <button>x</button></P>
                               
                                    
                    </li>
                       
                        
                        </ul>
                        <div class="review_nologin">
                            <textarea class="textin" placeholder="로그인 후에 리뷰작성이 가능합니다!"disabled></textarea>
                            <!-- <input type="textbox" class = "textin" value="  리뷰가들어갑니다^^"> -->
                            <button class = "textinbtn" disabled="disabled">작성</button>
                        </div>
                        <div class="review_yeslogin">
                            <textarea class="texttitle" placeholder="제목을 작성해주세요" ></textarea>
                            <textarea class="textin" placeholder="리뷰를 작성해주세요" ></textarea>
                            
                            <!-- <input type="textbox" class = "textin" value="  리뷰가들어갑니다^^"> -->
                            <button class = "textinbtn">작성</button>
                        </div>
                       
                    </div>

             </div>
           
<%--     너가만든 아무튼그것
  <jsp:include page="topBar.jsp"></jsp:include>

	<a href="LikeCon.do?ts_name=${tsInfo.ts_name}">찜하기</a>
	<br>
	<h2>ts_name : ${tsInfo.ts_name}</h2>
	<h2>ts_tel: ${tsInfo.ts_tel}</h2>
	<h2>ts_ct: ${tsInfo.ts_ct}</h2>
	<h2>ts_add : ${tsInfo.ts_add}</h2>
	<h2>ts_loc : ${tsInfo.ts_loc}</h2>
	ts_img : <img src="${tsInfo.ts_img}">
	<h2>ts_info : ${tsInfo.ts_info}</h2>
	<h2>ts_views : ${tsInfo.ts_views}</h2>
	
	
	
	<c:choose>
		<c:when test="${empty review}">
			<h2>리뷰작성페이지 출력</h2>
		</c:when>
		<c:otherwise>
			<h3>${review.re_date}</h3>
		</c:otherwise>
	</c:choose>


<jsp:include page="bottomBar.jsp"></jsp:include> --%>
       
</body>
</html>