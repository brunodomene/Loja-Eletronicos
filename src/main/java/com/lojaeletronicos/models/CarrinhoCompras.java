package com.lojaeletronicos.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class CarrinhoCompras {
	private List<CarrinhoItem> itens = new ArrayList<>();
	private Integer totalItens;
	private BigDecimal valorTotal;

	public List<CarrinhoItem> getItens() {
		return itens;
	}

	public void adiciona(CarrinhoItem item) {
		if (!itens.contains(item)) {
			this.itens.add(item);
		} else {
			this.itens.get(itens.indexOf(item)).adicionarQuantidade(1);
		}
	}

	public Integer getTotalItens() {
		totalItens = this.itens.stream().mapToInt(CarrinhoItem::getQuantidade).sum();
		return this.totalItens;
	}

	public BigDecimal getValorTotal() {
		valorTotal = itens.stream().map(CarrinhoItem::getValor).reduce(BigDecimal.ZERO, BigDecimal::add);
		return this.valorTotal;
	}

	public void remover(CarrinhoItem item) {
		this.itens.remove(item);
	}

	public void atualizarItens(List<CarrinhoItem> itensASeremAtualizados) {
		itensASeremAtualizados.forEach(i -> {
			this.itens.get(this.itens.indexOf(i)).setQuantidade(i.getQuantidade());
		});
	}

}
