<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <title>POST</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="mclibre-php-soluciones.css" rel="stylesheet" type="text/css" title="Color" />
</head>

<body>
  <h1 style='text-align: center'>Fomulario POST</h1>

<?php

$nombre = $_REQUEST['nombre'];
$edad = $_REQUEST['edad'];
$sexo = $_REQUEST['sexo'];

print "  <p style='text-align:center'>Su nombre es <strong>$nombre</strong>.</p>\n";
print "  <p style='text-align:center'>Su edad es <strong>$edad</strong>.</p>\n";
print "  <p style='text-align:center'>Su sexo es <strong>$sexo</strong>.</p>\n";

?>
  <p style='text-align:center'><a href="get.html">Volver al formulario.</a></p>
</body>
</html>
