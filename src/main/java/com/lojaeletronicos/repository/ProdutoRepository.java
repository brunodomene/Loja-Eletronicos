package com.lojaeletronicos.repository;


import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.lojaeletronicos.models.Produto;
import com.lojaeletronicos.models.Tipo;

public interface ProdutoRepository extends CrudRepository<Produto, Long>{
	List<Produto> findAllByTipo(Tipo tipo);
}
