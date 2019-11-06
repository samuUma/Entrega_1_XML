<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Telefono</th>
        <th>Fecha de Nacimiento</th>
        <th colspan="4">Hospital</th>
      </tr>
      <xsl:for-each select="/hospital/pacientes/paciente">
        <tr>
        <xsl:variable name="dni">
          <xsl:value-of select="dni"/>
        </xsl:variable>
        <td><xsl:value-of select="nombre"/></td>
        <td><xsl:value-of select="apellido"/></td>
        <td><xsl:value-of select="telefono"/></td>
        <td><xsl:value-of select="fecha_nacimiento"/></td>
        <xsl:for-each select="/hospital/ingresado_en/paciente">
          <xsl:if test="$dni = current()/paciente_dni">
              <td><xsl:value-of select="current()/hospital_nombre"/></td>
          </xsl:if>
  
        </xsl:for-each>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
