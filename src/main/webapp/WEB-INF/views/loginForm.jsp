<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:paginaTemplate titulo="Cadastro de Produtos">

	<div class="container login-container">
		<form:form class="form-signin col-4 form-login" servletRelativeAction="/login" method="post">
		      <h1 class="h3 mb-3 font-weight-normal">Login</h1>
		      <label for="inputEmail" class="sr-only">Email</label>
		      <input type="email" id="inputEmail" class="form-control" placeholder="Email" name="username" required autofocus>
		      <label for="inputPassword" class="sr-only">Senha</label>
		      <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Senha" required>
		      <div class="checkbox mb-3">
		        <label>
		          <input type="checkbox" value="remember-me"> Remember me
		        </label>
		      </div>
		      <button class="btn btn-lg btn-primary btn-block" type="submit">Logar</button>
		      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
	    </form:form>
    </div>
    
</tags:paginaTemplate>    