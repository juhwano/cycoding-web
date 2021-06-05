package com.cyco.member.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;


public class MemberVo extends User{
	
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	
	private int MEMBER_ID;
	private String MEMBER_EMAIL;
	private String MEMBER_PWD;
	private String MEMBER_NAME;
	private String MEMBER_NICKNAME;
	private String MEMBER_PHONE;
	private String MEMBER_IMAGE;
	private Boolean ENABLED;
	
	public MemberVo(String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities,String MEMBER_EMAIL, String MEMBER_NICKNAME) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		
		this.MEMBER_EMAIL = MEMBER_EMAIL;
	}

	public int getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(int mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}

	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}

	public String getMEMBER_PWD() {
		return MEMBER_PWD;
	}

	public void setMEMBER_PWD(String mEMBER_PWD) {
		MEMBER_PWD = mEMBER_PWD;
	}

	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}

	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}

	public String getMEMBER_NICKNAME() {
		return MEMBER_NICKNAME;
	}

	public void setMEMBER_NICKNAME(String mEMBER_NICKNAME) {
		MEMBER_NICKNAME = mEMBER_NICKNAME;
	}

	public String getMEMBER_PHONE() {
		return MEMBER_PHONE;
	}

	public void setMEMBER_PHONE(String mEMBER_PHONE) {
		MEMBER_PHONE = mEMBER_PHONE;
	}

	public String getMEMBER_IMAGE() {
		return MEMBER_IMAGE;
	}

	public void setMEMBER_IMAGE(String mEMBER_IMAGE) {
		MEMBER_IMAGE = mEMBER_IMAGE;
	}

	public Boolean getENABLED() {
		return ENABLED;
	}

	public void setENABLED(Boolean eNABLED) {
		ENABLED = eNABLED;
	}

	@Override
	public String toString() {
		return "MemberVo [MEMBER_ID=" + MEMBER_ID + ", MEMBER_EMAIL=" + MEMBER_EMAIL + ", MEMBER_PWD=" + MEMBER_PWD
				+ ", MEMBER_NAME=" + MEMBER_NAME + ", MEMBER_NICKNAME=" + MEMBER_NICKNAME + ", MEMBER_PHONE="
				+ MEMBER_PHONE + ", MEMBER_IMAGE=" + MEMBER_IMAGE + ", ENABLED=" + ENABLED + "]";
	}
	
	
	

}
