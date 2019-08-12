package pl.barbershop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@Configuration
@ComponentScan(value = "pl.barbershop")
@Order(2)
public class SecurityConfigBarbershop extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }



    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .passwordEncoder(passwordEncoder())
                .usersByUsernameQuery("select email, password, enabled from barbershops where email=?")
                .authoritiesByUsernameQuery("select username, role from user_role where username=?");

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.antMatcher("/barbershop/login/*").authorizeRequests()
                .anyRequest().access("hasRole('ROLE_BARBERSHOP')")
                .and().formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/")
                .and().exceptionHandling()
                .accessDeniedPage("/access-denied")
                .and().logout()
                .logoutSuccessUrl("/");
        http.csrf().disable();
        http.logout();
    }
}