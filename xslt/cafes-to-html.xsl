<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html lang="es">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Le Nid de Café - Productos</title>
<link rel="stylesheet" href="/miweb/CSS/index.css"/>
<link rel="stylesheet" href="/miweb/CSS/header.css"/>
<link rel="stylesheet" href="/miweb/CSS/footer.css"/>
<link rel="stylesheet" href="/miweb/CSS/producto.css"/>
<style>.barato{color:green;font-weight:bold;}.caro{color:red;font-size:1.2em;}.destacado{border:3px solid gold;padding:5px;}</style>
</head>
<body>

<header class="main-header">
<nav>
<a href="/miweb/index.html" class="logo">
<img src="/miweb/Img/logo_final.png" alt="Logo Le Nid de Café"/>
<span>Le Nid de Café</span>
</a>
<ul class="menu">
<li><a href="/miweb/index.html">Inicio</a></li>
<li><a href="/miweb/xslt/cafes.xml" class="active">Productos</a></li>
<li><a href="/miweb/Sites/accesorios.html">Accesorios</a></li>
<li><a href="/miweb/Sites/ofertas.html">Ofertas</a></li>
<li><a href="/miweb/Sites/formulario.html">Contacto</a></li>
<li><a href="/miweb/Sites/login.html" class="btn-login">Iniciar sesión</a></li>
</ul>
</nav>
</header>

<main>
<section class="page-title">
<h1>Nuestros Cafés</h1>
<p>Total: <xsl:value-of select="count(//cafe)"/> | Precio medio: <xsl:value-of select="format-number(sum(//cafe/precio) div count(//cafe), '€#,##0.00')"/> | Destacados: <xsl:value-of select="count(//cafe[@destacado='true'])"/></p>
</section>

<section class="products-grid-container">
<xsl:for-each select="//cafe[precio &gt;= 10]">
<xsl:sort select="@origen"/>
<xsl:sort select="intensidad" data-type="number" order="descending"/>
<article class="product-card-full">
<div class="card-image">
<img>
<xsl:attribute name="src">/miweb/<xsl:value-of select="imagen"/></xsl:attribute>
<xsl:attribute name="alt"><xsl:value-of select="nombre"/> - <xsl:value-of select="@origen"/></xsl:attribute>
<xsl:if test="@destacado='true'">
<span class="destacado">DESTACADO</span>
</xsl:if>
</img>
</div>
<div class="card-details">
<h2><xsl:value-of select="position()"/>. <xsl:value-of select="nombre"/> (<xsl:value-of select="@origen"/>)</h2>
<p><xsl:value-of select="descripcion"/></p>
<div class="price-action">
<span class="precio">
<xsl:choose>
<xsl:when test="precio &lt; 12"><xsl:attribute name="class">barato</xsl:attribute></xsl:when>
<xsl:when test="precio &gt; 14"><xsl:attribute name="class">caro</xsl:attribute></xsl:when>
<xsl:otherwise><xsl:attribute name="class">normal</xsl:attribute></xsl:otherwise>
</xsl:choose>
<xsl:value-of select="precio"/>€
</span>
<button>Añadir al carrito</button>
</div>
<p>Intensidad: <xsl:value-of select="intensidad"/>/10 | Stock: <xsl:value-of select="stock"/>g | Tueste: <xsl:value-of select="@tueste"/></p>
</div>
</article>
</xsl:for-each>
</section>
</main>

<footer>
<div class="footer-container">
<div class="footer-secciones">
<h3>Secciones</h3>
<ul>
<li><a href="/miweb/index.html">Inicio</a></li>
<li><a href="/miweb/xslt/cafes.xml">Productos</a></li>
<li><a href="/miweb/Sites/accesorios.html">Accesorios</a></li>
</ul>
</div>
<div class="footer-contacto">
<h3>Contacto</h3>
<ul>
<li>Tel: 986-203-475</li>
<li>Email: <a href="mailto:leniddecafe@gmail.com">leniddecafe@gmail.com</a></li>
</ul>
</div>
</div>
<p>Le Nid de Café © 2025 - XSLT funcionando</p>
</footer>

</body>
</html>
</xsl:template>

</xsl:stylesheet>
