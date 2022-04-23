package campy.com.intercepter;
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.context. annotation.Bean; 
import org.springframework.context. annotation.Configuration; 
import org.springframework.security.config. annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config. annotation.method.configuration.EnableGlobalMethodSecurity; 
import org.springframework.security.config. annotation.web.builders.HttpSecurity; 
import org.springframework.security.config. annotation.web.configuration. EnableWebSecurity; 
import org.springframework.security.config. annotation.web.configuration.WebSecurityConfigurerAdapter; 
import org.springframework.security.crypto.bcrypt. BCryptPasswordEncoder; 
import org.springframework.security.crypto.password. PasswordEncoder;


public class CampingIntercepter extends WebSecurityConfigurerAdapter {
//	@Override 
//	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests() 
//		.antMatchers("/").permitAll() 
//		.antMatchers("/member/**").authenticated()
//		.antMatchers("/admin/**").hasRole("ADMIN");
//		http.logout().permitAll();
//		http.formLogin().loginPage("/campyLogin").defaultSuccessUrl("/loginSuccess",true);
//				//.loginProcessingUrl("/memLogin") 
//				
//		http.csrf().disable();
//	}
//		
//		@Autowired 
//		public void configureGlobal (AuthenticationManagerBuilder auth) throws Exception {
//			auth.inMemoryAuthentication()
//			
//		.withUser("admin").password(passwordEncoder().encode("admin123")).roles("ADMIN");
//			auth.inMemoryAuthentication();
////		.withUser("honggil").password(passwordEncoder().encode("hoho")). roles("USER");
//		}
//		
//		@Bean public PasswordEncoder passwordEncoder() {
//			return new BCryptPasswordEncoder();
//		}


}
