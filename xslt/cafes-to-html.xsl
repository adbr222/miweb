<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html lang="es">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Le Nid de Café - Productos</title>
<link rel="stylesheet" href="../CSS/index.css"/>
<link rel="stylesheet" href="../CSS/header.css"/>
<link rel="stylesheet" href="../CSS/footer.css"/>
<link rel="stylesheet" href="../CSS/producto.css"/>
<style>
.barato{color:green;font-weight:bold;}
.caro{color:red;font-size:1.2em;}
.destacado{background:gold;padding:4px;border-radius:4px;}
.productos{display:grid;grid-template-columns:repeat(auto-fit,minmax(300px,1fr));gap:20px;}
article{padding:20px;border:1px solid #ddd;}
</style>
</head>
<body>

<header class="main-header">
<nav>
<a href="../index.html" class="logo">
<img src="../Img/logo_final.png" alt="Logo Le Nid de Café"/>
<span>Le Nid de Café</span>
</a>
<ul class="menu">
<li><a href="../index.html">Inicio</a></li>
<li><a href="../datos/cafes.xml" class="active">Productos</a></li>
<li><a href="../Sites/accesorios.html">Accesorios</a></li>
<li><a href="../Sites/ofertas.html">Ofertas</a></li>
<li><a href="../Sites/formulario.html">Contacto</a></li>
<li><a href="../Sites/login.html" class="btn-login">Iniciar sesión</a></li>
</ul>
</nav>
</header>

<main>
<section class="page-title">
<h1>Nuestros Cafés</h1>
<p>Total: <xsl:value-of select="count(//cafe)"/> cafés | Precio total: <xsl:value-of select="sum(//cafe/precio)"/>€</p>
</section>

<section class="productos">
<xsl:for-each select="//cafe">
<xsl:sort select="@origen"/>
<xsl:sort select="precio" data-type="number" order="descending"/>
<article>
<div class="card-image">
<img>
<xsl:attribute name="src">../<xsl:value-of select="imagen"/></xsl:attribute>
<xsl:attribute name="alt"><xsl:value-of select="nombre"/></xsl:attribute>
<xsl:if test="@destacado='true'">
<span class="destacado">DESTACADO</span>
</xsl:if>
</img>
</div>
<div class="card-details">
<h2><xsl:value-of select="position()"/>. <xsl:value-of select="nombre"/></h2>
<p><xsl:value-of select="descripcion"/></p>
<div class="price-action">
<span>
<xsl:choose>
<xsl:when test="precio &lt; 12">
<span class="barato"><xsl:value-of select="precio"/>€</span>
</xsl:when>
<xsl:when test="precio &gt; 14">
<span class="caro"><xsl:value-of select="precio"/>€</span>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="precio"/>€
</xsl:otherwise>
</xsl:choose>
</span>
<button class="btn-buy">Añadir al carrito</button>
</div>
<p><strong>Origen:</strong> <xsl:value-of select="@origen"/> | 
<strong>Intensidad:</strong> <xsl:value-of select="intensidad"/> | 
<strong>Stock:</strong> <xsl:value-of select="stock"/>g</p>
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
<li><a href="../index.html">Inicio</a></li>
<li><a href="../datos/cafes.xml">Productos</a></li>
<li><a href="../Sites/accesorios.html">Accesorios</a></li>
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
<p>Le Nid de Café © 2025 - Transformado con XSLT</p>
</footer>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
