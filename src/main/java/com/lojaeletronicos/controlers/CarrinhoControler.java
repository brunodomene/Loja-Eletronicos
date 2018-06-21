package com.lojaeletronicos.controlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.lojaeletronicos.models.CarrinhoCompras;
import com.lojaeletronicos.models.CarrinhoItem;
import com.lojaeletronicos.models.Produto;
import com.lojaeletronicos.services.ProdutoService;

@Controller
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoControler {
	
	@Autowired
	private CarrinhoCompras carrinhoCompras;
	
	@Autowired
	private ProdutoService produtoService;
	
	@PostMapping()
	public ModelAndView adiciona(Long id, Integer quantidade){
		
		CarrinhoItem carrinhoItem = criaItemCarrinho(id, quantidade);
		carrinhoCompras.adiciona(carrinhoItem);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho");
		return modelAndView;
		
	}
	
	@GetMapping()
	public ModelAndView itens() {
		ModelAndView modelAndView = new ModelAndView("/carrinho/itens");
		modelAndView.addObject("carrinho", carrinhoCompras);
		return modelAndView;
	}

	public CarrinhoItem criaItemCarrinho(Long id, Integer quantidade) {
		Produto produto = produtoService.acharPeloId(id);
		return new CarrinhoItem(produto, quantidade);
	}
	
	@RequestMapping("/remover")
	public ModelAndView remover(Long id) {
		
		if (id == null) return new ModelAndView("redirect:/carrinho");
		
		CarrinhoItem item = criaItemCarrinho(id, 0);
		carrinhoCompras.remover(item);

		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho");
		return modelAndView;
	}
	
	
}
