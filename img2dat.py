#!/usr/bin/env python3

"""
Convert an image to a .dat file using patterns from img2dat.pat

Usage examples:
./img2dat.py n.png .9 2
./img2dat.py namcr.jpg 1.1 1.5
"""

import os
from PIL import Image, ImageEnhance
from sys import argv, exit, stderr

class img2dat:
    pixelW = 2 # pixel width of each character
    pixelH = 2 # pixel height of each character
    charmap = { ":": "^", '"': "#", " ": "]" } # Character mappings, as defined in the pyteart.bas, plus some HTML special chars
    patFile = "img2dat.pat"

    def __init__(self):
        self.reloadPatterns()

    def reloadPatterns(self):
        # Load patterns
        with open(self.patFile, encoding = "utf-8") as fin:
            self.patterns = eval(fin.read())

    def img2str(self, iname, brightness = 1, contrast = 1, showPreview = None):
        """
        Convert image given by the file name iname to
        a data string used by pyteart.py

        Parameters brightness and contrast are real numbers,
        as used by PIL.ImageEnhance
        Parameter showPreview can be True (always show a preview),
        False (never show the preview), or any other value (show the preview
        only when brightness and/or contrast are not equal to 1)

        Returns the converted string.
        """

        def col2pat(col):
            """
            Convert colour col to an appropriate pattern.
            Keep in mind that some colours may not have a code defined, so pick the nearest one.
            """
            for i in range(256):
                if col+i < 256 and self.patterns[col+i] != "": return self.patterns[col+i]
                if col-i >= 0 and self.patterns[col-i] != "": return self.patterns[col-i]
            return ""

        # Resize the image and adjust brightness/contrast
        im = Image.open(iname)
        im = im.convert(mode="L").resize((im.size[0] // self.pixelW, im.size[1] // self.pixelH), Image.ANTIALIAS)
        if brightness != 1:
            enhancer = ImageEnhance.Brightness(im)
            im = enhancer.enhance(brightness)
        if contrast != 1:
            enhancer = ImageEnhance.Contrast(im)
            im = enhancer.enhance(contrast)
        if showPreview == True:
            im.show()
        elif not (showPreview == False or brightness == 1 or contrast == 1):
            im.show()

        dat = []
        for y in range(im.size[1]):
            # Construct codes each pixel in the row y of the image
            line = [ "" ]
            for x in range(im.size[0]):
                col = im.getpixel((x, y))
                code = col2pat(col)
                line[0] += code[0]
                lc = len(code) # length of code
                dl = len(line[0]) - 1 # desired length
                if lc > 1:
                    while lc > len(line):
                        line.append("")
                    for i in range(1, lc):
                        if len(line[i]) < dl:
                            line[i] += " " * (dl - len(line[i]))
                        line[i] += code[i]

            # Rearrange the codes as an array of strings
            # The number of strings corresponds to the length of the longest code above
            for l in range(len(line)):
                # Each string (except the first one, when y == 0) starts with
                #   / ==> new line (the first of the strings, i.e., l == 0)
                #   - ==> same line (all the others for that same y)
                if l == 0:
                    if y > 0:
                        dat.append("\n/")
                else:
                    dat.append("\n-")

                # Go through all the codes, encode multiples as nc
                # (n = number of repetitions, c = code, i.e., a char)
                # and save them at the end of the appropriate string.
                # Add spaces when needed (in lines other than the first one,
                # when the previous pixels didn't have as many codes
                codes = line[l]
                lc = len(codes)
                c = 0
                while c < lc:
                    cnt = 1
                    while c + cnt < lc and codes[c + cnt] == codes[c]:
                        cnt += 1
                    code = (self.charmap[codes[c]] if codes[c] in self.charmap else codes[c])
                    dat.append(("" if cnt == 1 else str(cnt) ) + code)
                    c += cnt

        return " ".join(dat)

    def img2dat(self, iname, oname = "", brightness = 1, contrast = 1, showPreview = None):
        """
        Same as img2str, but the output is file defined by oname.
        The default oname is the same as iname, but with extension .dat
        """
        if oname == "":
            oname = (os.path.splitext(iname))[0] + ".dat"
        with open(oname, "w", encoding = "utf-8") as fout:
            fout.write(self.img2str(iname, brightness, contrast, showPreview))

if __name__ == "__main__":
    """Check that the program is properly invoked"""
    if not 1 < len(argv) < 5:
        stderr.write("Usage:", argv[0], "filename.png [brightness [contrast]]")
        stderr.write("      ", argv[0], "filename.jpg [brightness [contrast]]")
        exit(1)
    args = {
        "iname": argv[1]
    }
    if len(argv) > 2:
        args["brightness"] = float(argv[2])
    if len(argv) > 3:
        args["contrast"] = float(argv[3])
    i2d = img2dat()
    i2d.img2dat(**args)
    stderr.write("Image \"" + argv[1] + "\" converted to a DAT file.\n")

