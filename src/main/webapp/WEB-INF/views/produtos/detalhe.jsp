<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:paginaTemplate titulo="${produto.nome }">
	<div class="container">
		
		<div class="row">
			<div class="imagem col-6 ">
				<img alt="Responsive image" src="/${produto.imagem}" class="img-fluid" width="500px" height="500px">
			</div>
			
			<div class="card produto-dados mb-6 col-5">
			  <div class="card-body">
			    <h5 class="card-title">${produto.marca} ${produto.nome }</h5>
			    <hr>
			    <p class="card-text">${produto.descricao}</p>
			    <p class="card-text alerta">Frete gratis para todo Brasil, não perca essa oportunidade, garanta já o seu!</p>
			  </div>
			  	<div class="card-footer text-center row"><span class="preco">Preço: R$${produto.preco}</span>
					<form:form servletRelativeAction="/carrinho" method="Post" cssClass="col-6">
						<input type="hidden" name="id" value="${produto.id}"/>
						<button class="btn botao-comprar btn-dark" type="submit">Comprar</button>
					</form:form>
				</div>
			</div>
		
		</div>	
	</div>
</tags:paginaTemplate>	
	
