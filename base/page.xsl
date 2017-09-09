<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/TR/xhtml1/strict">
  <xsl:output
   method="html"
   indent="yes"
   encoding="UTF-8"
   doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
/>
  <xsl:template match="interactions/interaction/parameters/cparameter">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
       
        <link rel="stylesheet" href="system/css/FeedEk.css" type="text/css"/>
		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		 <script type="text/javascript" src="system/js/FeedEk.js"></script>
         
		 <script type="text/javascript">
    		$(document).ready(function () { 
			<xsl:call-template name="buildContentArea"></xsl:call-template>
			});    
		</script>

      </head>
      <body>
        <div id="rssDiv">
        <xsl:call-template name="buildBodyArea"></xsl:call-template>
		</div>
        
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="buildContentArea">
      <xsl:for-each select="optionpage">
            <xsl:call-template name="buildContent">
            	 <xsl:with-param name="counter" select="position()" />
            </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
  
  
  <xsl:template name="buildContent">
  	<xsl:param name="counter"/>
     <xsl:for-each select="entrydata">
      <xsl:if test="input/@optionStore='TextArea_1'">
        
        <xsl:variable name="content">
      		 <xsl:value-of select="normalize-space(.)"/>
        </xsl:variable>
        
         <xsl:variable name="maxcount">
				<xsl:value-of select="following-sibling::*[1]/input"/>
		  </xsl:variable>
          
		<xsl:variable name="DescCharacterLimit">
				<xsl:value-of select="following-sibling::*[3]/input"/>
		</xsl:variable>
          
		 $('#divRss<xsl:value-of select="$counter"/>').FeedEk({
            FeedUrl: '<xsl:value-of select="$content"/>',
            MaxCount: <xsl:value-of select="$maxcount"/>,
            DescCharacterLimit: <xsl:value-of select="$DescCharacterLimit"/>,
            ShowDesc: true
            });
            
	
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="buildBodyArea">
      <xsl:for-each select="optionpage">
            <xsl:call-template name="buildBodyContent">
            	 <xsl:with-param name="counter" select="position()" />
            </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
  
  
  <xsl:template name="buildBodyContent">
  	<xsl:param name="counter"/>
     <xsl:for-each select="entrydata">
      <xsl:if test="input/@optionStore='TextArea_1'">
      <p class='description'>
      <xsl:value-of select="following-sibling::*[6]/input"/>
       </p>        
          <xsl:element name="div">
                  <xsl:attribute name="id">
                    <xsl:value-of select="concat('divRss',$counter)"/>
                  </xsl:attribute>
          </xsl:element>
          	
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <!-- 	@param text         : main string
		@param replace : the string fragment to be replaced
		@param by           :  the replacement string
-->
  <xsl:template name="string-replace-all">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="by"/>
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$by"/>
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text"
          select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="by" select="$by"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>





  <xsl:template name="getPageTitle">
		<xsl:param name="text"/>
		<xsl:for-each select="optionpage">

			<xsl:variable name="sectionCounter">
				<xsl:value-of select="position()"/>
			</xsl:variable>

				<xsl:for-each select="entrydata">
					<xsl:if test="input/@optionStore='TextArea_1'">
						<xsl:if test="$sectionCounter = 1">
							<xsl:value-of select="normalize-space(.)" disable-output-escaping="yes"/>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>

		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>




