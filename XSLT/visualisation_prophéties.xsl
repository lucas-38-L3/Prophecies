<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0"> 
    <!-- Fichier xml, feuille de transformation
    la grammaire est XSLT pour transformer de la tei-->
    <xsl:output method="html"/> 
    
    <!-- Toutes les balises en xsl commencent par xsl: 
    output : le résultat sera en @method-->
    
    <!-- Template 0 : sert à créer le fichier HTML -->
    <xsl:template match="/"> <!-- Placement à la racine du fichier -->
        <xsl:element name="html"> <!-- Création d'une balise dont le nom est "html" -->
            <xsl:element name="head"> 
            </xsl:element> <!-- Structure obligatoire -->
            <xsl:element name="body"> 
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
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
   
    
    <!-- Titre -->
    <xsl:template match="tei:p">
        <xsl:element name="H1">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:lb">
        <xsl:element name="br">
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
    
   
</xsl:stylesheet> 
    
    