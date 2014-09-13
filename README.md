PyteArt
=======

PyteArt is a collection of generators of ASCII art with overlapping characters, written in Python 3.

The project was created as a result of Nick Higham's challenge to make a port of his typeart program to a more modern setting. His original motivation and source code are available [here](http://nickhigham.wordpress.com/2014/08/29/typewriter-art/).

The main difference from the usual ASCII art is that we allow overlapping characters. While that impairs with display options (usually, ASCII art can be viewed as an ordinary text file, or - at least - in a console, if colouring is required), this approach allows better representation of the image's pixels.

Programs included
-----------------

* `patgen.py` -- A helper script that generates patterns, used for converting shades of gray to characters;

* `img2dat.py` -- Converter of images (JPEG, PNG,... anything readable by PIL) to sequences of characters, as described in Nick Higham's original blog post and BASIC program;

* `pyteart.py` -- port of Nick Higham's TypeArt, used for converting DAT data to a HTML file (overlapping of characters is achieved with overlapping DIV blocks).

Typical use
-----------

To convert an image to a DAT file:

    ./img2dat.py "Nick Higham.png"

This will produce a farily low quality image, so one may want to darken it a bit (set brightness to 0.9) and increase the contrast (by a factor 2):

    ./img2dat.py "Nick Higham.png" .9 2

Similarly, good settings to convert the image of Manchester's Numerical Analysis group are

    ./img2dat.py "NA Manchester group.jpg" 1.1 1.5

To convert DAT to HTML files, just run

    ./pyteart.py "Nick Higham.dat"
    ./pyteart.py "NA Manchester group.dat"

