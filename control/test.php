<?php
include 'mData.php';
$url = 'Pajic.html';
$md = new MicrodataPhp($url);
$data = $md->obj();
echo "<ol>";
echo "<li>Ispisati koje su sve �eme u upotrebi</li>";
echo "<li>Koji su atributi moguci</li>";
echo "<li>Napraviti UI, sa droplistama za urlove iz domena</li>";
echo "<li>Napraviti UI, sa droplistama za �eme i atribute kojima se mo�e pristupiti</li>";
echo "</ol>";
print "" . $data->items[0]->properties['about'][0] . "<br/><br/>";
print "dateCreated: " . $data->items[0]->properties['dateCreated'][0] . "\n";
?>
