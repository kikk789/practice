<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>

    <script src="./resources/compnent/jquery-3.3.1.min.js"></script>
    <script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

    <script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
    <script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

    <script src="./resources/js/util/util.js"></script>

    <script src="./resources/js/personalHistory/personalHistory.js?ver=46" charset="UTF-8"></script>
    <script src="./resources/js/personalHistory/personalHistoryFunc.js?ver=46" charset="UTF-8"></script>

    <link rel="stylesheet" type="text/css" href="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.css">
    <link rel="stylesheet" type="text/css" href="./resources/css/personalHistory/personalHistory.css?ver=1">

    <title>Home</title>
    <style type="text/css">
        #pop{
            width:300px; height:400px; background:#3d3d3d; color: #fff;
            position: absolute; top: 10px; left: 100px; text-align: center;
            border: 2px solid #000;
        }
    </style>

    <script>
        window.onload = function(){
            userListPagingView(1);

            $("#insertListBtn").on("click", function(){
                location.href="/";
            })
        }
        $("#userListSearchBtn").click(function(){
            userListPagingView(1);
        });



    </script>
</head>
<body>


    <div style="width:100%;margin:0px auto;display: inline-block; text-align: center;">
        <input type="hidden" id="flagPracList" value="1">
        <input type="hidden" id="userInfoTotalCnt">
        <input type="hidden" id="userInfoPageSize" value="10">
        <input type="hidden" id="userInfoPageNo" value="1">
        <input type="hidden" id="userInfoDataSize" value="10">

        <h2> ?????? ???????????? ?????? </h2>

        <select id="userListSearchPeriod">
            <option value="">????????????</option>
            <option value="userName">??????</option>
            <option value="userComp">????????????</option>
            <option value="userDept">??????</option>
            <option value="userAddress">??????</option>
            <option value="userCareerLength">??????</option>
        </select>
        <input type="text" id="userListSearchWord">
        <input type="submit" id="userListSearchBtn" value="??????"><br><br>
        <input type="button" id="insertListBtn" value="??????">
        <input type="button" id="deleteListBtn" value="??????"><br><br>
    </div>

    <div class="pop-register-list-pannel" style="width:50%;height:50%;margin:0px auto;" >
        <table class="pop-register-list">

        </table>

        <div class="pop-paging-pannel">
        </div>
    </div>

</body>
</html>
