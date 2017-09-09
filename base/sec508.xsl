
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/TR/xhtml1/strict">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	<xsl:template name="strip-HTML">
		<xsl:param name="text"/>
		<xsl:choose>
			<xsl:when test="contains($text, '&gt;')">
				<xsl:choose>
					<xsl:when test="contains($text, '&lt;')">
						<xsl:value-of select="concat(substring-before($text, '&lt;'), ' ')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="substring-before($text, '&gt;')"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="strip-HTML">
					<xsl:with-param name="text" select="substring-after($text, '&gt;')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="leave-HTML">
		<xsl:param name="text"/>
		<xsl:value-of select="$text"  disable-output-escaping="yes"/>
	</xsl:template>
	<xsl:template match="interactions/interaction/parameters/cparameter">
		<html>
			<head>
				<title><xsl:call-template name="getPageTitle">
					<xsl:with-param name="text" select="."/>
				</xsl:call-template></title>
				<link rel="stylesheet" href="stylesheets/sec508.css" type="text/css" media="screen"/>
			</head>
			<body>
				<a name="top"/>
				<em>This text represents content that has been extracted from a presentation.</em>
				<br /><br />
				<a href="#topic_1">Skip to content.</a>
				<br />
				<xsl:call-template name="getNavigator">
					<xsl:with-param name="text" select="."/>
				</xsl:call-template>
				<xsl:for-each select="optionpage">
					<xsl:variable name="sectionCounter">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<xsl:for-each select="entrydata">
						<xsl:if test="input/@optionStore='TextArea_1'">
							<xsl:if test="(string(input))">
								<xsl:element name="a">
									<xsl:attribute name="name">topic_<xsl:value-of select="$sectionCounter"/>
									</xsl:attribute>
								</xsl:element>
								<xsl:choose> 
						<xsl:when test="$sectionCounter = 1"> 
						 	<h1>
								<xsl:value-of select="input"/>
							</h1>
						</xsl:when> 
						<xsl:otherwise> 
						 	<h2>
								<xsl:value-of select="input"/>
							</h2>
						</xsl:otherwise> 
						</xsl:choose> 
							</xsl:if>
						</xsl:if>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						<xsl:if test="input/@type='JetOptionAdvancedHTMLEditor'">
							<p>
								<xsl:if test="(string(input))">
									<xsl:choose>
										<xsl:when test="contains(input, '&gt;')">
											<xsl:call-template name="leave-HTML">
												<xsl:with-param name="text" select="input"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</xsl:if>
							</p>
						</xsl:if>
						<xsl:if test="input/@type='JetOptionImageArea'">
							<xsl:if test="(string(imageCaption))">Image of
                <xsl:value-of select="imageCaption"/>
								<br/>
							</xsl:if>
							<xsl:if test="(string(imageSource))">
								<xsl:value-of select="imageSource"/>
								<br/>
							</xsl:if>
						</xsl:if>
						<xsl:if test="input/@optionStore='TextArea_2'">
							<xsl:if test="(string(input))">
								<br/>Question:
                <xsl:value-of select="input"/>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
					<a class="navToTopLink" href="#top">Go to the top of the page.</a>
					<hr/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="getNavigator">
		<xsl:param name="text"/>
		<h2>Table of Contents</h2>
		<ul id="navigator">
			<xsl:for-each select="optionpage">
				<xsl:variable name="sectionCounter">
					<xsl:value-of select="position()"/>
				</xsl:variable>
				<xsl:for-each select="entrydata">
					<xsl:call-template name="getNavItem">
						<xsl:with-param name="text" select="."/>
						<xsl:with-param name="navIndex" select="$sectionCounter"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:for-each>
			
		</ul>
	</xsl:template>
	<xsl:template name="getNavItem">
		<xsl:param name="text"/>
		<xsl:param name="navIndex"/>
		<xsl:if test="input/@optionStore='TextArea_1'">
			<li>
				<a class="navItem">
					<xsl:attribute name="href">
						<xsl:value-of select="concat('#topic_',$navIndex)"/>
					</xsl:attribute>
					<xsl:value-of select="normalize-space(.)" disable-output-escaping="yes"/>
				</a>
			</li>
		</xsl:if>
	</xsl:template>
	
	
	
	<xsl:template name="getPageTitle">
		<xsl:param name="text"/>
		<xsl:for-each select="optionpage">
			
			<xsl:variable name="sectionCounter">
				<xsl:value-of select="position()"/>
			</xsl:variable>
			
				<xsl:for-each select="entrydata">
					<xsl:if test="input/@optionStore='Title'">
						<xsl:if test="$sectionCounter = 1">
							<xsl:value-of select="normalize-space(.)" disable-output-escaping="yes"/>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			
		</xsl:for-each>
	</xsl:template>
	
	
</xsl:stylesheet>
