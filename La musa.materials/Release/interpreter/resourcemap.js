/* This file is loaded by play.html. It should specify the size and location
   of each image resource used by the game.

   The StaticImageInfo object should have integer keys (Glk image numbers).
   These should map to Javascript objects which look like:

   {
     "image": INT, 
     "url": URLSTRING,
     "alttext": STRING,
     "width": INT,
     "height": INT
   }

   The image number must match the key. (Yes, it's redundant, just do it.) The
   alttext is an optional string describing the image (for non-graphical
   displays and visually impaired users.) The width and height are the image
   size -- these fields are required! And the url should be a URL from which
   the image resource can be loaded. This may be an absolute URL, or relative
   to play.html.

   This information is not yet generated by Inform. If your game contains
   graphics, you can manually edit this file to include all the image
   data. Alternatively, use the "giload" command of blorbtool.py:

   python blorbtool.py GAME.materials/Release/GAME.gblorb giload GAME.materials/Release/interpreter interpreter
*/

StaticImageInfo = {};