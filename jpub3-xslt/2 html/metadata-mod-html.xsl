<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!-- Demonstration customization layer for JATS Preview XSLT.      -->
<!-- By Wendell Piez, Mulberry Technologies, Inc. (October 2010).  -->

<!-- Customization: Reformat metadata, with ToC. -->
<!-- ============================================================= -->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="jpub3-html.xsl"/>

<xsl:param name="css">custom2-preview.css</xsl:param>

<xsl:template match="front | front-stub">
  <xsl:for-each select="article-meta | self::front-stub">
    <!-- changing context to where the elements needed are found -->
    <xsl:apply-templates mode="metadata" select="title-group"/>
    <xsl:apply-templates mode="metadata" select="contrib-group"/>
    <xsl:for-each select="abstract">
      <div class="metadata-group">
        <xsl:if test="not(normalize-space(title))">
          <h4 class="subsection-title">
            <span class="generated">
              <xsl:text>Abstract</xsl:text>
            </span>
          </h4>
        </xsl:if>
        <xsl:apply-templates select="*"/>
      </div>
    </xsl:for-each>
    <xsl:call-template name="toc"/>
  </xsl:for-each>
</xsl:template>

<xsl:template mode="metadata" match="contrib-group">
  <div class="metadata-group">
    <xsl:for-each select="contrib">
      <xsl:apply-templates mode="metadata" select="anonymous | collab | name"/>
      <xsl:apply-templates mode="metadata"
        select="address | aff | author-comment | bio | email |
              ext-link | on-behalf-of | role | uri"/>
    </xsl:for-each>
  </div>
</xsl:template>

<xsl:template name="toc">
  <xsl:if test="/article/body/sec">
    <div class="metadata-group">
      <h4 class="subsection-title">
        <span class="generated">Contents</span>
      </h4>
      <xsl:apply-templates select="/article/body/sec" mode="toc"/>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="sec" mode="toc">
  <xsl:apply-templates select="title | sec" mode="toc"/>
</xsl:template>

<xsl:template match="sec/sec" mode="toc">
  <div style="margin: 0em; margin-left: 1em">
    <xsl:apply-templates select="title | sec" mode="toc"/>
  </div>
</xsl:template>

<xsl:template match="sec/title" mode="toc">
  <xsl:variable name="sec-id">
    <xsl:value-of select="../@id"/>
    <xsl:if test="not(normalize-space(../@id))">
      <xsl:value-of select="generate-id(..)"/>
    </xsl:if>
  </xsl:variable>
  <p style="margin:0em">
    <a href="#{$sec-id}">
      <xsl:apply-templates/>
    </a>
  </p>
</xsl:template>

</xsl:stylesheet>
