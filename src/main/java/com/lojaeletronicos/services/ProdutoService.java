package com.lojaeletronicos.services;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lojaeletronicos.models.CarrinhoItem;
import com.lojaeletronicos.models.Produto;
import com.lojaeletronicos.models.Tipo;
import com.lojaeletronicos.repository.ProdutoRepository;

@Service
public class ProdutoService{
	@Autowired
	private ProdutoRepository produtoRepository;

	public Iterable<Produto> acheTodos() {
		Iterable<Produto> produtos = produtoRepository.findAll();
		return produtos;
	}
	
	public void salvar(Produto produto) {
		if(produto.getQuantidadeVendida() == null) produto.setQuantidadeVendida(0);
		produtoRepository.save(produto);
	}
	
	public void	excluir(Long id){
		produtoRepository.deleteById(id);
	}
	
	public List<Produto> acharTodosPorTipo(Tipo tipo) {
		List<Produto> produtos = produtoRepository.findAllByTipo(tipo);
		return produtos;
	}
	
	public Produto acharPeloId(Long id) {
		Optional<Produto> produtoOptional = produtoRepository.findById(id);
		return produtoOptional.orElse(null);
	}

	public List<Produto> maisVendidosPorTipo(Tipo tipo) {
		List<Produto> produtos = acharTodosPorTipo(tipo);
		List<Produto> produtosMaisVendidos = produtos.stream()
				.sorted(Comparator.comparingInt(p -> ((Produto) p).getQuantidadeVendida()).reversed())
				.limit(3).collect(Collectors.toList());
		
		return produtosMaisVendidos;
	}

	public void adicionaQtdVendida(List<CarrinhoItem> itens) {
		itens.forEach(i -> {
			i.getProduto().addQuantidadeVendida(i.getQuantidade());
			salvar(i.getProduto());
		});
	}
	
}
