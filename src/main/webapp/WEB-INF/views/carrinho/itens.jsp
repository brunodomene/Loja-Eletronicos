<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:paginaTemplate titulo="carrinho">
	<div class="container">
		
		<c:if test="${empty carrinho.itens}">
			<h2>Seu Carrinho está vazio</h2>
		</c:if>
		
		<c:if test="${not empty carrinho.itens }">
			<h3>Seu Carrinho</h3>
			<form:form  method="Post" action="${s:mvcUrl('PC#pagamento').build()}" modelAttribute="carrinho">
				<table class="table">
					<thead class="thead-dark text-center">
						<tr>
							<th colspan="2">Nome</th>
							<th>Preço</th>
							<th>Quantidade</th>
							<th>Total</th>
							<th></th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach items="${carrinho.itens }" var="item" varStatus="atual">
			        		<tr>
			        			<td >
			        				<a href="${s:mvcUrl('PC#detalhe').arg(0,item.produto.id).build()}">
			        					<img alt="imagem-produto" src="/${item.produto.imagem }" width="70px" height="70px">
			        				</a>
			        			</td>
			        			<td >${item.produto.nome }</td>
			        			<td >R$${item.produto.preco}</td>
			        			<td class="col-quantidade">
			        				<form:input path="itens[${atual.index}].produto.id" type="hidden"/>
			        				<form:input type="number" min="1" path="itens[${atual.index}].quantidade" 
			        						value="${item.quantidade}" cssClass="form-control" />
			        			</td>
			       				<td> 			
			        				R$ ${item.getValor()} 
			       				</td>
			        			<td>
			        				<a class="btn btn-outline-dark" href="${s:mvcUrl('CC#remover').arg(0,item.produto.id).build()}">Remover</a>
			        			</td>
			        		</tr>
			        	</c:forEach>
					</tbody>
				</table>
				<div class="efetua-compra row">
					<p class="valor-compra col-8"> Valor Total: R$ ${carrinho.valorTotal}</p>
					<button type="submit" class="btn btn-primary col-4">Comprar</button>
				</div>
				
			</form:form>
		</c:if>
	
	</div>
</tags:paginaTemplate>	