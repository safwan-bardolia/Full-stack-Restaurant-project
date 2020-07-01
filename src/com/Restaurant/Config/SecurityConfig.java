package com.Restaurant.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.ImportResource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

// we use pure java configuration for spring security (no xml)
@Configuration
@EnableWebSecurity
@ImportResource(locations = {"classpath:spring+hibernate.xml"})    
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	// for creating authentication manager
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		// create a user & automatically encode the provided password		
		UserBuilder user = User.withDefaultPasswordEncoder();
		
		// using in memory authentication
		auth.inMemoryAuthentication()
			.withUser(user.username("safwan").password("safVAN2668@").roles("ADMIN"))
			.withUser(user.username("anas").password("safVAN2668").roles("Manager"))
			.withUser(user.username("darshan").password("safVAN").roles("Employee"));
	
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()			//Restrict the access based on the HttpServletRequst coming in
			.anyRequest().authenticated()	//any request coming to the app must be authenticate
			.and()
			.formLogin()
			.loginPage("/loginPage")        		// display login page on this URL (any name)
			.loginProcessingUrl("/validateLogin")   // this is handled by spring security itself
			.permitAll();							//allow everyone to see login page
			
	}

	
	
}
