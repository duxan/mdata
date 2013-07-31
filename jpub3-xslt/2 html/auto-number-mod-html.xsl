<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!-- Demonstration customization layer for JATS Preview XSLT.      -->
<!-- By Wendell Piez, Mulberry Technologies, Inc. (October 2010).  -->

<!-- Customization: Invoke auto-numbering on several elements;
     introduce it for sections. -->
<!-- ============================================================= -->


<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="jpub3-html.xsl"/>

<!-- We switch on autonumbering for boxed-text, fig and
     table-wrap elements by declaring variables with
     Boolean (true/false) values -->
  
<xsl:variable name="auto-label-boxed-text" select="true()"/>

<xsl:variable name="auto-label-fig" select="true()"/>

<xsl:variable name="auto-label-table-wrap" select="true()"/>

<xsl:variable name="auto-label-app" select="true()"/>
  
<!-- We provide for section numbering as part of the section
     title, using templates that override the imported
     stylesheet and then call its logic, parameterizing
     its contents -->

<xsl:template match="sec/title" priority="1">
  <xsl:call-template name="main-title">
    <!-- It turns out that 'main-title' is the right template
         to call: it generates an h2 -->
    <xsl:with-param name="contents">
      <xsl:number count="sec" level="multiple" format="1. "/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>
  
<xsl:template match="sec/sec/title" priority="2">
  <xsl:call-template name="section-title">
    <!-- The 'section-title' template generates an h3 -->
    <xsl:with-param name="contents">
      <xsl:number count="sec" level="multiple" format="1.1. "/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>