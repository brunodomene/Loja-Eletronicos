<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:paginaTemplate titulo="Catalogo de ${tipo}">

	<div class="btn-group nav-produtos" role="group" aria-label="Basic example">
		  <a class="btn btn-primary"  href="${s:mvcUrl('PC#listaCelulares').build()}">Smartphones</a>
		  <a class="btn btn-secondary"  href="${s:mvcUrl('PC#listaNotebooks').build()}">Notebooks</a>
		  <a class="btn btn-dark"  href="${s:mvcUrl('PC#listaTelevisores').build()}">Televisores</a>
	</div>

	<div class="container">	
		<c:if test="${empty produtos}">
			<h2>Não há ainda ${tipo } em nosso estoque</h2>
		</c:if>
		<c:if test="${not empty produtos }">
			<h1 class="text-center mb-0">${tipo}</h1>
			<hr>
			<div class="row justify-content-center mb-2">
				<c:forEach items="${produtos}" var="produto">
					<div class="card col-md-3 col-sm-6 my-1 produto">
						<a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">
							<img class="card-img-top img-produto" src="/${produto.imagem}" alt="Card image cap">
						</a>
						<div class="card-body ">
							<h5 class="card-title text-center">${produto.nome }</h5>
							<p class="card-subtitle text-center">Preço: R$${produto.preco }</p>
						</div>
						<p class="card-footer text-center">
								<small class="text-muted"><a class="btn btn-outline-dark btn-block" 
									href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">Compre</a> </small>
						</p>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
	
</tags:paginaTemplate>	