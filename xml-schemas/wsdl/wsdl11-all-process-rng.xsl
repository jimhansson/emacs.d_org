<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rng="http://relaxng.org/ns/structure/1.0"
                version="2.0">

   <xsl:template match="@*|node()">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="/rng:grammar">
      <xsl:copy>
         <xsl:apply-templates select="@*"/>
         <rng:define name="wxsSchema">
            <rng:externalRef href="../xmlschema/xmlschema.rng"/>
         </rng:define>
         <xsl:apply-templates select="node()"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="rng:start/rng:choice/rng:ref[@name ne 'definitions']"/>

   <xsl:template match="rng:oneOrMore/rng:zeroOrMore">
      <xsl:apply-templates select="node()"/>
   </xsl:template>

   <xsl:template match="rng:define[@name eq 'types']//rng:zeroOrMore/rng:choice">
      <xsl:copy>
         <xsl:apply-templates select="@*"/>
         <rng:ref name="wxsSchema"/>
         <xsl:apply-templates select="node()"/>
      </xsl:copy>
   </xsl:template>

</xsl:stylesheet>
