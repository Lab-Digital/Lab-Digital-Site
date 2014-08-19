<?php

	$im = @imagecreatetruecolor(100, 100)
	    or die("Невозможно создать поток изображения");

	$rand_r = rand(0, 255);
    $rand_g = rand(0, 255);
    $rand_b = rand(0, 255);
    
	imagefill($im, 0, 0, imagecolorallocate($im, $rand_r, $rand_g, $rand_b));

	function drow_poly($im, $fill = false, $color = 0)
    {

        if (!$color) {
            $rand_r = rand(0, 255);
            $rand_g = rand(0, 255);
            $rand_b = rand(0, 255);
            $rand_a = rand(60, 100);
            $color = imagecolorallocatealpha($im, $rand_r, $rand_g, $rand_b, $rand_a);
        }

        $n = rand(3, 8);
        $arr = [];

        for ($i = 0; $i < $n * 2; $i++) {
            $arr[] = rand(-200, 200);
        }

        $drow_function = "imagepolygon";

        if ($fill) {
            $drow_function = "imagefilledpolygon";
        }

        $drow_function($im, $arr, $n, $color);
    }
	

	function drow_ellipse($im, $fill = false, $circle = false, $color = 0)
    {
        if (!$color) {
            $rand_r = rand(80, 255);
            $rand_g = rand(80, 255);
            $rand_b = rand(80, 255);
            $rand_a = rand(60, 100);
            $color = imagecolorallocatealpha($im, $rand_r, $rand_g, $rand_b, $rand_a);
        }

        $rand1 = rand(0, 100);
        $rand2 = rand(0, 100);
        $rand3 = rand(30, 100);
        $rand4 = rand(30, 100);

        $x = $rand1;
        $y = $rand2;
        $w = $rand3;
        $h = $rand4; 

        if ($circle) {
            $h = $w;
        }

        $drow_function = "imageellipse";

        if ($fill) {
            $drow_function = "imagefilledellipse";
        }

        $col_ellipse = $color;

        // Рисование эллипса.
        $drow_function($im, $x, $y, $w, $h, $col_ellipse);
        
        // Горизонталь уход вправо
        $rand1 =  0 - (100 - $x);
        $drow_function($im, $rand1, $y, $w, $h, $col_ellipse);

        // Вертикаль уход вниз
        $rand2 =  0 - (100 - $y);
        $drow_function($im, $x, $rand2, $w, $h, $col_ellipse);
      
        // Горизонталь уход влево
        $rand1 =  100 + $x;
        $drow_function($im, $rand1, $y, $w, $h, $col_ellipse);

        // Вертикаль уход вверх
        $rand2 =  100 + $y;
        $drow_function($im, $x, $rand2, $w, $h, $col_ellipse);

        // Вертикаль уход вниз горизонталь уход вправо
        $rand1 =  0 - (100 - $x);
        $rand2 =  0 - (100 - $y);
        $drow_function($im, $rand1, $rand2, $w, $h, $col_ellipse);

        // Вертикаль уход вверх горизонталь уход влево
        $rand1 =  100 + $x;
        $rand2 =  100 + $y;
        $drow_function($im, $rand1, $rand2, $w, $h, $col_ellipse);

        // Вертикаль уход вниз горизонталь уход влево
        $rand1 =  100 + $x;
        $rand2 =  0 - (100 - $y);
        $drow_function($im, $rand1, $rand2, $w, $h, $col_ellipse);  

        // Вертикаль уход вверх горизонталь уход вправо
        $rand1 =  0 - (100 - $x);
        $rand2 =  100 + $y;
        $drow_function($im, $rand1, $rand2, $w, $h, $col_ellipse);
    }

    $k_colors = [];
    $rand_a = rand(60, 100);
    $k_colors[] = imagecolorallocatealpha($im, 97, 44, 3, $rand_a);
    $rand_a = rand(60, 100);
    $k_colors[] = imagecolorallocatealpha($im, 211, 84, 0, $rand_a);
    $rand_a = rand(60, 100);
    $k_colors[] = imagecolorallocatealpha($im, 255, 185, 0, $rand_a);
    $rand_a = rand(60, 100);
    $k_colors[] = imagecolorallocatealpha($im, 255, 255, 0, $rand_a);

    shuffle($k_colors);

    foreach ($k_colors as $color) {
        drow_ellipse($im, 1, true);    
    }

	imagepng($im, $_SERVER['DOCUMENT_ROOT'] . '/images/bg.png');
	imagedestroy($im);

	//////////////////////////////////////////////////

	$smarty->display('404.tpl');
?>