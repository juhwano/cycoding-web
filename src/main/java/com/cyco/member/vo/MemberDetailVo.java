package com.cyco.member.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;


public class MemberDetailVo extends User{
	
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	

	private String MEMBER_EMAIL;

	
	public MemberDetailVo(String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities,String MEMBER_EMAIL) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		
		this.MEMBER_EMAIL = MEMBER_EMAIL;
	}

	public String getEmail() {
		return MEMBER_EMAIL;
	}

	public void setEmail(String MEMBER_EMAIL) {
		this.MEMBER_EMAIL = MEMBER_EMAIL;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString() + "; Email: "+this.MEMBER_EMAIL;
	}
	
	
	

}
