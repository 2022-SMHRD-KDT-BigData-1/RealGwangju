<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<style>
.cc {
   display : inline-block;
   font-size: 20px;
   width: 800px;
}

table {
   border-bottom: 3px solid;
   border-width: 0px;
   border-color: black;
   border-style: solid;
}

th, td {
   
}

input[type="checkbox"]+label {
   display: inline-block;
   width: 35px;
   height: 35px;
   border: 3px solid #707070;
   position: relative;
}

input[type="checkbox"]:checked+label::after {
   content: '✔';
   font-size: 25px;
   width: 35px;
   height: 35px;
   text-align: center;
   position: absolute;
   left: 0;
   top: 0;
}

input[type="checkbox"] {
   display: none;
}

.f {
   margin-left: 10%;
}
</style>
</head>
<body>

   <jsp:include page="topBar.jsp"></jsp:include>
   <form action="DeleteLikeListCon.do" class="f">
      <h1 align="left">[ 찜 목록 ]</h1>
      <input type='checkbox' name='selectall' value='selectall' id="cb1"
         onclick='selectAll(this)' /> <label for="cb1"></label><b>전체선택</b> <input
         type="submit" value="선택삭제"
         style="background-color: white; border-radius: 10%;">
      <!-- <button type="button" onclick="allCheck()">전체선택</button -->
      <c:choose>
         <c:when test="${empty likeList}">
            <h2>찜목록이 없어요</h2>
         </c:when>
         <c:otherwise>
            <table>
               <c:forEach var="e" items="${likeList}" varStatus="status">
                  <tr>
                     <td><input type="checkbox" id="cb${status.index+2}"
                        name="delete_ts_nameList" value="${e.ts_name}"><label
                        for="cb${status.index+2}"></label></td>
                     <td><a href="Ts_viewCon.do?visit_name=${e.ts_name}">
                     <img src="${e.ts_img}" width="230px" height="180px"> 
                           <p align="center">${e.ts_name}</p>
                     <!-- </a> --></td>
                     <td><a href="Ts_viewCon.do?visit_name=${e.ts_name}"><span
                              class="cc">${e.ts_info}</span></a></td>
                  </tr>
               </c:forEach>
            </table>
         </c:otherwise>
      </c:choose>
   </form>
   <jsp:include page="bottomBar.jsp"></jsp:include>
   <script src="./assets/js/jquery-3.6.0.min.js"></script>
   <script>
      function selectAll(selectAll)  {
           const checkboxes = document.getElementsByName('delete_ts_nameList');
           checkboxes.forEach((checkbox) => {
             checkbox.checked = selectAll.checked
           })
      }

   </script>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<style>
.likeList {
   
}

ul, li {
   
}

ul, ol {
   list-style-type: none;
}

ul {
   overflow: hidden;
}

li {
   
}

.allLikeList {
   
}

.likeListImg {
   display: inline-block;
   font-size: 20px;
}

img {
   
}
</style>
</head>
<body>

   <jsp:include page="topBar.jsp"></jsp:include>

   <form action="DeleteLikeListCon.do">
      <input type="submit" value="선택삭제"
         style="background-color: white; border-radius: 10%;">
      <!-- <button type="button" onclick="allCheck()">전체선택</button -->
      > <input type='checkbox' name='selectall' value='selectall'
         onclick='selectAll(this)' /> <b>Select All</b>
      <c:choose>
         <c:when test="${empty likeList}">
            <h2>찜목록이 없어요</h2>
         </c:when>
         <c:otherwise>
            <h1>찜한 목록</h1>
            <ul>
               <c:forEach var="e" items="${likeList}">
                  <li><a href="Ts_viewCon.do?visit_name=${e.ts_name}"> <!-- <div class="likeList"> -->
                        <div class="allLikeList">
                           <input type="checkbox" name="delete_ts_nameList"
                              value="${e.ts_name}">
                           <div class="likeListImg">
                              <img src="${e.ts_img}" width="300px" height="300px">
                           </div>
                           <div display:inline;>
                              <span>${e.ts_name}</span>
                           </div>
                           <div display:inlinek;>
                              <span>${e.ts_info}</span>
                           </div>
                           <!-- </div> --></a></li>

                  <div>
                  <input type="checkbox" name="delete_ts_nameList"
                     value="${e.ts_name}"> <a
                     href="Ts_viewCon.do?visit_name=${e.ts_name}"> <img
                     src="${e.ts_img}"> <span>${e.ts_name}</span>
                  </a>
               </div>
                  </div>
               </c:forEach>
            </ul>
         </c:otherwise>
      </c:choose>
   </form>
   <jsp:include page="bottomBar.jsp"></jsp:include>
   <script src="./assets/js/jquery-3.6.0.min.js"></script>
   <script>
      function selectAll(selectAll)  {
           const checkboxes = document.getElementsByName('delete_ts_nameList');
           checkboxes.forEach((checkbox) => {
             checkbox.checked = selectAll.checked
           })
      }

   </script>
</body>
</html> --%>