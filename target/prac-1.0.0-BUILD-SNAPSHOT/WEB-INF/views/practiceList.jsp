<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
    <script src="./resources/compnent/jquery-3.3.1.min.js"></script>
    <script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
    <script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>
    <link rel="stylesheet" type="text/css" href="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.css">
    <script src="./resources/js/util/util.js"></script>
    <link rel="stylesheet" type="text/css" href="./resources/css/personalHistory/personalHistoryNew.css?ver=1">
    <title>Home</title>
    <style type="text/css">
        #pop{
            width:300px; height:400px; background:#3d3d3d; color: #fff;
            position: absolute; top: 10px; left: 100px; text-align: center;
            border: 2px solid #000;
        }
        span {
            cursor: pointer;
        }
    </style>
    <script>
        $(document).on("click", "tbody > tr > td:not(:first-child)", function(){
            //var userIdx = $(this).find("td:nth-child(2)").text();
            var userIdx = $(this).parent().attr("id");
            location.href="/prac?"+userIdx;
        })

        //전체 선택 클릭
        $(document).on("click", "#checkAll", function(){
            if($("#checkAll").is(":checked")){
                $(".checkSingle").prop("checked", true);
            }else{
                $(".checkSingle").prop("checked", false);

            }
        })

        //단일 선택 클릭
        $(document).on("click", ".checkSingle", function() {
            var total =  $(".checkSingle").length;
            var checked = $(".checkSingle:checked").length;

            //단일 체크박스를 모두 다 클릭하게 되면 전체 선택 체크 버튼이 활성화 된다는 의미
            if(total != checked){
                $("#checkAll").prop("checked", false);
            }else{
                $("#checkAll").prop("checked", true);

            }
        })

        $(document).on("click", "#deleteListBtnNew", function(){
            let chkVal=[];
            $(".checkSingle:checked").each(function(){
                chkVal.push($(this).attr('idx'))
            })
            $.ajax({
                url:"/deleteList",
                type:'post',
                traditional: true,
                data:{"chkVal": chkVal},
                success:function(data){
                    //리턴 받은 data(pageNUM)에 따라 새로고침
                    //만약 6페이지에 리스트가 1개밖에 없었는데 1개를 삭제하면
                    //5페이지로 이동되게 함
                    location.href=("/practiceList?pageNUM="+data) ;
                },
                error:function(request,status,error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                },
                complete:function(){

                }
            })
        })


    </script>

</head>
<body>
    <div style="width:100%;margin:0px auto;display: inline-block; text-align: center;">
<%--        <input type="hidden" id="userInfoTotalCnt">--%>
<%--        <input type="hidden" id="userInfoPageSize" value="10">--%>
<%--        <input type="hidden" id="userInfoPageNo" value="1">--%>
<%--        <input type="hidden" id="userInfoDataSize" value="10">--%>

        <h2> 개인 이력카드 조회 </h2>
    <form action="/practiceList" method="get">
        <select id="userListSearchPeriodNew" name="userListSearchPeriodNew">
            <option value="">검색조건</option>
            <option value="userName">이름</option>
            <option value="userComp">소속회사</option>
            <option value="userDept">부서</option>
<%--            <option value="userAddress">주소</option>--%>
            <option value="userCareerLength">경력</option>
        </select>
        <input type="text" id="userListSearchWordNew" name="userListSearchWordNew">
        <input type="submit" id="userListSearchBtnNew" value="검색"><br><br>
    </form>

        <input type="button" id="insertListBtnNew" value="등록" onclick="window.location.href='/prac'">
        <input type="button" id="deleteListBtnNew" value="삭제"><br><br>
    </div>

<%--    <div class="pop-register-list-pannel" style="width:600px;height:150px;margin:0px auto;" >--%>
    <div class="pop-register-list-pannel">
        <table class="pop-register-list" id="listTable">
            <thead>
                <tr>
                    <td><input type="checkbox" id="checkAll" name="checkAll">선택</td>
                    <td>등록번호</td>
                    <td>성명</td>
                    <td>소속회사</td>
                    <td>부서</td>
                    <td>성별</td>
                    <td>경력(년)</td>
                    <td>등록날짜</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="li" items="${list}">
                    <tr id=${li.userIdx}>
                        <td><input type="checkbox" class="checkSingle" idx="${li.userIdx}"> </td>
                        <td>${li.userIdx}</td>
                        <td>${li.userName}</td>
                        <td>${li.userComp}</td>
                        <td>${li.userDept}</td>
                        <td>${li.userSex}</td>
                        <td>${li.careerDate}</td>
                        <td>${li.userRegisterDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="pop-paging-pannel">
            <tr>
                <td>
                    <c:if test="${startPage ==1}">
                        <span style="pointer-events:none;">◀ </span>
                    </c:if>
                    <c:if test="${startPage !=1}">
                        <span onclick="window.location.href='/practiceList?pageNUM=${startPage-1}'">◀ </span>
                    </c:if>
                </td>

                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <td>
                        <c:if test="${i == pageNUMByController}">
                            <span onclick="window.location.href='/practiceList?pageNUM=${i}'"><strong>${i}</strong> </span>
                        </c:if>
                        <c:if test="${i != pageNUMByController}">
                            <span onclick="window.location.href='/practiceList?pageNUM=${i}'">${i} </span>
                        </c:if>

                    </td>

                </c:forEach>
                <td>
                    <c:if test="${endPage == totalPage}">
                        <span style="pointer-events:none;">▶ </span>
                    </c:if>
                    <c:if test="${endPage !=totalPage}">
                        <span onclick="window.location.href='/practiceList?pageNUM=${endPage+1}'">▶</span>
                    </c:if>
                </td>
            </tr>
        </div>
    </div>
</body>
</html>
