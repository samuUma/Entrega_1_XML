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
        <th>Hospital</th>
      </tr>
      <xsl:for-each select="pacientes/paciente">
      <tr>
        <td><xsl:value-of select="nombre"/></td>
        <td><xsl:value-of select="apellido"/></td>
        <td><xsl:value-of select="telefono"/></td>
        <td><xsl:value-of select="fecha_nacimiento"/></td>
        <td><xsl:value-of select="hospital_nombre"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
