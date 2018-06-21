<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:paginaTemplate titulo="Cadastro de Clientes">

	<div class="container">
		<form:form class="form-signin col-8 form-login"  method="post" modelAttribute="usuario">
		      <h1 class="h3 mb-3 font-weight-normal">Cadastro</h1>
		      <div class="form-group">
			      <label for="inputNome">Nome</label>
			      <form:input type="text" id="inputNome" class="form-control" placeholder="Nome" path="nome"/>
		      </div>
		      <div class="form-group">
			      <label for="inputEmail">Email</label>
			      <form:input type="email" id="inputEmail" class="form-control" placeholder="Email" path="email"/>
		      </div>
		      <div class="form-group">
			      <label for="inputPassword">Senha</label>
			      <form:input type="password" id="inputPassword" class="form-control" path="senha" placeholder="Senha"/>
		      </div>
		      <button class="btn btn-lg btn-primary btn-cadastro-usuario" type="submit">Logar</button>
	    </form:form>
    </div>
    
</tags:paginaTemplate>    