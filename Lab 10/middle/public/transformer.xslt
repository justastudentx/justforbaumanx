<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
    <head>
    </head>
    <body>
        <table id="add">
            <caption><h1>Таблица вывода</h1></caption>
            <tbody>
                <tr>
                    <xsl:choose>
                        <xsl:when test="params/count != '0'">
                            <td><xsl:value-of select="params/number"/></td>
                            <td><xsl:value-of select="params/array"/></td>
                            <td><xsl:value-of select="params/double_array"/></td>
                            <td><xsl:value-of select="params/count"/></td>
                        </xsl:when>
                        <xsl:otherwise>
                            <td colspan="4">Нет чисел &lt;= <xsl:value-of select="params/number"/></td>
                        </xsl:otherwise>
                    </xsl:choose>
                </tr>
            </tbody>
        </table>
    </body>
    </html>
</xsl:template>
</xsl:stylesheet>