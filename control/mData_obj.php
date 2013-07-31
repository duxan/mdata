<?php
function skrati($string, $length, $stopanywhere=false) {
    //truncates a string to a certain char length, stopping on a word if not specified otherwise.
    if (strlen($string) > $length) {
        //limit hit!
        $string = substr($string,0,($length -3));
        if ($stopanywhere) {
            //stop anywhere
            $string .= '...';
        } else{
            //stop on a word.
            $string = substr($string,0,strrpos($string,' ')).'&hellip;';
        }
    }
    return $string;
};
include 'mData/mData_class.php';
//$url treba proslediti pre pozivanja mData_obj.php u instance fajlu, kao:
//$url = basename(__FILE__); 
$md = new MicrodataPhp($url);
$data = $md->obj();
//echo "<ol>";
//echo "<li>Ispisati koje su sve šeme u upotrebi</li>";
//echo "<li>Koji su atributi moguci</li>";
//echo "<li>Napraviti UI, sa droplistama za urlove iz domena</li>";
//echo "<li>Napraviti UI, sa droplistama za šeme i atribute kojima se može pristupiti</li>";
//echo "</ol>";
$arr = $data->items;

json();
/* $fp = fopen('results.json', 'w');
fwrite($fp, json());
fclose($fp); */



$noviobj = $arr[1]->properties['citation'];
echo $noviobj[0]->type[0] . "<br/>";




$lista = array();

echo "Number of microdata schemas used: (" . count($arr) . ")<br/>";
foreach ($data->items as $item) {
foreach ($item->type as $value) {
	array_push($lista, $value);
	//echo basename($value) . '<br/>';
}
}
$uniq_lista = array_count_values($lista);
//echo "<br/>";
foreach ($uniq_lista as $uitem => $num) {
	echo '<a target="_blank" href="' . $uitem . '">' . basename($uitem) . '</a>' . ' meets ' . $num . ' times<br/>';
}

$i=1;
$imena = array();
foreach ($data->items as $item) {
foreach ($item->type as $value) {
	if (basename($value)=="Person"){
	array_push($imena, $item->properties['name'][0]);
}
}
}

foreach (array_count_values($imena) as $nameitem => $namenum) {
	echo $i . ". " . $nameitem . ' meets ' . '(' . $namenum . ') times<br/>';
	$i=$i+1;
	}


/* print "<br/><br/>" . skrati($data->items[0]->properties['name'][0], 90, true) . "<br/><br/>"; */
//print $data->items[0]->properties['name'][0] . "(br)" . "\n";
?>