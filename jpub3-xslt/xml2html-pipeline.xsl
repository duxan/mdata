<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--  MODULE:    Saxon shell (pipelining) stylesheet               -->
<!--             HTML Preview with APA-like citations              -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      January 2009                                      -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--  SYSTEM:    NCBI Archiving and Interchange Journal Articles   -->
<!--                                                               -->
<!--  PURPOSE:   Pipelines stylesheets to convert                  -->
<!--             Journal Publishing 3.0 XML as follows:            -->
<!--             1. format citations in APA-like style             -->
<!--             2. ....           -->
<!--                                                               -->
<!--  PROCESSOR DEPENDENCIES:                                      -->
<!--             Saxon, from Saxonica (www.saxonica.com)           -->
<!--             Tested using Saxon 9.1.0.3 (B and SA)             -->
<!--                                                               -->
<!--  COMPONENTS REQUIRED:                                         -->
<!--             main/xxxxxxxxxx.xsl, plus all the stylesheets     -->
<!--             named in the $processes variable declaration      -->
<!--                                                               -->
<!--  INPUT:     Journal Publishing 3.0 XML with citations         -->
<!--             in APA format                                     -->
<!--                                                               -->
<!--  OUTPUT:    HTML                                              -->
<!--                                                               -->
<!--  CREATED FOR:                                                 -->
<!--             Digital Archive of Journal Articles               -->
<!--             National Center for Biotechnology Information     -->
<!--                (NCBI)                                         -->
<!--             National Library of Medicine (NLM)                -->
<!--                                                               -->
<!--  CREATED BY:                                                  -->
<!--             Wendell Piez, Mulberry Technologies, Inc.         -->
<!--                                                               -->
<!--  MODIFIED BY:                                                 -->
<!--             Dušan Ranđelović, www.pantype.com,                -->
<!--             randjelovic@pantype.com                           -->
<!--                                                               -->
<!--  DATE OF LAST MODIFICATION:      July 2013                    -->
<!--                                                               -->
<!-- ============================================================= -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  version="2.0"
  extension-element-prefixes="saxon">

  <xsl:output
  method="html"
  omit-xml-declaration="yes"
  doctype-system="about:legacy-compat"  
  encoding="utf-8"
  indent="yes"
  />
  
  <xsl:variable name="processes">
    <!-- APA citation preparation, NLM module with modifications on mode="mixed" and with added named-content wrapper -->
    <step>1 prep/jpub3-APAcit.xsl</step>
	<!-- Plain HTML -->
    <step>2 html/jpub3-html.xsl</step> 
    <!-- Extended HTML -->
    <!-- <step>pantype/...</step>  -->
	<!-- mdata enriched HTML -->
    <step>3 mdata/jpub3-mData.xsl</step>  
	<!-- ePub -->
    <!-- <step>pantype/...</step>  -->
	<!-- Post -->
    <step>4 post/jpub3-post.xsl</step>  
  </xsl:variable>

  <!-- Saxon pipelining settings -->
  <xsl:include href="pantype/shell-utility.xsl"/>  
  
</xsl:stylesheet>
