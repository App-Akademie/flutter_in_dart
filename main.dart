// Simuliert eine Konsolen-App, ähnlich wie Flutter.
void main() {
  runApp(
    Column(children: [
      Text('--- Einfacher Text ---'),
      Padding(
        child: Text('Text mit Padding!'),
        padding: 4,
      ),
      Center(child: Text('Zentrierter Text!')),
      Column(children: [
        Text('Weitere Zeilen in einer Column:'),
        Row(children: [Text('Zeile 1a'), Text('Zeile 1b')]),
        Text('Zeile 2'),
        Text('Zeile 3'),
      ]),
    ]),
  );
}

// Die runApp-Funktion, die das Root-Widget rendert.
void runApp(Widget app) {
  print(app.build());
}

// Die Basisklasse "Widget", die alle Widgets erben.
abstract class Widget {
  // In Flutter würde build ein Widget zurückgeben, hier geben wir eine Zeichenkette zurück.
  String build();
}

// Einfachste Implementierung eines Widget.
class HiSayer extends Widget {
  @override
  String build() {
    return "Hi";
  }
}

// Ein einfaches Text-Widget, das einen Textinhalt darstellt.
class Text extends Widget {
  final String data;

  Text(this.data);

  @override
  String build() {
    return data;
  }
}

// Ein Padding-Widget, das ein anderes Widget einbettet und Leerzeichen hinzufügt.
class Padding extends Widget {
  final Widget child;
  final int padding;

  Padding({required this.child, this.padding = 2});

  @override
  String build() {
    String result = "";

    // Fügt links und rechts Leerzeichen als "Padding" hinzu.
    final paddingString = ' ' * padding;
    result = paddingString + child.build() + paddingString;

    return result;
  }
}

// Simuliert das Zentrieren von Text mithilfe einer Menge Leerzeichen.
class Center extends Widget {
  final Widget child;

  Center({required this.child});

  @override
  String build() {
    return "                                   " + child.build();
  }
}

// Klasse, die mehrere Objekte bekommt und sie UNTEREINANDER ausgibt
// Banana( Text("Hi"), Text("Hallo"));
// ->
// Hi
// Hallo
class Column extends Widget {
  // Widgets, die untereinander angezeigt werden sollen.
  final List<Widget> children;

  Column({required this.children});

  @override
  String build() {
    String result = "";

    for (final Widget widget in children) {
      result = result + widget.build() + "\n";
    }

    return result;
  }
}

// Klasse, die mehrere Widgets bekommt und sie NEBENEINANDER darstellt.
class Row extends Widget {
  final List<Widget> children;

  Row({required this.children});

  @override
  String build() {
    String result = "";

    for (final Widget widget in children) {
      result += widget.build() + "|";
    }

    return result;
  }
}
