<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:paginaTemplate titulo="Listagem Produtos">
	<div class="container">	
		<h1>Lista de Produtos</h1>
		<div>${sucesso}</div>
		<table class="table table-hover table-bordered">
			<thead class="text-center">
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Descrição</th>
					<th>Marca</th>
					<th>Quantidade Vendida</th>
					<th>Preço</th>
					<th>Tipo</th>
					<th colspan="2">Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${produtos }" var="produto">
	        		<tr>
	        			<td class="text-center">${produto.id }</td>
	        			<td class="text-center">${produto.nome }</td>
	        			<td>${produto.descricao }</td>
	        			<td>${produto.marca }</td>
	        			<td class="text-center">${produto.quantidadeVendida }</td>
	        			<td>R$${produto.preco }</td>
	        			<td>${produto.tipo }</td>
	        			<td>
	        				<form:form action="${s:mvcUrl('PC#excluir').arg(0,produto.id).build()}" method="post">
					          		<input type="submit" src="${contextPath }resources/imagens/excluir.png"  value="excluir" 
					          				name="id" alt="Excluir" class="btn btn-outline-dark" />	
					        </form:form>       
	        			</td>
	       				<td> 			
	        				<form:form action="${s:mvcUrl('PC#update').arg(0,produto.id).build()}" method="post">
					          		<input type="submit" value="update" name="id" alt="update" class="btn btn-outline-dark" />	
					        </form:form> 
	       				</td>
	        		</tr>
	        	</c:forEach>
			</tbody>
		</table>
		
		
	</div>
</tags:paginaTemplate>