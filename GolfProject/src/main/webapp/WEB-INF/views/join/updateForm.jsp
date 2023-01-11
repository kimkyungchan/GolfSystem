<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../sections/header.jsp"/>

<style>
   .orange{background-color: orange; width: 50px;}
   table{border-collapse : collapse; width: 800px;}
</style>

<form method="post" id="updateform" action="/join/update" >
<input type="hidden" name="_method" value="put">
   <table border="1">
      <tr>   
         <td class="orange">제목</td>
         <td><input name="subject" value="${dto.subject }"/>
            <input name="no" value="${dto.no}" type="hidden"> 
         </td>
      </tr>
      <tr>
         <td class="orange">작성자</td>
         <td><input name="id" value="${dto.id}" readonly></td>
      </tr>
      <tr>
         <td class="orange">내용</td>
         <td><div id="smarteditor">
           <textarea name="content" id="editorTxt" 
                  rows="20" cols="10" 
                  style="width: 100%"></textarea></div></td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit" id="save" value="수정"> 
         </td>
      </tr>
   </table>

</form>

<jsp:include page="../sections/footer.jsp"/>