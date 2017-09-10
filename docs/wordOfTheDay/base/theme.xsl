<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/TR/xhtml1/strict">
  <xsl:output
   method="text"
   indent="yes"
   encoding="UTF-8"
/>
  <xsl:template match="interface">	
.feedEkList{margin:10px; list-style:none outside none;background-color:<xsl:value-of select="interaction/innerBgColor"/>; border:1px solid #D3CAD7; padding:4px 6px; color:#3E3E3E;}
.feedEkList li{border-bottom:1px solid #D3CAD7; padding:5px;}
.feedEkList li:last-child{border-bottom:none;}
.itemTitle a{font-weight:bold; color:#4EBAFF !important; text-decoration:none }
.itemTitle a:hover{ text-decoration:underline }
.itemDate{font-size:11px;color:#AAAAAA;} 
.description{margin:10px; font-family:"Arial";margin-top:20px;font-weight:bold;font-size:14px;color:#000000;} 
body{background:<xsl:value-of select="interaction/outerBgColor"/>}
  </xsl:template>
</xsl:stylesheet>







