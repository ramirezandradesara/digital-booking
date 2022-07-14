package com.dh.digitalbooking.jwt.security;

import com.dh.digitalbooking.jwt.filter.JwtRequestFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsConfigurationSource;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;


import java.time.Duration;
import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtRequestFilter jwtRequestFilter;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors(Customizer.withDefaults())
                .csrf().disable().authorizeRequests()

                .antMatchers("/authenticate").permitAll()

               .antMatchers("/usuarios/**").permitAll()

                .antMatchers(HttpMethod.GET,"/reservas").permitAll()
                .antMatchers(HttpMethod.POST,"/reservas").hasAnyAuthority("Administrador","Usuario-registrado")
                .antMatchers(HttpMethod.PUT,"/reservas").hasAnyAuthority("Administrador","Usuario-registrado")
                .antMatchers(HttpMethod.DELETE,"/reservas/{id}").hasAnyAuthority("Administrador","Usuario-registrado")
                .antMatchers("/reservas/producto/{id}").permitAll()
                .antMatchers("/reservas/usuario/{id}").hasAnyAuthority("Administrador","Usuario-registrado")

                .antMatchers(HttpMethod.GET,"/puntuaciones/producto/{id}").permitAll()
                .antMatchers(HttpMethod.POST,"/puntuaciones").hasAnyAuthority("Administrador","Usuario-registrado")
                .antMatchers(HttpMethod.PUT,"/puntuaciones").hasAnyAuthority("Administrador","Usuario-registrado")

                .antMatchers(HttpMethod.GET,"/productos").permitAll()
                .antMatchers(HttpMethod.GET,"/productos/{id}").permitAll()
                .antMatchers("/productos/ubicacion/{id}").permitAll()
                .antMatchers("/productos/categoria/{id}").permitAll()
                .antMatchers("/productos/ubicacion/{id}/fechainicial/{fechaInicial}/fechafinal/{fechaFinal}").permitAll()
                .antMatchers(HttpMethod.POST,"/productos").hasAuthority("Administrador")
                .antMatchers(HttpMethod.PUT,"/productos").hasAuthority("Administrador")
                .antMatchers(HttpMethod.DELETE,"/productos/{id}").hasAuthority("Administrador")

                .antMatchers(HttpMethod.GET,"/imagenes").permitAll()
                .antMatchers(HttpMethod.GET,"/imagenes/{id}").permitAll()
                .antMatchers(HttpMethod.POST,"/imagenes").hasAuthority("Administrador")
                .antMatchers(HttpMethod.PUT,"/imagenes").hasAuthority("Administrador")
                .antMatchers(HttpMethod.DELETE,"/imagenes/{id}").hasAuthority("Administrador")

                .antMatchers(HttpMethod.GET,"/caracteristicas").permitAll()
                .antMatchers(HttpMethod.GET,"/caracteristicas/{id}").permitAll()
                .antMatchers(HttpMethod.POST,"/caracteristicas").hasAuthority("Administrador")
                .antMatchers(HttpMethod.PUT,"/caracteristicas").hasAuthority("Administrador")
                .antMatchers(HttpMethod.DELETE,"/caracteristicas/{id}").hasAuthority("Administrador")

                .antMatchers(HttpMethod.GET,"/categorias").permitAll()
                .antMatchers(HttpMethod.POST,"/categorias").hasAuthority("Administrador")
                .antMatchers(HttpMethod.PUT,"/categorias").hasAuthority("Administrador")
                .antMatchers(HttpMethod.DELETE,"/categorias/{id}").hasAuthority("Administrador")

                .antMatchers(HttpMethod.GET,"/politicas").permitAll()
                .antMatchers(HttpMethod.GET,"/politicas/{id}").permitAll()
                .antMatchers(HttpMethod.POST,"/politicas").hasAuthority("Administrador")
                .antMatchers(HttpMethod.PUT,"/politicas").hasAuthority("Administrador")
                .antMatchers(HttpMethod.DELETE,"/politicas/{id}").hasAuthority("Administrador")

                .antMatchers(HttpMethod.GET,"/ubicaciones").permitAll()
                .antMatchers(HttpMethod.GET,"/ubicaciones/{id}").permitAll()
                .antMatchers(HttpMethod.POST,"/ubicaciones").hasAuthority("Administrador")
                .antMatchers(HttpMethod.PUT,"/ubicaciones").hasAuthority("Administrador")
                .antMatchers(HttpMethod.DELETE,"/ubicaciones/{id}").hasAuthority("Administrador")

                 .antMatchers("/**").permitAll()
                .anyRequest().authenticated()
                .and().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

}


