<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!-- .....................      								   -->
<!-- .............  											   -->

<!-- ............................................................. -->
<!-- ============================================================= -->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="span[contains(./@class,'mData')]">
  <xsl:copy>
		<xsl:call-template name="mData_insert">
			<xsl:with-param name="mData" select="./@class"/>
		</xsl:call-template>
    <xsl:apply-templates select="node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template name="mData_insert">
<xsl:param name="mData"/>
<xsl:choose>
	<xsl:when test="contains($mData,'mData_prop')">
		<xsl:attribute name="itemprop">
			<xsl:value-of select="tokenize($mData, '_')[last()]"/>
		</xsl:attribute>
	</xsl:when>
	<xsl:when test="contains($mData,'mData_type')">
			<xsl:if test="parent::span[@class='person-group']">
				<xsl:attribute name="itemprop">author</xsl:attribute>
			</xsl:if>
		<xsl:attribute name="itemscope">itemscope</xsl:attribute>
		<xsl:attribute name="itemtype">
			<xsl:value-of select="concat('http://schema.org/', tokenize($mData, '_')[last()])"/>
		</xsl:attribute>
	</xsl:when>
	<xsl:otherwise>
		<xsl:copy-of select="@*"/>
	</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="section[@id='references']">
<xsl:copy>
<xsl:copy-of select="@*"/>
	<xsl:attribute name="itemscope">itemscope</xsl:attribute>
	<xsl:attribute name="itemtype">http://schema.org/ItemList</xsl:attribute>
	<meta itemprop="mainContentOfPage" content="true"/>
	<meta itemprop="ItemListOrder" content="Ascending"/>
	<meta itemprop="about" content="List of cited references"/>
		<xsl:for-each select="h2">
			<xsl:copy>
				<xsl:attribute name="itemprop">name</xsl:attribute>
				<xsl:apply-templates/>
			</xsl:copy>
		</xsl:for-each>
	<xsl:apply-templates select="p"/>
</xsl:copy>
</xsl:template>

<xsl:template match="p[@class='ref']">
<xsl:copy>
<xsl:copy-of select="@*"/>
	<xsl:attribute name="itemprop">ItemListElement</xsl:attribute>
			<xsl:element name="cite">
				<xsl:attribute name="itemprop">citation</xsl:attribute>
				<xsl:attribute name="itemscope">itemscope</xsl:attribute>
				<xsl:attribute name="itemtype">http://schema.org/Article</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
</xsl:copy>
</xsl:template>

<xsl:template match="a[@target='_new']">
<xsl:copy>
<xsl:copy-of select="@*"/>
	<xsl:attribute name="itemprop">url</xsl:attribute>
	<xsl:apply-templates select="node()"/>
</xsl:copy>
</xsl:template>


</xsl:stylesheet>
