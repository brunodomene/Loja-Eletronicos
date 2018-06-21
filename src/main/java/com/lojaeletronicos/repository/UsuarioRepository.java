package com.lojaeletronicos.repository;

import org.springframework.data.repository.CrudRepository;

import com.lojaeletronicos.models.Usuario;


public interface UsuarioRepository extends CrudRepository<Usuario, String> {
	Usuario findByEmail(String email);
	
}
