package topia.com.prac.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import topia.com.prac.entity.UserInfoCareer;

import java.util.Date;


//lombok동작이  들쑥날쑥해서   @Data주석하고  getter,setter수동생성
//@Data
@NoArgsConstructor
@AllArgsConstructor
public class ListVO {
	private Integer userIdx;
	private String userRegisterDate;
//	private UserInfoCareer userInfoCareer;
	private String careerDate;
	private String userName;
	private String userSex;
	private String userComp;
	private String userDept;

	public Integer getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(Integer userIdx) {
		this.userIdx = userIdx;
	}

	public String getCareerDate() {
		return careerDate;
	}

	public void setCareerDate(String careerDate) {
		this.careerDate = careerDate;
	}

	public String getUserRegisterDate() {
		return userRegisterDate;
	}

	public void setUserRegisterDate(String userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserComp() {
		return userComp;
	}

	public void setUserComp(String userComp) {
		this.userComp = userComp;
	}

	public String getUserDept() {
		return userDept;
	}

	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}
}
