package com.lojaeletronicos.controlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.lojaeletronicos.models.CarrinhoCompras;
import com.lojaeletronicos.services.ProdutoService;

@RequestMapping("/pagamento")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
@Controller
public class PagamentoControler {
	
	@Autowired
	private CarrinhoCompras carrinho;
	
	@Autowired
	private ProdutoService produtoService;
	
	@PostMapping()
	public ModelAndView pagamento(@ModelAttribute("carrinho") CarrinhoCompras carrinhoAtualizado) {
		
		carrinho.atualizarItens(carrinhoAtualizado.getItens());
		produtoService.adicionaQtdVendida(carrinho.getItens());
		
		return new ModelAndView("redirect:/carrinho");
	}
	
	

}
