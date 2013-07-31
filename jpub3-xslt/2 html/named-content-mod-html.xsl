<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!-- Demonstration customization layer for JATS Preview XSLT.      -->
<!-- By Wendell Piez, Mulberry Technologies, Inc. (October 2010).  -->

<!-- Customization: map various types of 'named-content' to
     'monospace', with enhancements. -->
<!-- ============================================================= -->


<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="jpub3-html.xsl"/>

<xsl:template match="named-content[@content-type='gi']">
  <!-- when content-type='gi', angle brackets are provided -->
  <tt>
    <xsl:text>&lt;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&gt;</xsl:text>
  </tt>
</xsl:template>
  
<xsl:template match="named-content[@content-type='attr']">
  <!-- when content-type='attr', an '@' is provided -->
  <tt>
    <xsl:text>@</xsl:text>
    <xsl:apply-templates/>
  </tt>
</xsl:template>
  
<xsl:template match="named-content[@content-type='command'] |
  named-content[@content-type='file'] |
  named-content[@content-type='variable']">
  <!-- several other types of named-content map to monospace -->
  <tt>
    <xsl:apply-templates/>
  </tt>
</xsl:template>
  
</xsl:stylesheet>
