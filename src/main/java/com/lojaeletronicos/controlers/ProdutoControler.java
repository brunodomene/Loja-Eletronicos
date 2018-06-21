package com.lojaeletronicos.controlers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lojaeletronicos.infra.FileUpload;
import com.lojaeletronicos.models.Produto;
import com.lojaeletronicos.models.Tipo;
import com.lojaeletronicos.services.ProdutoService;

@Controller
@RequestMapping("/produtos")
public class ProdutoControler {

	@Autowired
	private ProdutoService produtoService;
	
	@Autowired
	private FileUpload fileUpload;
	
	@RequestMapping("/formulario")
	public String form(Model model){
		model.addAttribute("produto", new Produto());
		return "/produtos/form";
	}
	
	
	@PostMapping()
	public ModelAndView salvar(@Valid @ModelAttribute("produto") Produto produto, BindingResult result,
			MultipartFile file, RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			return new ModelAndView("/produtos/form");	
		}
		
		if(!file.isEmpty()) {
			String caminhoiImagem = fileUpload.write("resources/imagens", file);
			produto.setImagem(caminhoiImagem);
		}
		
		
		produtoService.salvar(produto);
		
		redirectAttributes.addFlashAttribute("mensagem", "Produto salvo com sucesso");

		return new ModelAndView("redirect:/produtos");
	}

	@GetMapping()
	public ModelAndView listar() {

		Iterable<Produto> produtos = produtoService.acheTodos();

		ModelAndView modelAndView = new ModelAndView("produtos/lista");
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}


	@PostMapping("/excluir")
	public ModelAndView excluir(Long id, RedirectAttributes attributes) {
		
		produtoService.excluir(id);
		attributes.addFlashAttribute("mensagem", "Produto excluido");

		ModelAndView modelAndView = new ModelAndView("redirect:/produtos");
		return modelAndView;
	}
	
	@RequestMapping("/celulares")
	public ModelAndView listaCelulares(){
		
		Tipo tipo = Tipo.Smartphone;
		
		List<Produto> celulares = produtoService.acharTodosPorTipo(tipo);
		
		
		ModelAndView modelAndView = new ModelAndView("produtos/catalago");
		modelAndView.addObject("produtos", celulares);
		modelAndView.addObject("tipo", "SmartPhones");
		
		return modelAndView;
	}
	
	@RequestMapping("/notebooks")
	public ModelAndView listaNotebooks(){
		
		Tipo tipo = Tipo.Notebook;
		
		List<Produto> notebooks = produtoService.acharTodosPorTipo(tipo);
		
		
		ModelAndView modelAndView = new ModelAndView("produtos/catalago");
		modelAndView.addObject("produtos", notebooks);
		modelAndView.addObject("tipo", "Notebooks");
		
		return modelAndView;
	}
	
	@RequestMapping("/televisores")
	public ModelAndView listaTelevisores(){
		
		Tipo tipo = Tipo.Televisor;
		
		List<Produto> televisores = produtoService.acharTodosPorTipo(tipo);
		
		
		ModelAndView modelAndView = new ModelAndView("produtos/catalago");
		modelAndView.addObject("produtos", televisores);
		modelAndView.addObject("tipo", "Televisores");
		
		return modelAndView;
	}
	
	@PostMapping("/update")
	public ModelAndView update(Long id){
		ModelAndView modelAndView = new ModelAndView("produtos/form");
		
		Produto produto = produtoService.acharPeloId(id);		
		
		modelAndView.addObject("produto", produto);
		
		return modelAndView;
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Long id){
		
		Produto produto = produtoService.acharPeloId(id);
		
		ModelAndView modelAndView = new ModelAndView("produtos/detalhe");
		modelAndView.addObject("produto", produto);
		return modelAndView;
	}
	

}
