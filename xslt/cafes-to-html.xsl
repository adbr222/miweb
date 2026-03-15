<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

<!-- Variables globales con cálculos -->
<xsl:variable name="totalCafes" select="count(//cafe)"/>
<xsl:variable name="precioTotal" select="sum(//cafe/precio)"/>
<xsl:variable name="precioMedio" select="$precioTotal div $totalCafes"/>
<xsl:variable name="cafesDestacados" select="count(//cafe[@destacado='true'])"/>

<xsl:template match="/">
<html lang="es" xml:lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Productos - Le Nid de Café</title>
    <!-- Paths ABSOLUTOS para GitHub Pages /PRE/ -->
    <link rel="stylesheet" href="/PRE/CSS/index.css"/>
    <link rel="stylesheet" href="/PRE/CSS/header.css"/>
    <link rel="stylesheet" href="/PRE/CSS/footer.css"/>
    <link rel="stylesheet" href="/PRE/CSS/producto.css"/>
    <style>
        .precio.baratoclass { color: green; font-weight: bold; }
        .precio.mediaclass { color: orange; }
        .precio.caraclass { color: red; font-size: 1.2em; }
        .destacado { border: 2px solid gold; }
    </style>
</head>
<body>
    <!-- HEADER completo (faltaban cierres en tu original) -->
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

    <main>
        <section class="page-title" aria-label="Estadísticas cafés">
            <h1>Nuestros cafés</h1>
            <p>Total cafés: <xsl:value-of select="$totalCafes"/> | 
            Precio medio: <xsl:value-of select="format-number($precioMedio, '€#,##0.00')"/> | 
            Destacados: <xsl:value-of select="$cafesDestacados"/></p>
        </section>

        <!-- CORE: for-each + sort MÚLTIPLE + FILTRADO + choose CONDICIONAL -->
        <section class="products-grid-container">
            <xsl:for-each select="//cafe[precio >= 10]">  <!-- FILTRADO: solo >=10€ -->
                <xsl:sort select="@origen"/>  <!-- CRITERIO 1: Origen alfabético -->
                <xsl:sort select="intensidad" data-type="number" order="descending"/>  <!-- CRITERIO 2: Intensidad ↓ -->
                
                <article class="product-card-full destacado{@destacado}" 
                         aria-label="{nombre} de {@origen}">
                    <div class="card-image">
                        <img alt="{nombre} - {@origen}">
                            <xsl:attribute name="src">/PRE/<xsl:value-of select="imagen"/></xsl:attribute>
                        <xsl:if test="@destacado='true'">
                            <span class="tag-new">¡Destacado!</span>
                        </xsl:if>
                        </img>
                    </div>
                    <div class="card-details">
                        <h2>
                            <xsl:value-of select="position()"/>. 
                            <xsl:value-of select="nombre"/> 
                            (<xsl:value-of select="@origen"/>)
                        </h2>
                        <p class="description"><xsl:value-of select="descripcion"/></p>
                        <ul class="etiquetas">
                            <xsl:for-each select="etiquetas/etiqueta">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                        <div class="price-action">
                            <span class="price 
                            <!-- FORMATO CONDICIONAL AVANZADO con choose -->
                            <xsl:choose>
                                <xsl:when test="precio &lt; 12">baratoclass</xsl:when>
                                <xsl:when test="precio &gt; 14">caraclass</xsl:when>
                                <xsl:otherwise>mediaclass</xsl:otherwise>
                            </xsl:choose>">
                                <xsl:value-of select="format-number(precio, '€#,##0.00')"/>
                            </span>
                            <button class="btn-buy">Añadir al carrito</button>
                        </div>
                        <p>Intensidad: <xsl:value-of select="intensidad"/>/10 | 
                           Stock: <xsl:value-of select="stock"/>g | 
                           Tueste: <xsl:value-of select="@tueste"/></p>
                    </div>
                </article>
            </xsl:for-each>
        </section>
    </main>

    <!-- FOOTER completo y semántico -->
    <footer class="main-footer">
        <div class="footer-container">
            <section class="footer-secciones">
                <h3>Secciones</h3>
                <ul>
                    <li><a href="/PRE/index.html">Inicio</a></li>
                    <li><a href="/PRE/datos/cafes.xml">Productos</a></li>
                    <li><a href="/PRE/Sites/accesorios.html">Accesorios</a></li>
                    <li><a href="/PRE/Sites/ofertas.html">Ofertas</a></li>
                </ul>
            </section>
            <section class="footer-contacto">
                <h3>Contacto</h3>
                <ul>
                    <li>Teléfono: 986-203-475</li>
                    <li><a href="mailto:leniddecafe@gmail.com">leniddecafe@gmail.com</a></li>
                    <li><a href="/PRE/Sites/formulario.html">Formulario</a></li>
                </ul>
            </section>
            <section class="footer-legal">
                <h3>Legal</h3>
                <ul>
                    <li>Términos y Condiciones</li>
                    <li>Política de Privacidad</li>
                </ul>
            </section>
        </div>
        <p>Le Nid de Café • © 2025 • Todos los derechos reservados</p>
    </footer>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
