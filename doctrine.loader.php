<?php

use Doctrine\Common\ClassLoader;

require_once("Doctrine/Common/Classloader.php");
require_once("src/Cinema/Libraries/Twig/Autoloader.php");

$classloader = new ClassLoader("Cinema", "src");
$classloader->register();
$autoloader = Twig_Autoloader::register();
$loader = new Twig_Loader_Filesystem("src/Cinema/Presentation");

$twig = new Twig_Environment($loader, array('debug'=>true, 'strict_variables' => false));
$twig->addExtension(new Twig_Extension_Debug);