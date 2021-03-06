#!/usr/bin/env perl6

BEGIN { @*INC.push('../lib') };

use Imlib2;

my $tools = Imlib2.new();
my $newimage = $tools.create_image(200, 200);
exit() unless $newimage;

# Sets the current image Imlib2 will be using with its function calls.
$newimage.context_set_image();

$tools.image_set_has_alpha(True);

# Sets the color with which text, lines and rectangles are drawn when
# being rendered onto an image.
$tools.context_set_color(
	red   => 255,
	green => 127,
	blue  => 0,
	alpha => 255
);

$tools.image_fill_rectangle(
	x      => 0,
	y      => 0,
	width  => 200,
	height => 200
);

# Another way to set a color (color, alpha).
# alpha is optional and the deafult value is 255.
$tools.context_set_color("#a000F1", 127);

$tools.image_draw_rectangle(
	x      => 10,
	y      => 10,
	width  => 200 - 20,
	height => 200 - 20
);

$tools.image_blur(1);
$tools.image_sharpen(1);

$tools.image_set_format("png");
unlink("images/test_imlib2.png") if "images/test_imlib2.png".IO ~~ :e;
$tools.save_image("images/test_imlib2.png");

# Frees the image that is set as the current image in Imlib2's context. 
$tools.free_image();

exit();
