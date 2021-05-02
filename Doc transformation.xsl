<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:variable name="head">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>
                <xsl:value-of select="//titleStmt/title"/>
            </title>
        </head>
    </xsl:variable>
    
    <xsl:template match="TEI">
        <xsl:result-document href="/home/tnah/Bureau/Devoir%20XSLT/HTML/accueil.html"
            method="html" indent="yes">
            <html>
                <xsl:value-of select="$head"/>
            <body>
                <h1>
                    <xsl:apply-templates select="//titleStmt/title"/>
                </h1>
                <div>
                    <h2>Préambule</h2>
                    <xsl:apply-templates select="//normalization/p"/>
                </div>
                <div>
                    <ul>
                        <li><a href="{/facsimile/@source}">Lien vers le manuscrit</a></li>
                        <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/facsimile.html">Transcription facsmiliaire</a></li>
                        <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/normalise.html">Transcription normalisée</a></li>
                        <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/info.html">Informations sur le manuscrit</a></li>
                    </ul>
                </div>
            </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="/home/tnah/Bureau/Devoir%20XSLT/HTML/facsimile.html"
            method="html" indent="yes">
            <html>
                <xsl:value-of select="$head"/>
                <body>
                <div>
                    <h2>Transcription facsimilaire</h2>
                    <div>
                        <p>Cela correspond à la transcription répliquant le
                        facsimilé.</p>
                    </div>
                    <div>
                        <ul>
                            <xsl:apply-templates select="//text//div" mode="original"/>
                        </ul>
                    </div>
                    <div>
                        <ul>
                            <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/accueil.html">Accueil</a></li>
                            <li><a href="{/facsimile/@source}">Lien vers le manuscrit</a></li> 
                            <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/normalise.html">Transcription normalisée</a></li>
                            <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/info.html">Informations sur le manuscrit</a></li>
                        </ul>
                    </div>
                </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="/home/tnah/Bureau/Devoir%20XSLT/HTML/normalise.html"
            method="html" indent="yes">
            <html>
                <xsl:value-of select="$head"/>
                <body>
                <div>
                    <h2>Transcription normalisée</h2>
                    <div>
                        <p>Cela correspond à la transcription qui répond aux 
                            exigences actuelles de typographie.</p>
                    </div>
                    <div>
                        <ul>
                            <xsl:apply-templates select="//text//div" mode="normalise"/>
                        </ul>
                    </div>
                    <div>
                        <ul>
                            <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/accueil.html">Accueil</a></li>
                            <li><a href="{/facsimile/@source}">Lien vers le manuscrit</a></li> 
                            <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/facsimile.html">Transcription facsmiliaire</a></li>
                            <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/info.html">Informations sur le manuscrit</a></li>
                        </ul>
                    </div>
                </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="/home/tnah/Bureau/Devoir%20XSLT/HTML/info.html"
            method="html" indent="yes">
            <html>
                <xsl:value-of select="$head"/>
                <body>
                <div>
                    <h1>Informations sur le manuscrit source</h1>
                    <div>
                        <h2>Conservation</h2>
                        <div>
                            <p>Cote : <xsl:value-of select="//msIdentifier/idno"/> (<xsl:value-of select="//msIdentifier/idno/@type"/>)</p>
                            <p>Institution de conservation : <xsl:value-of select="//msIdentifier/repository | //msIdentifier/institution"/> (<xsl:value-of select="//msIdentifier/country"/>)</p>
                        </div>
                        <h2>Composition du manuscrit</h2>
                        <div>
                            <ul><xsl:call-template name="content"/></ul>
                        </div>
                        <a href="{//msIdentifier/@source}">Pour en savoir plus</a>
                        <div>
                            <ul>
                                <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/accueil.html">Accueil</a></li>
                                <li><a href="{/facsimile/@source}">Lien vers le manuscrit</a></li> 
                                <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/facsimile.html">Transcription facsmiliaire</a></li>
                                <li><a href="/home/tnah/Bureau/Devoir%20XSLT/HTML/normalise.html">Transcription normalisée</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="choice" mode="original">
        <xsl:copy-of select="./orig/text() | ./abbr/text() | text()"/>
    </xsl:template>
    
    <xsl:template match="choice" mode="normalise">
        <xsl:value-of select=".//reg/text() | .//expan/text() | text()"/>
    </xsl:template>
    
    <xsl:template match="p" mode="#all">
        <xsl:element name="p">
            <xsl:attribute name="n">
                <xsl:number count="." format="1"/>
            </xsl:attribute>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="msContents" name="content">
        <xsl:for-each select="//msItem">
            <li>
                <ul>
                    <li><xsl:value-of select="concat('Titre', ' : ', ./title)"/></li>
                    <li><xsl:value-of select="concat('Auteur', ' : ', ./author)"/></li>
                    <li><xsl:value-of select="concat('Langue', ' : ', ./textLang)"/></li>
                </ul>
            </li>
        </xsl:for-each>    
    </xsl:template>
    
    <xsl:template match="//text//div">
        <xsl:for-each select="./p">
            
            <xsl:if test="./@facs = concat('#', surface/zone/@xml:id)">
                
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>