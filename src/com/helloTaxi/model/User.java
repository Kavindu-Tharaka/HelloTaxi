package com.helloTaxi.model;

public class User {
	
	private int id;
	private String name;
	private String address;
	private String userName;
	private String password1;
	private String ContactNumber;
	private String zip;
	private String nic;
	private String driLicenseNum;
	private String age;
	private String gender;
	private String vType;
	private String vRegNum;
	
	
	private static User myCustomer;
		
	//SINGLETON design pattern for customer object creation
		private User() {}
		public static User getUser() {
					
			if (myCustomer == null) {
				myCustomer = new User();
				return myCustomer;
			}
			return myCustomer;
		}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPassword1() {
		return password1;
	}
	
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}

	public String getContactNumber() {
		return ContactNumber;
	}

	public void setContactNumber(String contactNumber) {
		ContactNumber = contactNumber;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}
	
	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public String getDriLicenseNum() {
		return driLicenseNum;
	}
	public void setDriLicenseNum(String driLicenseNum) {
		this.driLicenseNum = driLicenseNum;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getvType() {
		return vType;
	}
	public void setvType(String vType) {
		this.vType = vType;
	}
	public String getvRegNum() {
		return vRegNum;
	}
	public void setvRegNum(String vRegNum) {
		this.vRegNum = vRegNum;
	}

}
