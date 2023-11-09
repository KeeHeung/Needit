package web.dto;

public class Banner {

	private int bannerNo;
	private String originName;
	private String storedName;
	private String fileType;
	
	public Banner() {}

	@Override
	public String toString() {
		return "Banner [bannerNo=" + bannerNo + ", originName=" + originName + ", storedName=" + storedName
				+ ", fileType=" + fileType + "]";
	}

	public Banner(int bannerNo, String originName, String storedName, String fileType) {
		super();
		this.bannerNo = bannerNo;
		this.originName = originName;
		this.storedName = storedName;
		this.fileType = fileType;
	}

	public int getBannerNo() {
		return bannerNo;
	}

	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	

}