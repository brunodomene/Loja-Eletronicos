package com.lojaeletronicos.services;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.lojaeletronicos.models.Role;
import com.lojaeletronicos.models.Usuario;
import com.lojaeletronicos.repository.UsuarioRepository;



@Repository
public class UsuarioService implements UserDetailsService {
	
	@Autowired
	private UsuarioRepository repository;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Usuario usuario = repository.findByEmail(email);
		
		if(usuario == null){
	        throw new UsernameNotFoundException("O usuário "+ email +" não foi encontrado");
	    }
		
		System.out.println(usuario.getNome());
		
		return usuario;
	}
	
	public void cadastrar(Usuario usuario, List<String> rolesNomes){
		
		List<Role> roles = new ArrayList<>();
		rolesNomes.forEach(nome -> {
			roles.add(new Role(nome));			
		});
		
		usuario.setRoles(roles);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		usuario.setSenha(encoder.encode(usuario.getSenha()));
		repository.save(usuario);
	}

}
