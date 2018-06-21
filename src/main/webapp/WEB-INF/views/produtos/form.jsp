<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:paginaTemplate titulo="Cadastro de Produtos">

	<div class="container">
		
		<h2>Cadastro de Produtos</h2>
		<div class="col-8">
		<form:form action="${s:mvcUrl('PC#salvar').build()}" method="POST" enctype="multipart/form-data" modelAttribute="produto">
			<form:input path="id" type="hidden"/>
			<form:input path="imagem" type="hidden"/>
			
			<div class="form-group">
				<label for="nome">Nome</label> 
				<form:input cssClass="form-control" path="nome" placeholder="Nome"/>
				<form:errors path="nome" cssClass="erro"/>
			</div>
			
			<div class="form-group">
				<label> Imagem </label>
				<input type="file" class="form-control" name="file"/>
			</div>
			
			
			<div class="form-group">
				<label for="marca">Marca</label> 
				<form:input cssClass="form-control" path="marca" placeholder="Marca do produto" />
				<form:errors path="marca" cssClass="erro"/>
			</div>
			<div class="form-group">
				<label for="descricao">Descrição:</label>
				<form:textarea  cssClass="form-control" path="descricao" rows="4"></form:textarea>
				<form:errors path="descricao" cssClass="erro"/>
			</div>
			
			<div class="form-row">
			
				<div class="form-group col-md-6">
					<label for="preco">Preco:</label>
					<form:input cssClass="form-control" path="preco" placeholder="Preço do produto" />
					<form:errors path="preco" cssClass="erro"/>
				</div>
				<div class="form-group col-md-6">
					<label for="tipo">Tipo</label> 
					<form:select class="form-control" path="tipo">
						<form:option selected="selected" disabled="disabled" value="">Selecione o Tipo</form:option>
						<form:option value="Smartphone">Smartphone</form:option>
						<form:option value="Notebook">Notebook</form:option>
						<form:option value="Televisor">Televisor</form:option>
					</form:select>
					<form:errors path="tipo" cssClass="erro"/>
				</div>
				<button type="submit" class="btn btn-primary">Cadastrar</button>
			
			</div>
		</form:form>
		</div>
	</div>
</tags:paginaTemplate>