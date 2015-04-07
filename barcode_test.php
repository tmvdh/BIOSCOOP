<?php
$chars = str_split('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789');
$barcode ="";
while (strlen($barcode)<20){
	$barcode .= $chars[array_rand($chars)];
}
echo $barcode;
