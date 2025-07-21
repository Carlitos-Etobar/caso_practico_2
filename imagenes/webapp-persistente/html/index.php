<?php
$counterFile = 'data/counter.txt';

if (!file_exists($counterFile)) {
    file_put_contents($counterFile, 0);
}

$counter = (int)file_get_contents($counterFile);
$counter++;
file_put_contents($counterFile, $counter);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Contador de Visitas</title>
</head>
<body>
    <h1>Bienvenido a la aplicación en AKS</h1>
    <p>Esta página ha sido visitada <strong><?= $counter ?></strong> veces.</p>
</body>
</html>
