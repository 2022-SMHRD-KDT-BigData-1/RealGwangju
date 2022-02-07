/**
 * 
 */

function likeListLoginCheck(){
	 let member = '<%=(MemberDTO)session.getAttribute("member")%>';

          if(member=="null"){ 
             alert("로그인이 필요한 항목입니다. 회원 가입 또는 로그인을 해주세요"); 
          }
          else{
             location.href='likeList.jsp';
          }
}

function likeConLoginCheck(){
	 let member = '<%=(MemberDTO)session.getAttribute("member")%>';

          if(member=="null"){ 
             alert("로그인이 필요한 항목입니다. 회원 가입 또는 로그인을 해주세요"); 
          }
          else{
             location.href='LikeCon.do?ts_name=<%=ts.getTs_name()%>';
          }
}