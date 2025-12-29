<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0"> 

    <xsl:output method="html"/> 


    <xsl:template match="/">
        <xsl:element name="html"> 
<!-- head du fichier HTML -->
            <xsl:element name="head"> 
                <xsl:element name="meta"> 
                    <xsl:attribute name="charset">
                        <xsl:text>UTF-8</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="meta"> 
                    <xsl:attribute name="name">
                        <xsl:text>viewport</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:text>width=device-width, initial-scale=1.0</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="title">
                    <xsl:text>
                        Visualisation Propheties 1555V
                    </xsl:text>
                </xsl:element>
                <xsl:element name="link">
                    <xsl:attribute name="rel">
                        <xsl:text>stylesheet</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>style.css</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>
            
            
<!-- body du fichier HTML -->
            <xsl:element name="body"> 
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
<!-- Retrait des métadonnées -->    
<xsl:template match="tei:teiHeader"/>
  
    <!--Rendre les strophes-->
    <xsl:template match="tei:lg">
        <xsl:element name="p">
            <xsl:value-of select="@n"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--Rendre les vers-->
    <xsl:template match="tei:l">
        <xsl:element name="br">
            
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
   
    <!-- Titre-->
    <xsl:template match="tei:p">
        <xsl:element name="h1">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Achevé d'imprimer -->
    <xsl:template match="tei:p[@ana='fin']">
        <xsl:element name="h2">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    


    <!-- MOTS (w) avec détection small-caps -->
    <xsl:template match="tei:w">
        <xsl:choose>
            <!-- w dans hi small-caps -->
            <xsl:when test="ancestor::tei:hi[@rend='small-caps']">
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:text>ptescap</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
            <!-- w normal -->
            <xsl:otherwise>
                    <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!-- Signatures et réclames -->
    <xsl:template match="tei:fw">
        <xsl:element name="div">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>fw-</xsl:text>
                <xsl:value-of select="@place"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
        </xsl:element>
    </xsl:template>   
</xsl:stylesheet> 
    
    