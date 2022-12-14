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
		$(window).on("load",function() {
			let userIdx = location.href.split("?")[1];
			if (typeof userIdx != 'undefined') {
				console.log(typeof userIdx);
				getRegisterData(Number(userIdx));
			}
		})
	</script>
</head>
<body>
<%--<%--%>
<%--	String getUserIdx = request.getParameter("userIdx");--%>
<%--	int userIdx=0;--%>
<%--	if (getUserIdx==null || getUserIdx.equals("")){--%>
<%--		System.out.println("userIdxuserIdxuserIdx " + getUserIdx);--%>
<%--	}else{--%>
<%--		userIdx = Integer.parseInt(getUserIdx);--%>
<%--		System.out.println("userIdxuserIdxuserIdx " + userIdx);--%>
<%--	}--%>
<%--%>--%>
<%--<script>--%>
<%--	$(window).on("load",function() {--%>
<%--		var userIdx ="<%=userIdx%>";--%>
<%--		getRegisterData(userIdx);--%>
<%--	});--%>
<%--</script>--%>

<!-- <div id="pop">
    <div style="height: 370px;">
        ????????? ?????? Test<br>
        <a><b>a,b ??????</b></a>
    </div>
    <div>
        <div id="close" style="width: 100px; margin: auto;">close</div>
    </div>
</div> -->
	<div class="custom-loading"><div class="loading-image"></div></div>
	<%-- ??? ???????????? ?????? ?????? ???????????? ???????????? ?????? ??? ???????????? ????????? --%>
		<input id="userIdx" type="hidden">
	<div class="user-info-list-pannel">
		<div class="personal-history-title-pannel">
			<h3>??? ??? ??? ??? ??? ???</h3>
		</div>
		
		<div class="top-header-pannel">
			
			<div class="status-display-pannel">
				<h5>??? ??? ?????? ??????</h5>
			</div>
			
			<div class="function-btn-pannel">
				<button class="printBtn">
					??????
				</button>
				<button class="personalHistoryListBtn">
					????????????
				</button>
				<button class="newHistoryCreateBtn">
					????????????
				</button>
				<button class="personalHistoryResetBtn">
					?????????
				</button>
				<button class="personalHistorySaveBtn">
					??????
				</button>
			</div>
		</div>
		
		
		<table class="user-info-table1">
		
			<tbody>
				<tr>
					<td>*??????</td>
					<td><input type="text" id="userName"></td>
					<td>*??????????????????</td>
					<td colspan="3"><input type="password" id="userSocialSecunum" maxlength="13" placeholder='  "-" ????????? ????????? ??????'></td>
					<td>??????</td>
					<td>
						<select id="userSex">
							<option value="">????????????</option>
							<option value="??????">??????</option>
							<option value="??????">??????</option>
						</select>
					</td>
					<td rowspan="3">
						<div id="imgDiv" >
							<img id="thumbNail" name="thumbNail" width="120" height="120" src="http://localhost:8070/resources/upload/default.jpg" />
						</div>
					</td>
				</tr>
				
				<tr>
					<td>????????????</td>
					<td colspan="5"><input type="text" id="userComp"></td>
					<td>?????????</td>
					<td><input type="text" id="userCompEnterdate" class="dateInput"></td>
				</tr>
				
				<tr>
					<td>??????</td>
					<td><input type="text" id="userDept"></td>
					<td>??????</td>
					<td><input type="text" id="userSpot"></td>
					<td>??????</td>
					<td><input type="text" id="userArmyServ"></td>
					<td>??????</td>
					<td>
						<select id="userMaritalStatus">
							<option value="">????????????</option>
							<option value="??????">??????</option>
							<option value="??????">??????</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>??????<br> ?????? ~ ?????????</td>
					<td colspan="2"><input type="text" id="userArmyServEnter" class="dateInput prevDate"></td>
					<td> ~ </td>
					<td colspan="2"><input type="text" id="userArmyServLeave" class="dateInput laterDate"></td>
					<td>??????/??????</td>
					<td><input type="text" id="userArmyServPeriod"></td>
 					<td>
							<input type="file" name="file">
							<input type="hidden" name="userIdx">
							<input type="hidden" name="userName" >
					</td>
				</tr>
			</tbody>
			
		</table>
		
		
		
		
		
		
		
		<table class="user-info-table2">
			<tbody>
				<tr>
					<td>??????</td>
					<td><input type="tel" placeholder='   ???????????? "-" ??????' id="userTelnumWireless"></td>
					<td colspan="2"><input type="tel" placeholder='   ?????? "-" ??????' id="userTelnumWired"></td>
				</tr>
				
				<tr>
					<td>E-Mail</td>
					<td><input type="email" id="userEmail"></td>
					<td>
						<select type="text" id="emailDomain" style="width: 100%;">
							<option disabled="disabled" selected="selected">???????????????</option>
							<option>@naver.com</option>
							<option>@gmail.com</option>
							<option>@daum.net</option>
							<option>????????????</option>
						</select>
					</td>
					<td id="test12" style="display: none;">
						<input type="text" id="emailDomain1" />
					</td>
				</tr>
				
				<tr>
					<td>??????</td>
					<td>
						<div>
							<input type="text" id="userZipcode" placeholder="????????????">
							<input type="button" id="personalZipcodeSearchBtn" value="???????????? ??????" />
							<div class="clear-pannel"></div>
						</div>
					</td>
					<td colspan="2">
						<input type="text" id="userAddress" placeholder="   ??????">
						<!-- <input type="text" id="userAddress"> -->
					</td>
				</tr>
			</tbody>
			
		</table>
		
		<table class="user-info-table3">
			<tbody>
				<tr>
					<td>?????????</td>
					<td>?????????</td>
					<td colspan="2">??????</td>
				</tr>
				<tr>
					<td><input type="text" id="userBloodtype" placeholder="????????? ??????(ex- A??? = A)"></td>
					<td><input type="number" id="userWeight" placeholder="????????? ??????(ex-100kg = 100)" maxlength='3'></td>
					<td><input type="text" id="userLeftSight" placeholder="??? ??????(2.0)" maxlength='3'></td>
					<td><input type="text" id="userRightSight" placeholder="??? ??????(2.0)" maxlength='3'></td>
				</tr>
			</tbody>
		</table>
		
		
		
		
		
		
		
		
		<%-- ?????? / ????????? --%>
		<div class="edu-and-qualifi-pannel">
			<div class="edu-table-pannel">
				<table class="edu-table flexibleTable" tb="edu">
					<thead>
						<tr>
							<td>?????????</td>
							<td>??????</td>
							<td colspan="4">?????????</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" data="eduSchoolName" class="eduSchoolName"></td>
							<td>
								<select data="eduStatus" class="eduStatus">
									<option value="">????????????</option>
									<option value="??????">??????</option>
									<option value="??????">??????</option>
									<option value="??????">??????</option>
									<option value="????????????">????????????</option>
								</select>
							</td>
							<!-- <td><input type="text" data="eduYear" placeholder="" class="eduYear"></td>
							<td>???</td>
							<td><input type="text" data="eduMonth" placeholder="" class="eduMonth"></td>
							<td>???</td> -->
							<td><input type="text" data="eduDate" id="eduDate" class="dateInput eduDate"></td>
						</tr>
					</tbody>
					
				</table>
				
				<div class="add-row-btn-pannel">
					<button class="add-row-btn addRowBtn">+</button>
				</div>
				
			</div>
			
			<div class="qualifi-table-pannel">
				<table class="qualifi-table flexibleTable" tb="qualifi">
				
					<thead>
						<tr>
							<td>
								????????????
							</td>
							<td>
								?????????
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td><input type="text" data="qualifiName" class="qualifiName"></td>
							<td><input type="text" data="qualifiGetdate" class="qualifiGetdate dateInput"></td>
						</tr>
					</tbody>
					
				</table>
				
				<div class="add-row-btn-pannel">
					<button class="add-row-btn addRowBtn">+</button>
				</div>
				
			</div>
		</div>






		<div class="clear-pannel"></div>
		
		
		
		
		
		<div class="career-info-pannel">
			<table class="career-info flexibleTable" tb="career">
				<thead>
					<tr>
						<td rowspan="2">?????????</td>
						<td colspan="2">????????????</td>
						<td rowspan="2">??????</td>
						<td rowspan="2">????????????</td>
					</tr>
					<tr>
						<td>?????????</td>
						<td>?????????</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" data="careerCompName" class="careerCompName"></td>
						<td><input type="text" data="careerEnterdate" class="careerEnterdate dateInput prevDate"></td>
						<td><input type="text" data="careerLeavedate" class="careerLeavedate dateInput laterDate"></td>
						<td><input type="text" data="careerSpot" class="careerSpot"></td>
						<td><input type="text" data="careerResponsib" class="careerResponsib"></td>
					</tr>
				</tbody>
			</table>
			
			<div class="add-row-btn-pannel">
				<button class="add-row-btn addRowBtn">+</button>
			</div>
			
		</div>
		
		
		
		
		
		
		
		
		<%-- ?????? / ????????? --%>
		<div class="training-and-licen-pannel">
			<div class="training-table-pannel">
				<table class="training-table flexibleTable" tb="training">
					<thead>
						<tr>
							<td>
								?????????
							</td>
							<td>
								?????????
							</td>
							<td>
								?????????
							</td>
							<td>
								??????
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" data="trainingName" class="trainingName"></td>
							<td><input type="text" data="trainingStartdate" class="trainingStartdate dateInput prevDate"></td>
							<td><input type="text" data="trainingEnddate" class="trainingEnddate dateInput laterDate"></td>
							<td><input type="text" data="trainingAgency" class="trainingAgency"></td>
						</tr>
					</tbody>
				</table>
				
				<div class="add-row-btn-pannel">
					<button class="add-row-btn addRowBtn">+</button>
				</div>
				
			</div>
			
			<div class="training-table-pannel">
				<table class="licen-table flexibleTable" tb="licen">
					<thead>
						<tr>
							<td>
								???????????? ??? ???????????????
							</td>
							<td>
								?????????<br>(A,B,C)
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" data="licenName" class="licenName"></td>
							<td><input type="text" data="licenSkillLevel" class="licenSkillLevel"></td>
						</tr>
					</tbody>
				</table>
				
				<div class="add-row-btn-pannel">
					<button class="add-row-btn addRowBtn">+</button>
				</div>
				
			</div>
		</div>
		
		
	
	
	
		
		
		<div class="clear-pannel"></div>
		
		
		
		
		
		
		
		
		<div class="skill-inventory-table-pannel">
			<table class="skill-inventory-table flexibleTable" tb="skill">
				<thead>
					<tr>
						<td rowspan="2">???????????????<br>?????????</td>
						<td colspan="2">????????????</td>
						<td rowspan="2">?????????</td>
						<td rowspan="2">????????????</td>
						<td colspan="2">????????????</td>
						<td rowspan="2">??????</td>
						<td colspan="7">????????????</td>
					</tr>
					<tr>
						<td>?????????</td>
						<td>?????????</td>
						<td>??????</td>
						<td>??????</td>
						<td>??????</td>
						<td>O.S</td>
						<td>??????</td>
						<td>DBMS</td>
						<td>TOOL</td>
						<td>??????</td>
						<td>??????</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><textarea data="skillProjectName" class="skillProjectName"></textarea></td>
						<td><input type="text" data="skillStartdate" class="skillStartdate dateInput prevDate"></td>
						<td><input type="text" data="skillEnddate" class="skillEnddate dateInput laterDate"></td>
						<td><textarea data="skillCustomerComp" class="skillCustomerComp"></textarea></td>
						<td><textarea data="skillWorkComp" class="skillWorkComp"></textarea></td>
						<td><textarea data="skillIndustry" class="skillIndustry"></textarea></td>
						<td><textarea data="skillApplied" class="skillApplied"></textarea></td>
						<td><textarea data="skillRole" class="skillRole"></textarea></td>
						<td><textarea data="skillModel" class="skillModel"></textarea></td>
						<td><textarea data="skillOs" class="skillOs"></textarea></td>
						<td><textarea data="skillLang" class="skillLang"></textarea></td>
						<td><textarea data="skillDbms" class="skillDbms"></textarea></td>
						<td><textarea data="skillTool" class="skillTool"></textarea></td>
						<td><textarea data="skillComm" class="skillComm"></textarea></td>
						<td><textarea data="skillEtc" class="skillEtc"></textarea></td>
					</tr>
				</tbody>
			</table>
			
			<div class="add-row-btn-pannel">
				<button class="add-row-btn addRowBtn">+</button>
			</div>
		</div>
		
	</div>
	
	
	<div class="pop-user-register-pannel" id="drag-ele1">
	
		<!-- ????????? ?????? -->
		<div class="pop-user-search-pannel">
			
			<input type="hidden" id="userInfoTotalCnt">
			<input type="hidden" id="userInfoPageSize" value="10">
			<input type="hidden" id="userInfoPageNo" value="1">
			
			<select id="userListSearchPeriod">
				<option value="">????????????</option>
				<option value="userName">??????</option>
				<option value="userComp">????????????</option>
				<option value="userDept">??????</option>
				<option value="userAddress">??????</option>
				<option value="userCareerLength">??????</option>
			</select>
			
			<input type="text" id="userListSearchWord">
			
			<select id="userCareerLength">
				<option value="">????????????</option>
				<option value="1">1?????????</option>
				<option value="2">2?????????</option>
				<option value="3">3?????????</option>
				<option value="4">4?????????</option>
				<option value="5">5?????????</option>
				<option value="6">6?????????</option>
				<option value="7">7?????????</option>
				<option value="8">8?????????</option>
				<option value="9">9?????????</option>
				<option value="10">10?????????</option>
			</select>
			
			<select id="userInfoDataSize">
				<option value="10">10??????</option>
				<option value="20">20??????</option>
			</select>
			<select id="genderSelect">
				<option value="" selected="selected">??????</option>
				<option value="??????">??????</option>
				<option value="??????">??????</option>
			</select>
			<select id="maritalStatusSelect">
				<option value="" selected="selected">????????????</option>
				<option value="??????">??????</option>
				<option value="??????">??????</option>
			</select>
			<input type="hidden" id="userGender" name="userGender" >
			<button id="userListSearchBtn" class="user-list-search-btn">??????</button>
			<div class="search-cnt-pannel">
				<span class="search-cnt-prev">???????????? : </span>
				<span class="search-cnt-cnt"></span>
				<span class="search-cnt-later"> ???</span>
			</div>
			<button id="getUserCountByCareerDate">????????? ????????????</button>
			<!-- <button id="downloadExel">?????? ????????????</button> -->
			
		</div>		
		
		<!-- ???????????? ????????? ?????? -->
		<div class="pop-user-top-btn-pannel minimizeUserPannelBtn">
			<div class="pop-user-minimize-btn">
			</div>
		</div>
		
		<div class="clear-pannel"></div>
		
		<div class="keyword-add-pannel">			
			<div class="keywordInputPannel keyword-input-pannel keyword-input-pannel-invisible">#<input maxlength="16"></div>
			<div class="pop-keyword-add-btn-pannel keywordAddPannelBtn tooltip">
				<div class="pop-user-keyword-add-btn keywordAddBtn">
				+
				</div>
				<span class="tooltiptext">?????? ?????? ??????????????? ??????????????? ???????????? ???????????? ??????</span>
			</div>
		</div>
		
		<div class="pop-register-list-pannel">
		
			<table class="pop-register-list">
				<thead>
					<tr>
						<td>????????????</td>
						<td>??????</td>
						<td>????????????</td>
						<td>??????</td>
						<td>??????</td>
						<td>??????</td>
						<td>????????????</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			
			<div class="pop-paging-pannel">
			</div>
		</div>
	</div>
</body>
</html>
