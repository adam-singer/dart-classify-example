#import('dart:html');
#import('../../dart_bleeding/dart/utils/dartdoc/classify.dart', prefix:"classify");

class ClassifyExample {
String code = """
#import('dart:html');

class Sababa {
  /* [isCool] enables the cool pre tag */
  ru([isCool = true]) {
     var p;
     if (cool) {
        p = new Element.html('<pre>is cool cat</pre>');
     } else {
        p = new Element.html('<pre>is not cool cat</pre>');
     }

     // Add to body
     document.body.nodes.add(p);
  }
}
main() {
  new Sababa().ru(ture);
}
""";

  ClassifyExample() {
  }

  void run() {
    classify.SourceFile sf = new classify.SourceFile("sf.dart", code);
    String c = classify.classifySource(sf);
    var e = new Element.html("<pre><source>${c}</source></pre>");
    document.body.nodes.add(e);
  }
}

void main() {
  new ClassifyExample().run();
}
