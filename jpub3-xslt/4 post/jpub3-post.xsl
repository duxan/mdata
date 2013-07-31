<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!-- .....................      								   -->
<!-- .............  											   -->

<!-- ............................................................. -->
<!-- ============================================================= -->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="css" select="'jpub-preview.css'"/>

<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>


<!-- ============================================================= -->
<!--  ROOT TEMPLATE - HANDLES HTML FRAMEWORK                       -->
<!-- ============================================================= -->

  <xsl:template match="/">
    <html>
      <!-- HTML header -->
      <xsl:call-template name="make-html-header"/>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>


  <xsl:template name="make-html-header">
    <head>
      <title>
        <xsl:variable name="authors">
          <xsl:call-template name="author-string"/>
        </xsl:variable>
        <xsl:value-of select="normalize-space($authors)"/>
        <xsl:if test="normalize-space($authors)">: </xsl:if>
        <xsl:value-of
          select="/article/front/article-meta/title-group/article-title[1]"/>
      </title>
      <link rel="stylesheet" type="text/css" href="{$css}"/>
      <!-- any other header stuff? -->
    </head>
  </xsl:template>
  
  
<!-- ============================================================= -->
<!--  "author-string" writes authors' names in sequence            -->
<!-- ============================================================= -->

    <xsl:template name="author-string">
    <xsl:variable name="all-contribs"
      select="/article/front/article-meta/contrib-group/contrib/name/surname |
              /article/front/article-meta/contrib-group/contrib/collab"/>
   <xsl:for-each select="$all-contribs">
      <xsl:if test="count($all-contribs) &gt; 1">
        <xsl:if test="position() &gt; 1">
          <xsl:if test="count($all-contribs) &gt; 2">,</xsl:if>
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:if test="position() = count($all-contribs)">and </xsl:if>
      </xsl:if>
      <xsl:value-of select="."/>
    </xsl:for-each>
  </xsl:template>
  
<!-- ============================================================= -->
<!--  Footer branding                                              -->
<!-- ============================================================= -->

<xsl:template match="footer/p">
<xsl:call-template name="footer-branding"/> 
</xsl:template>

  <xsl:template name="footer-branding">
  <p>
        <xsl:text>This display is generated from </xsl:text>
        <xsl:text>NLM/NCBI Journal Publishing 3.0 XML with </xsl:text>
        <b>jpub3-html.xsl</b>
        <xsl:text>. The XSLT engine is </xsl:text>
        <xsl:value-of select="system-property('xsl:vendor')"/>
  </p>
  </xsl:template>
  
  <xsl:template match="section[ancestor::section[@id='body']]">
<xsl:copy>
<xsl:copy-of select="@*"/>
	<xsl:attribute name="id">
		<xsl:value-of select="./node()/@id"/>
	</xsl:attribute>
	<xsl:apply-templates select="node()"/>
</xsl:copy>
   </xsl:template>

</xsl:stylesheet>
