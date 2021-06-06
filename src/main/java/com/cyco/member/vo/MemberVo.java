package com.cyco.member.vo;


import lombok.Data;


//@SuppressWarnings("serial")
@Data
//public class MemberVo implements UserDetails{
public class MemberVo {
	
	private int MEMBER_ID;
	private String MEMBER_EMAIL;
	private String MEMBER_PWD;
	private String MEMBER_NAME;
	private String MEMBER_NICKNAME;
	private String MEMBER_PHONE;
	private String MEMBER_IMAGE;
	private Boolean ENABLED;
	
	/*
	 * @Override public Collection<? extends GrantedAuthority> getAuthorities() {
	 * 
	 * ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
	 * 
	 * if (this.MEMBER_NICKNAME.equals("admin")) { auth.add(new
	 * SimpleGrantedAuthority("ROLE_ADMIN")); } else { auth.add(new
	 * SimpleGrantedAuthority("ROLE_PREMEMBER")); }
	 * 
	 * return auth; }
	 * 
	 * @Override public String getPassword() { // TODO Auto-generated method stub
	 * return null; }
	 * 
	 * @Override public String getUsername() { // TODO Auto-generated method stub
	 * return null; }
	 * 
	 * @Override public boolean isAccountNonExpired() { // TODO Auto-generated
	 * method stub return true; }
	 * 
	 * @Override public boolean isAccountNonLocked() { // TODO Auto-generated method
	 * stub return true; }
	 * 
	 * @Override public boolean isCredentialsNonExpired() { // TODO Auto-generated
	 * method stub return true; }
	 * 
	 * @Override public boolean isEnabled() { // TODO Auto-generated method stub
	 * return true; }
	 */
	

}
