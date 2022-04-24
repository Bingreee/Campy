package campy.com.intercepter;

import org.springframework.beans.factory.annotation.Autowired;


public class SecurityConfig {

//	@Autowired
//	MemberUserDetailService memberUserDetailService;
//	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		
//		http.authorizeRequests().antMatchers("/").permitAll()
//								.antMatchers("/member/**").authenticated()
//								.antMatchers("/admin/**").hasRole("ADMIN");
//		http.csrf().disable();
//		http.formLogin().loginPage("/loginFormTest").defaultSuccessUrl("/loginSuccess",true);
//		http.logout().invalidateHttpSession(true).logoutSuccessUrl("/");
//		
//		http.userDetailsService(memberUserDetailService);
//	}
	
	//인증에 필요한 사용자 정보를 메모리에 저장
	//{noop} :  비밀번호를 암호화 처리하지 않는다.
//	@Autowired
//	public void authenticate(AuthenticationManagerBuilder auth) throws Exception { 
//		auth.inMemoryAuthentication()
//			.withUser("manager")
//			.password("{noop}manager123") 
//			.roles("MANAGER");
//	  
//		auth.inMemoryAuthentication()
//			.withUser("admin") 
//			.password("{noop}admin123")
//			.roles("ADMIN"); 
//	  }
}
