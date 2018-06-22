<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>


<tags:paginaTemplate titulo="">
	
	<div id="carouselHome" align="center" class="carousel slide carousel-home justify-content-center" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  </ol>
	  <div class="carousel-inner" align="center">
	    <div class="carousel-item active">
	      <a href="${s:mvcUrl('PC#listaCelulares').build()}">
	      	<img class="d-block w-100" src="resources/imagens/Carousel/slide-smartphones.jpg" alt="First slide">
	      </a>
	      <div class="carousel-caption d-none d-md-block">
		    <h5>Os Melhores Smarthphones do Mercado</h5>
		    <p>Garanta já o seu!</p>
		  </div>
	    </div>
	    <div class="carousel-item">
	      <a href="${s:mvcUrl('PC#listaNotebooks').build()}">
	      	<img class="d-block w-100" src="resources/imagens/Carousel/slide-notebooks.jpg" alt="Second slide">
	      </a>
	      <div class="carousel-caption d-none d-md-block">
		    <h5>Os Melhores Notebooks do Mercado</h5>
		    <p>Garanta já o seu!</p>
		  </div>
	    </div>
	    <div class="carousel-item">
	      <a href="${s:mvcUrl('PC#listaTelevisores').build()}"> 
	      	<img class="d-block w-100" src="resources/imagens/Carousel/slide-televisoes.jpg" alt="Third slide">
	      </a>
	      <div class="carousel-caption d-none d-md-block">
		    <h5>As Melhores Televisões do Mercado</h5>
		    <p>Garanta já a sua!</p>
		  </div>
	    </div> 
	  </div>
	  <a class="carousel-control-prev" href="#carouselHome" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselHome" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	
	<div class="container  ">
		
		<div class="links-produtos row text-center">
	        <div class="col-lg-4">
	          <img class="rounded-circle" src="resources/imagens/icones-home/Smartphone-icone.png"
	          		 alt="Generic placeholder image" width="140" height="140">
	          <h2>Smartphones</h2>
	          <p>Conheça os melhores e mais baratos Smartphones do mercado, com entrega gratuita para todo Brasil,
	          		 não perca essa chance.</p>
	          <p><a class="btn btn-secondary" href="${s:mvcUrl('PC#listaCelulares').build()}" role="button">Comprar Smartphones &raquo;</a></p>
	        </div><!-- /.col-lg-4 -->
	        <div class="col-lg-4">
	          <img class="rounded-circle" src="resources/imagens/icones-home/notebook-icone.png" 
	          		alt="Generic placeholder image" width="140" height="140">
	          <h2>Notebooks</h2>
	          <p>Conheça os melhores e mais baratos Notebooks do mercado, com entrega gratuita para todo Brasil,
	          		 não perca essa chance.</p>
	          <p><a class="btn btn-secondary" href="${s:mvcUrl('PC#listaNotebooks').build()}" role="button">Comprar Notebooks &raquo;</a></p>
	        </div>
	        <div class="col-lg-4">
	          <img class="rounded-circle" src="resources/imagens/icones-home/tv-icone.png" 
	          		alt="Generic placeholder image" width="140" height="140">
	          <h2>Televisores</h2>
	          <p>Conheça os melhores e mais baratos Televisores do mercado, com entrega gratuita para todo Brasil,
	          		 não perca essa chance.</p>
	          <p><a class="btn btn-secondary" href="${s:mvcUrl('PC#listaTelevisores').build()}" role="button">Comprar Televisores &raquo;</a></p>
	        </div>
        </div>
        
        <div class="maisVendidos">
        	<c:if test="${not empty smartphones }">
				<h3 class="mb-0" > Smartphones Mais Vendidos</h3>
				<div class="row mb-2">
					<c:forEach items="${smartphones}" var="celular">
						<div class="card col-md-3 col-sm-6 my-1 produto">
							<a href="${s:mvcUrl('PC#detalhe').arg(0,celular.id).build()}">
								<img class="card-img-top img-produto" src="${celular.imagem}" alt="Card image cap">
							</a>
							<div class="card-body ">
								<h5 class="card-title text-center">${celular.nome }</h5>
								<p class="card-subtitle text-center">Preço: R$${celular.preco }</p>
							</div>
							<p class="card-footer text-center">
									<small class="text-muted"><a class="btn btn-outline-dark btn-block" 
										href="${s:mvcUrl('PC#detalhe').arg(0,celular.id).build()}">Compre</a> </small>
							</p>
						</div>
					</c:forEach>
				</div>
			</c:if>
			
			<c:if test="${not empty notebooks }">
				<h3 class="mb-0" > Notebooks Mais Vendidos</h3>
				<div class="row mb-2">
					<c:forEach items="${notebooks}" var="notebook">
						<div class="card col-md-3 col-sm-6 my-1 produto">
							<a href="${s:mvcUrl('PC#detalhe').arg(0,notebook.id).build()}">
								<img class="card-img-top img-produto" src="${notebook.imagem}" alt="Card image cap">
							</a>
							<div class="card-body ">
								<h5 class="card-title text-center">${notebook.nome }</h5>
								<p class="card-subtitle text-center">Preço: R$${notebook.preco }</p>
							</div>
							<p class="card-footer text-center">
									<small class="text-muted"><a class="btn btn-outline-dark btn-block" 
										href="${s:mvcUrl('PC#detalhe').arg(0,notebook.id).build()}">Compre</a> </small>
							</p>
						</div>
					</c:forEach>
				</div>
			</c:if>
			
			<c:if test="${not empty televisores }">
				<h3 class="mb-0" > Televisores Mais Vendidos</h3>
				<div class="row mb-2">
					<c:forEach items="${televisores}" var="tv">
						<div class="card col-md-3 col-sm-6 my-1 produto">
							<a href="${s:mvcUrl('PC#detalhe').arg(0,tv.id).build()}">
								<img class="card-img-top img-produto" src="${tv.imagem}" alt="Card image cap">
							</a>
							<div class="card-body ">
								<h5 class="card-title text-center">${tv.nome }</h5>
								<p class="card-subtitle text-center">Preço: R$${tv.preco }</p>
							</div>
							<p class="card-footer text-center">
									<small class="text-muted"><a class="btn btn-outline-dark btn-block" 
										href="${s:mvcUrl('PC#detalhe').arg(0,tv.id).build()}">Compre</a> </small>
							</p>
						</div>
					</c:forEach>
				</div>
			</c:if>
        	
        </div>
			
	</div>
	
</tags:paginaTemplate>