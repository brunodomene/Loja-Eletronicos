package com.lojaeletronicos.models;

import java.math.BigDecimal;

public class CarrinhoItem {
	private Produto produto;
	private Integer quantidade;
	
	public CarrinhoItem() {
	}

	public CarrinhoItem(Produto produto, Integer quantidadeCompra){
		this.produto = produto;
		if(quantidadeCompra == null) quantidadeCompra = 1;
		this.quantidade = quantidadeCompra;
	}
	
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public Integer getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	
	public BigDecimal getValor() {
		return this.produto.getPreco().multiply(new BigDecimal(this.quantidade));
	}
	
	public void adicionarQuantidade(Integer quantidade) {
		this.quantidade += quantidade;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((produto == null) ? 0 : produto.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CarrinhoItem other = (CarrinhoItem) obj;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		return true;
	}
	
	
	
}
