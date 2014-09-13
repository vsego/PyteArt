#!/usr/bin/env python3

"""
Patterns generator for img2dat.py
"""

from itertools import combinations
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from string import printable, ascii_letters, punctuation
from sys import argv, stderr

class GenPatts:
    allowedHoles = 0 # how many colors are permitted to remain unassigned
    charSet = ascii_letters + punctuation # character set to be used for all or only first character
                                          # (see reduceTo argument of asString() method)
    colNum = 256 # the number of colors
    font = "LiberationMono-Regular.ttf" # font file
    maxChars = 3 # maximum number of overlapping characters
    size = 31 # size of each character (bigger numbers produce finer images)
    xy = (0, -size // 6) # where on the temporary image to put the character
    skipChars = { "^", "#", "]", "/", "-" } # chars to be excluded (those with special meaning)

    def asString(self, reduceTo = None):
        """
        Generate patterns and return them as a list.
        Parameter reduceTo is a string that is used for all characters but first.
        If None, it is ignored and self.charSet is used for all characters (this might be a wee bit slow).
        """
        patterns = [ "" for g in range(1, 256) ] + [ " " ]
        left2do = self.colNum - 1
        chars = 1

        font = ImageFont.truetype(self.font, self.size)
        imgSize = font.getsize('X')
        charSet = set(self.charSet) - set(self.skipChars)
        colFactor = 256 / self.colNum

        while left2do > self.allowedHoles and chars <= self.maxChars:
            for code in combinations(charSet, chars):
                #if not self.skipChars.intersection(set(code)):
                im = Image.new('L', imgSize, '#ffffff')
                draw = ImageDraw.Draw(im)
                for char in code:
                    draw.text(self.xy, char, '#000000', font)
                hist = im.histogram()
                col = round(sum([ hist[i] * i for i in range(len(hist)) ]) / sum(hist))
                col = min(max(0, round(colFactor * round(col / colFactor))), 255)
                if patterns[col] == "":
                    patterns[col] = code
                    left2do -= 1
                    if left2do <= 0:
                        break

            chars += 1

            if reduceTo and chars == 2:
                charSet = set(reduceTo) - set(self.skipChars)

        return patterns

    def toFile(self, fname, reduceTo = None):
        with open(fname, "w", encoding = "utf-8") as f:
            f.write(str(self.asString()))

if __name__ == "__main__":
    fname = (argv[1] if len(argv) > 1 else "img2dat.pat")
    gp = GenPatts()
    gp.toFile(fname, reduceTo = ascii_letters)
    stderr.write("Patterns created and saved to \"" + fname + "\".\n")

