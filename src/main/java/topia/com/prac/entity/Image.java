package topia.com.prac.entity;

public class Image {
	private Integer imgIdx;
	private Integer userIdx;
	private String imgName;
	private String imgPath;
	
	public Integer getImgIdx() {
		return imgIdx;
	}
	public void setImgIdx(Integer imgIdx) {
		this.imgIdx = imgIdx;
	}
	public Integer getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(Integer userIdx) {
		this.userIdx = userIdx;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	@Override
	public String toString() {
		return "Image [imgIdx=" + imgIdx + ", userIdx=" + userIdx + ", imgName=" + imgName + "]";
	}
	
}
