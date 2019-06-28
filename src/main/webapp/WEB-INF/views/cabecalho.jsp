<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>


<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark nav-primaria">
			<a class="navbar-brand h1 mb-0" href="${s:mvcUrl('HC#home').build()}">Loja Eletrônicos</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSite" aria-controls="navbarSite" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSite">
				<ul class="navbar-nav mr-auto itens-site">
					<li class="nav-item"><a class="nav-link" href="${s:mvcUrl('HC#home').build()}">Home</a></li>
					<li class="nav-item dropdown produtos">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" 
				        	aria-haspopup="true" aria-expanded="false">	Nossos Produtos
				        </a>
				        <div class="dropdown-menu">
				          <a class="dropdown-item" href="${s:mvcUrl('PC#listaCelulares').build()}">Smartphones</a>
				          <a class="dropdown-item" href="${s:mvcUrl('PC#listaNotebooks').build()}">Notebooks</a>
				          <a class="dropdown-item" href="${s:mvcUrl('PC#listaTelevisores').build()}">Televisores</a>
				        </div>
				    </li>
				    <security:authorize access="hasRole('ADMIN')">
					<li class="nav-item dropdown admim">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" 
				        	aria-haspopup="true" aria-expanded="false">	Administração
				        </a>
				        <div class="dropdown-menu">
				          <a class="dropdown-item" href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos</a>
				          <a class="dropdown-item" href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a>
				          <a class="dropdown-item" href="${s:mvcUrl('PC#listaTelevisores').build()}">Cadastro de Administrador</a>
				        </div>
				    </li>
				    </security:authorize>
				</ul>
				<ul class="navbar-nav ml-auto itens-usuarios">
					<security:authorize access="isAnonymous()">
						<li class="nav-item nav-item-login"><a class="nav-link" href="${s:mvcUrl('LC#login').build()}">Login</a></li>
						<li class="nav-item nav-item-cadastro"><a class="nav-link" href="${s:mvcUrl('UC#formCadastro').build()}">Cadastrar</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li class="nav-item dropdown item-usuario">
					        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" 
					        	aria-haspopup="true" aria-expanded="false">	<security:authentication property="principal.username" />
					        </a>
					        <div class="dropdown-menu">
					          <a class="dropdown-item" href="/logout">Sair</a>
					        </div>
					    </li>
						<li class="nav-item nav-item-cadastro">
							<a class="nav-link" href="${s:mvcUrl('CC#itens').build()}"> Carrinho (${carrinhoCompras.getTotalItens()}) </a>
						</li>
					</security:authorize>
				</ul>
				
			</div>
	</nav>
	