<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기자재 목록 </title>
<script type="text/javascript">
    var result ='${msg}';
    
    if(result == '성공'){
        alert(result+'입니다.');
    }else{
        alert(result+'게시판등록 실패입니다.');
    }
    
    
    <!-- 오빠꺼 보고 한거 -->
	function search() {
		var name = document.getElementById("searchName").value;
		console.log(name);
				
		location.href = "/"+"?Option=Search&Name="+name;
		//location.href="/"+"?Option=Modify&Name=${dataVO.name}&PhoneNumber=${dataVO.phoneNumber}&Address1=${dataVO.address1}&Address2=${dataVO.address2}&Time=${dataVO.time}";
	}
</script>
 
 
</head>
<body>
 	<div class="contents">
 	 	<!-- 맨 윗상단 메뉴 -->
        <div class="header">
            <p>기자재 관리</p>
        </div>
        
        <!-- 컨텐츠 내용 -->
        
            <div class="contents-body">
            	<div class="body-board">
                	<div class="filter">
                    <p>검색하기</p>
                    <input type="text" class="inp_long" id="searchName">
               		</div>
               		
               		<div class="filter">
	                    <p>지역검색</p>
	                    <select>
	                        <option>서울</option>
	                        <option>대전</option>
	                        <option>부산</option>
	                    </select>
	                    <select>
	                        <option>강남구</option>
	                        <option>ㅇㅇ구</option>
	                        <option>ㅇㅇ구</option>
	                    </select>
	                    <select>
	                        <option>도곡동</option>
	                        <option>ㅇㅇ동</option>
	                        <option>ㅇㅇ동</option>
	                    </select>

                    	<button class="btn submit_btn" onclick="search()">검색</button>
                	</div>
                </div>
                <div class="body-board">
                <div class="board_head">
                    <p>스터디카페 목록 (총 100개)
                        <select>
                            <option>10개씩</option>
                            <option>20개씩</option>
                            <option>30개씩</option>
                            <option>40개씩</option>
                        </select>
                    </p>

            <!--    <div class="board_head_right">
                        <input type="file" id="uploadFile" class="inp_btn" placeholder="파일 업로드">
                        <label for="uploadFile" class="btn inp_btn">파일 업로드</label>

                        <a class="btn inp_btn" href="" download="">파일 다운</a>
                        <a href="/registration" class="btn submit_btn">등록하기</a>
                    </div>  -->
                </div>

                <div class="board_content">
                    <div class="tab_div">
                        <table class="list_tab">
                            <thead>
                                <tr>
                                    <th>등록번호</th>
                                    <th>상호명</th>
                                    <th>전화번호</th>
                                    <th>주소</th>
                                    <th>상세주소</th>
                                    <th>영업시간</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<SCRIPT language="Javascript">
                            		function GotoModify(value) {
										console.log("go to modify with "+value);
										
										
										location.href="/modify?key="+value;
										
                            		}
                            		
                            	</SCRIPT>
                            	<c:forEach items="${objectList }" var="objectVO">
                            		<tr>
                            		<td><c:out value="${obejctVO.code}"/></td>
                            		<!--  <td onclick=GotoModify("${memberVO.comSeq}")><c:out value="${memberVO.name}"/></td>-->
                  
                            		<td><c:out value="${obejctVO.status}"/></td>
                            		<td><c:out value="${obejctVO.name}"/></td>
                            		
                            		
                            		</tr>
                            	 </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
				
                <div class="paging">
                    <a class=“first”> < </a>
                    <a class=”ac”> 1 </a>
                    <a> 2</a>
                    <a> 3 </a>
                    <a> 4</a>
                    <a> 5 </a>
                    <a class=“last”> > </a>
                </div> 

            </div>
             
            </div>
        
     
     
    
	</div>
</body>
</html>
