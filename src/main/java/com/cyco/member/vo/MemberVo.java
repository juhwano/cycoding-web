
package com.cyco.member.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class MemberVo implements UserDetails{
	private int m_id;
	private String m_nick;
	private String m_image;
	private String position;
	private String skill;
	private String p_enable;
	private String s_enable;
	
	private int MEMBER_ID;
	private String MEMBER_EMAIL;
	private String MEMBER_PWD;
	private String MEMBER_NAME;
	private String MEMBER_NICKNAME;
	private String MEMBER_PHONE;
	private String MEMBER_IMAGE;
	private Boolean ENABLED;
	
	//페이지 로우넘
	private int rownum;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}
}