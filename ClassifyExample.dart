#import('dart:html');
#import('../../dart_bleeding/dart/utils/dartdoc/classify.dart', prefix:"classify");

class ClassifyExample {
String code2 = """ main() { print('helo'); } """;
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
    
    TextAreaElement dartInput = document.query('#dartInput');
    DivElement dartPreview = document.query('#dartPreview');
    DivElement dartHTMLCode = document.query('#dartHTMLCode');
    dartInput.value = code;
    dartPreview.nodes.add(e);
    var s = c.replaceAll('<', '&lt;').replaceAll('>', '&gt;');
    var plainTextCode = new Element.html("<div style='word-wrap:break-word;'><pre><code>${s}</code></pre></div>");
    dartHTMLCode.nodes.add(plainTextCode);
    //print(s);
    
    dartInput.on.input.add((_) {
      // Highlight code
      sf = new classify.SourceFile("sf.dart", dartInput.value);
      c = classify.classifySource(sf);
      e = new Element.html("<pre><source>${c}</source></pre>");
      s = c.replaceAll('<', '&lt;').replaceAll('>', '&gt;');
      var plainTextCode = new Element.html("<div style='word-wrap:break-word;'><pre><code>${s}</code></pre></div>");
      dartPreview.nodes.forEach((n)=>n.remove());
      dartPreview.nodes.add(e);
      dartHTMLCode.nodes.forEach((n)=>n.remove());
      dartHTMLCode.nodes.add(plainTextCode);
    });
    
    
    
  }
}

void main() {
  new ClassifyExample().run();
}
