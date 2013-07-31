<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!-- Demonstration customization layer for JATS Preview XSLT.      -->
<!-- By Wendell Piez, Mulberry Technologies, Inc. (October 2010).  -->

<!-- Customization: change the name of the CSS file invoked in
     the result. -->
<!-- ============================================================= -->


<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="jpub3-html.xsl"/>
  
<xsl:param name="css">custom-preview.css</xsl:param>

</xsl:stylesheet>