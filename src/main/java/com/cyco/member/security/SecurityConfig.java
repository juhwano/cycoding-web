package com.cyco.member.security;

import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        // @formatter:off
        //http.csrf().disable();
        //http.httpBasic();
        
        http.authorizeRequests()
                .antMatchers(HttpMethod.POST,"/register.cy").fullyAuthenticated()
                .antMatchers("/**").permitAll()
                .anyRequest().permitAll()
        	.and()
        		.csrf()
        		.ignoringAntMatchers("/login.cy");


        // @formatter:on
    }

}
