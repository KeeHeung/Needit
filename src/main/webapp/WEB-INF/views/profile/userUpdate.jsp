<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<c:import url="/WEB-INF/views/layout/header.jsp" />   

    




<div class="container">

<h1>회원수정페이지</h1>
<hr>

  <div class="panel panel-default">
    <div class="panel-heading">회원정보수정 양식</div>
    <div class="panel-body">
      <form name="frm" action="${contextPath}/memUpdate.do" method="post">
         <input type="hidden" id="id" name="id" value="${User.id}"/>
         <input type="hidden" id="pw" name="pw" value=""/>
         <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td>
             <td>${User.id}</td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호</td>
             <td colspan="2"><input id="pw1" name="pw1" onkeyup="passwordCheck()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호확인</td>
             <td colspan="2"><input id="pw2" name="pw2" onkeyup="passwordCheck()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 확인하세요."/></td>            
           </tr>
            <tr>
             <td style="width: 110px; vertical-align: middle;">사용자 이름</td>
             <td colspan="2"><input id="name" name="name" class="form-control" type="text" maxlength="20" placeholder="이름을 입력하세요." value="${User.name}"/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">성별</td>
             <td colspan="2">
                <div class="form-group" style="text-align: center; margin: 0 auto;">
                    <div class="btn-group" data-toggle="buttons">
                       <label class="btn btn-primary <c:if test="${User.gender eq 'M'}"> active</c:if>">
                         <input type="radio"  name="memGender" autocomplete="off" value="남자" 
                           <c:if test="${User.gender eq 'M'}"> checked</c:if> />남자
                       </label>
                        <label class="btn btn-primary <c:if test="${mvo.memGender eq '여자'}"> active</c:if>">
                         <input type="radio"  name="memGender" autocomplete="off" value="여자"
                           <c:if test="${User.gender eq 'F'}"> checked</c:if> />여자
                       </label>
                    </div>                    
                </div>
             </td>            
           </tr> 
           <tr>
             <td style="width: 110px; vertical-align: middle;">이메일</td>
             <td colspan="2"><input id="memEmail" name="memEmail" class="form-control" type="text" maxlength="20" placeholder="이메일을 입력하세요." value="${mvo.memEmail}"/></td>            
           </tr>
		</table>
      </form>    
    </div>
   

   
  </div>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />