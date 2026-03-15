<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html lang="es">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Le Nid de Café - Productos</title>
<link rel="stylesheet" href="/PRE/CSS/index.css"/>
<link rel="stylesheet" href="/PRE/CSS/header.css"/>
<link rel="stylesheet" href="/PRE/CSS/footer.css"/>
<link rel="stylesheet" href="/PRE/CSS/producto.css"/>
<style>
.precio-baratoclass{color:green;font-weight:bold;}
.precio-caraclass{color:red;font-size:1.2em;}
.precio-normalclass{color:black;}
.tag-destacado{background:gold;padding:2px;border-radius:4px;}
</style>
</head>
<body>

<!-- HEADER -->
<header class="main-header">
<nav>
<a href="/PRE/index.html" class="logo">
<img src="/PRE/Img/logo_final.png" alt="Logo Le Nid de Café"/>
<span>Le Nid de Café</span>
</a>
<ul class="menu">
<li><a href="/PRE/index.html">Inicio</a></li>
<li><a href="/PRE/datos/cafes.xml" class="active">Productos</a></li>
<li><a href="/PRE/Sites/accesorios.html">Accesorios</a></li>
<li><a href="/PRE/Sites/ofertas.html">Ofertas</a></li>
<li><a href="/PRE/Sites/formulario.html">Contacto</a></li>
<li><a href="/PRE/Sites/login.html" class="btn-login">Iniciar sesión</a></li>
</ul>
</nav>
</header>

<!-- MAIN - ESTADÍSTICAS -->
<main>
<section class="page-title">
<h1>Nuestros Cafés (XSLT)</h1>
<p>Total cafés: <xsl:value-of select="count(//cafe)"/> | 
Precio total: <xsl:value-of select="sum(//cafe/precio)"/>€ | 
Destacados: <xsl:value-of select="count(//cafe[@destacado='true'])"/></p>
</section>

<!-- PRODUCTOS - FOR-EACH + SORT + FILTRO -->
<section class="products-grid-container">
<xsl:for-each select="//cafe[precio &gt;= 10]">
<xsl:sort select="@origen"/>
<xsl:sort select="precio" data-type="number" order="descending"/>
<article class="product-card-full">
<div class="card-image">
<img>
<xsl:attribute name="src">/PRE/<xsl:value-of select="imagen"/></xsl:attribute>
<xsl:attribute name="alt"><xsl:value-of select="nombre"/></xsl:attribute>
<xsl:if test="@destacado='true'">
<span class="tag-destacado">DESTACADO</span>
</xsl:if>
</img>
</div>
<div class="card-details">
<h2>
<xsl:value-of select="position()"/>.
<xsl:value-of select="nombre"/>
<span>( <xsl:value-of select="@origen"/> )</span>
</h2>
<p class="description"><xsl:value-of select="descripcion"/></p>

<!-- PRECIO CON CHOOSE CORREGIDO -->
<div class="price-action">
<span class="precio">
<xsl:choose>
<xsl:when test="precio &lt; 12">
<xsl:attribute name="class">precio-baratoclass</xsl:attribute>
</xsl:when>
<xsl:when test="precio &gt; 14">
<xsl:attribute name="class">precio-caraclass</xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="class">precio-normalclass</xsl:attribute>
</xsl:otherwise>
</xsl:choose>
<xsl:value-of select="precio"/>€
</span>
<button class="btn-buy">Añadir al carrito</button>
</div>

<!-- DATOS EXTRA -->
<p>Intensidad: <xsl:value-of select="intensidad"/>/10 | 
Stock: <xsl:value-of select="stock"/>g | 
Tueste: <xsl:value-of select="@tueste"/></p>

<!-- ETIQUETAS -->
<div class="etiquetas">
<xsl:for-each select="etiquetas/etiqueta">
<span class="etiqueta"><xsl:value-of select="."/></span>
</xsl:for-each>
</div>
</div>
</article>
</xsl:for-each>
</section>
</main>

<!-- FOOTER -->
<footer>
<div class="footer-container">
<div class="footer-secciones">
<h3>Secciones</h3>
<ul>
<li><a href="/PRE/index.html">Inicio</a></li>
<li><a href="/PRE/datos/cafes.xml">Productos</a></li>
<li><a href="/PRE/Sites/accesorios.html">Accesorios</a></li>
</ul>
</div>
<div class="footer-contacto">
<h3>Contacto</h3>
<ul>
<li>986-203-475</li>
<li><a href="mailto:leniddecafe@gmail.com">leniddecafe@gmail.com</a></li>
</ul>
</div>
</div>
<p>Le Nid de Café © 2025 - Generado con XSLT</p>
</footer>

</body>
</html>
</xsl:template>

</xsl:stylesheet>
