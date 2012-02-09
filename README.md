Example of how to use dartdoc/classify.dart
===========================================

dartdoc is used for generating static HTML for the api.dartlang.org site. This example shows how importing dartdoc/classify.dart one could generate syntax highlighted dart code at runtime. 


Patching
--------
Currently you need to modify the import statement to reference the location of classify.dart.
    
    #import('../../dart_bleeding/dart/utils/dartdoc/classify.dart', prefix:"classify");


Building
--------
Build with minfrog for best results. At the moment dart editor does not seem happy with me on importing dartdoc/classify.dart. So compiling with minfrog worked best. 

   minfrog --compile-only --out=ClassifyExample.dart.js ClassifyExample.dart 



Using classify
--------------
This is the easier part! Create a [SourceFile]() and add pass it along to [classifySource]() which will return a properly formatted string of span elements that has class attributes set. 


        String code = "main() { print('hello world'); }";
        classify.SourceFile sf = new classify.SourceFile("sf.dart", code);
        String c = classify.classifySource(sf);

