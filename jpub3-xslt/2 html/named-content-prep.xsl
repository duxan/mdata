<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!-- Demonstration customization layer for JATS Preview XSLT.      -->
<!-- By Wendell Piez, Mulberry Technologies, Inc. (October 2010).  -->

<!-- Customization: identity transform, plus mapping certain types
     of 'named-content' to 'monospace'. -->
<!-- ============================================================= -->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="node() | @*">
  <xsl:copy>
    <xsl:apply-templates select="node() | @*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="named-content[@content-type='gi']">
  <!-- when content-type='gi', angle brackets are provided -->
  <monospace>
    <xsl:text>&lt;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&gt;</xsl:text>
  </monospace>
</xsl:template>

<xsl:template match="named-content[@content-type='attr']">
  <!-- when content-type='attr', an '@' is provided -->
  <monospace>
    <xsl:text>@</xsl:text>
    <xsl:apply-templates/>
  </monospace>
</xsl:template>

<xsl:template match="named-content[@content-type='command'] |
  named-content[@content-type='file'] |
  named-content[@content-type='variable']">
  <!-- several other types of named-content map to monospace -->
  <monospace>
    <xsl:apply-templates/>
  </monospace>
</xsl:template>

</xsl:stylesheet>
