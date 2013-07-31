<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!-- Demonstration customization layer for JATS Preview XSLT.      -->
<!-- By Wendell Piez, Mulberry Technologies, Inc. (October 2010).  -->

<!-- Customization: Remove warnings for missing labels             -->
<!-- ============================================================= -->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="jpub3-html.xsl"/>

<!--<xsl:variable name="auto-label-boxed-text" select="true()"/>

<xsl:variable name="auto-label-fig" select="true()"/>

<xsl:variable name="auto-label-table-wrap" select="true()"/>-->


<xsl:template name="make-label-text">
  <xsl:param name="auto" select="false()"/>
  <xsl:param name="warning" select="false()"/>
  <xsl:param name="auto-text"/>
  <xsl:choose>
    <xsl:when test="$auto">
      <span class="generated">
        <xsl:copy-of select="$auto-text"/>
      </span>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates mode="label-text" select="label | @symbol"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
  
  
</xsl:stylesheet>
