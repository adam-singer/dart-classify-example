Example of how to use dartdoc/classify.dart
===========================================

[dartdoc](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/utils/dartdoc/) is used for generating static HTML for the [api.dartlang.org](http://api.dartlang.org) site. This example shows how importing [dartdoc/classify.dart](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/utils/dartdoc/classify.dart) one could generate syntax highlighted dart code at runtime. 


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
This is the easiest part! Create a [SourceFile](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/frog/source.dart) and add pass it along to [classifySource](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/utils/dartdoc/classify.dart) which will return a properly formatted string of span elements that has class attributes set. From that point you can add a css style to the span elements. 


        String code = "main() { print('hello world'); }";
        classify.SourceFile sf = new classify.SourceFile("sf.dart", code);
        String c = classify.classifySource(sf);


Outputted html code would look something like this


       <span class="i ">main</span><span class="p ">(</span><span class="p ">)</span><span> 
       </span><span class="p ">{</span><span> </span><span class="i ">print</span>
       <span class="p ">(</span><span class="s si">'hello world'</span>
       <span class="p ">)</span><span class="p ">;</span><span> </span><span class="p ">}</span> 

Example css style

		/* Syntax highlighting. */
		/* Note: these correspond to the constants in classify.dart. */
		.e { color: hsl(  0, 100%, 70%); } /* Error */
		.c { color: hsl(220,  20%, 65%); } /* Comment */
		.i { color: hsl(220,  20%, 20%); } /* Identifier */
		.k { color: hsl(220, 100%, 50%); } /* Keyword */
		.p { color: hsl(220,  20%, 50%); } /* Punctuation */
		.o { color: hsl(220,  40%, 50%); } /* Operator */
		.s { color: hsl( 40,  90%, 40%); } /* String */
		.n { color: hsl( 30,  70%, 50%); } /* Number */
		.t { color: hsl(180,  40%, 40%); } /* Type Name */
		.r { color: hsl(200, 100%, 50%); } /* Special Identifier */
		.a { color: hsl(220, 100%, 45%); } /* Arrow */
		
		/* Interpolated expressions within strings. */
		.si {
		  background: hsl(40, 100%, 90%);
		}
		
	    .s.si { background: hsl(40, 80%, 95%); }
		.i.si { color: hsl(40, 30%, 30%); }
		.p.si { color: hsl(40, 60%, 40%); }
		
		
