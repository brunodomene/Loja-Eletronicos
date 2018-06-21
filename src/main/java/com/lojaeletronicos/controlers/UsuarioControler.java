package com.lojaeletronicos.controlers;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lojaeletronicos.models.Usuario;
import com.lojaeletronicos.services.UsuarioService;

@Controller
@RequestMapping("/usuarios")
public class UsuarioControler{
	
	@Autowired
	private UsuarioService usuarioService;

	@PostMapping("/cadastro")
	public ModelAndView cadastrar(@ModelAttribute("usuario") Usuario usuario){
		
		List<String> rolesNomes = new ArrayList<>();
		rolesNomes.add("ROLE_CLIENTE");
		
		usuarioService.cadastrar(usuario, rolesNomes);
		
		return new ModelAndView("redirect:/login");
	}
	
	@GetMapping("/cadastro")
	public String formCadastro(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "/usuarios/cadastro";
	}
}
