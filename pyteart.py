#!/usr/bin/env python3

"""
Convert data from a DAT file to the corresponding ASCII art in HTML format.

Created by Vedran Sego <vsego@vsego.org>, as a Python3 port of Nick Higham's
typeart.bas from
http://nickhigham.wordpress.com/2014/08/29/typewriter-art/

The data is taken from the original typeart.bas, by removing comment lines
and BASIC's line numbers and DATA statements.

The HTML files are created programmatically, while the basic shell of the
file is defined in pyteart.tpl (with several self-explanatory named
arguments).
"""

import io
import os
from sys import argv, exit, stderr
import re

class PyteArt:
    """Customization parameters"""
    tplfile = "pyteart.tpl" # Template file's name (must be in the active directory,
                            # unless this attribute is changed)
    charmap = { # Character mappings, as defined in the typeart.bas, plus some HTML special chars
        "^": ":",
        "#": '"',
        "]": "&nbsp;",
        "&": "&amp;",
        "<": "&lt;",
        ">": "&gt;"
    }
    charsize = 5 # Font size
    lineheight = 1.1 # The height of the each line in ex

    def stream2html(self, instream, outstream, title = ""):
        """
        Take two streams, read data from the first, generate an HTML file,
        and write the result to the second stream.
        The title argument is used in a HTML <title> tag.
        """

        cmdRE = re.compile(r"\s*(([/-])|(\d*)(.))\s*") # regex for recognizing the codes
        body = "" # the resulting HTML code
        pos = self.lineheight # position of the first <div>
        div = '<div style="top: {:.1f}ex;">'.format(pos) # the first <div>
        width = 0 # width of the resulting picture (in characters)
        currwidth = 0 # width of the current image line (not the same as the currently read stream line!)

        for line in instream:
            # Process all the commands in the line, one by one
            for cmd in cmdRE.findall(line.rstrip()):
                # Check if the command is a new/same line ("/" or "-")
                newline = cmd[1]
                if newline:
                    body += ("\n" if body else "") + div + "</div>"
                    currwidth = 0
                    if newline == "/": # newline -> enhance vertical position
                        pos += self.lineheight
                    div = '<div style="top: {:.1f}ex;">'.format(pos) # start new div block
                else:
                    charnum = int(cmd[2] if cmd[2] else 1) # Repetitions: 3x -> 3; x -> 1
                    currwidth += charnum # Keep track of the width
                    if currwidth > width: width = currwidth # Remember maximum width
                    div += (self.charmap[cmd[3]] if cmd[3] in self.charmap else cmd[3]) * charnum

        # unless the last div is empty, add it to the body
        if div[-1] != ">":
            body += ("\n" if body else "") + div + "</div>"

        # Read the template and save the data
        with open(self.tplfile, encoding="utf-8") as ftpl:
            outstream.write(ftpl.read() % {
                "body": body,
                "height": pos + 2 * self.lineheight,
                "size": self.charsize,
                "title": title,
                "width": width+2,
            })

    def dat2html(self, iname, oname = "", title = ""):
        """
        Take two filenames (oname defaults to iname with the extension
        changed to .html) and a title. Read the file defined by iname,
        generate an HTML representation of the image, and save it to
        the file defined by oname.
        """
        if oname == "":
            oname = (os.path.splitext(iname))[0] + ".html"
        if title == "":
            title = (os.path.splitext(oname))[0]
        with open(iname, encoding="utf-8") as fin, \
             open(oname, "w", encoding="utf-8") as fout:
                self.stream2html(fin, fout, title)

    def str2html(self, str, title = ""):
        """
        Take a string with the data, generate its HTML representation,
        and return the whole new document as a string.
        The title argument is used in a HTML <title> tag.
        """
        fin = io.StringIO(str)
        fout = io.StringIO()
        self.stream2html(fin, fout, title)
        return fout.getvalue()

if __name__ == "__main__":
    """Check that the program is properly invoked"""
    if len(argv) != 2:
        stderr.write("Usage: " + argv[0] + " filename.dat\n")
        exit(1)
    pyteart = PyteArt()
    pyteart.dat2html(argv[1])
    stderr.write("File \"" + argv[1] + "\" converted to a HTML file.\n")

