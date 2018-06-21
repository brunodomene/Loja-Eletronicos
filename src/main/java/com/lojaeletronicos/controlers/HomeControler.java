package com.lojaeletronicos.controlers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lojaeletronicos.models.Produto;
import com.lojaeletronicos.models.Tipo;
import com.lojaeletronicos.services.ProdutoService;

@Controller
public class HomeControler {
	
	@Autowired
	private ProdutoService produtoService; 
	
	@RequestMapping("/")
	public ModelAndView home(){
		
		List<Produto> smartphonesMaisVendidos = produtoService.maisVendidosPorTipo(Tipo.Smartphone);
		List<Produto> televisoresMaisVendidos = produtoService.maisVendidosPorTipo(Tipo.Televisor);
		List<Produto> notebooksMaisVendidos = produtoService.maisVendidosPorTipo(Tipo.Notebook);
		
		ModelAndView modelAndView = new ModelAndView("/home");
		modelAndView.addObject("smartphones", smartphonesMaisVendidos);
		modelAndView.addObject("notebooks", notebooksMaisVendidos);
		modelAndView.addObject("televisores", televisoresMaisVendidos);
		
		return modelAndView;
	}
	
}
