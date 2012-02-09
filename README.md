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
This is the easiest part! Create a [SourceFile](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/frog/source.dart) and add pass it along to [classifySource](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/utils/dartdoc/classify.dart) which will return a properly formatted string of span elements that has class attributes set. 


        String code = "main() { print('hello world'); }";
        classify.SourceFile sf = new classify.SourceFile("sf.dart", code);
        String c = classify.classifySource(sf);


Outputted html code would look like this


       <span class="i ">main</span><span class="p ">(</span><span class="p ">)</span><span> </span><span class="p ">{</span><span> </span><span class="i ">print</span><span class="p ">(</span><span class="s si">'hello world'</span><span class="p ">)</span><span class="p ">;</span><span> </span><span class="p ">}</span> 
