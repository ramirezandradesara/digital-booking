package com.dh.digitalbooking.jwt.service;

import com.dh.digitalbooking.entities.AppUser;
import com.dh.digitalbooking.service.UserService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtService {
    @Autowired
    UserService userService;

    private final String SECRET_KEY="secret";

    public String extractEmail(String token){
        return extractClaimEmail(token);
    }
    public Date extractExpiration(String token){
        return extractClaimDate(token);
    }
    public Date extractClaimDate(String token){
        Claims claims = extractAllClaims(token);
        return claims.getExpiration();
    }
    public String extractClaimEmail(String token) {
        Claims claims = extractAllClaims(token);
        return claims.getSubject();
    }

    private Claims extractAllClaims(String token) {
        return Jwts.parser().setSigningKey(SECRET_KEY).parseClaimsJws(token).getBody();
    }

    public String generateToken(UserDetails userDetails) {
        Map<String, Object> claims = new HashMap<>();
        AppUser user =userService.buscarUsuarioXEmail(userDetails.getUsername());
        claims.put("nombre",user.getNombre());
        claims.put("apellido",user.getApellido());
        claims.put("id",user.getId());
        claims.put("rol",user.getRol());
        return createToken(claims, userDetails.getUsername());
    }

    private String createToken(Map<String, Object> claims, String subject) {
        Date now = new Date();
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(now.getTime() + 60 * 60 * 1000))
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY).compact();
    }

    public Boolean validateToken(String token, UserDetails userDetails) {
        final String email = extractEmail(token);
        return (email.equals(userDetails.getUsername()) && !isTokenExpired(token));
    }

    private boolean isTokenExpired(String token) {
        return extractExpiration(token).before(new Date());
    }
}
