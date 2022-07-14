package com.dh.digitalbooking.email.token.service;

import com.dh.digitalbooking.email.token.entities.ConfirmationToken;
import com.dh.digitalbooking.email.token.repository.ConfirmationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class ConfirmationTokenService {
    @Autowired
    ConfirmationTokenRepository repository;

    public ConfirmationToken guardarToken(ConfirmationToken token){
        return repository.save(token);
    }
    public Optional<ConfirmationToken> buscarXToken(String token ){
        return repository.findByToken(token);
    }
    public int setConfirmedAt(String token){
        return repository.updateConfirmedAt(token, LocalDateTime.now());
    }
}
