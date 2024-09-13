// Die Basisklasse "Widget", die alle Widgets erben.
abstract class Widget {
  // In Flutter würde build ein Widget zurückgeben, hier geben wir eine Zeichenkette zurück.
  String build();
}

// Ein einfaches Text-Widget, das einen Textinhalt darstellt.
class Text extends Widget {
  final String content;

  Text(this.content);

  @override
  String build() {
    return content;
  }
}

// Eine Column, die mehrere Widgets untereinander anzeigt.
class Column extends Widget {
  final List<Widget> children;

  Column(this.children);

  @override
  String build() {
    String result = '';

    // Jedes Widget rendern und zur Ausgabe hinzufügen, mit Newline getrennt.
    for (var child in children) {
      result += child.build() + "\n";
    }
    // Entfernt das letzte unnötige Leerzeichen.
    result = result.trim();

    return result;
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

// Ein Center-Widget, das den Inhalt in die Mitte stellt.
class Center extends Widget {
  final Widget child;

  Center(this.child);

  @override
  String build() {
    String result = "";

    final String content = child.build();
    // Simuliert das Zentrieren, indem Leerzeichen links hinzugefügt werden (vereinfachte Darstellung).
    const int screenWidth = 40; // Angenommene Konsolenbreite.
    final int leftPadding = (screenWidth - content.length) ~/ 2;
    result = ' ' * leftPadding + content;

    return result;
  }
}

// Die runApp-Funktion, die das Root-Widget rendert.
void runApp(Widget root) {
  print(root.build());
}

// Simuliert eine Konsolen-App, ähnlich wie Flutter.
void main() {
  runApp(
    Column([
      Text('--- Einfacher Text ---'),
      Padding(
        child: Text('Text mit Padding!'),
        padding: 4,
      ),
      Center(Text('Zentrierter Text!')),
      Column([
        Text('Weitere Zeilen in einer Column:'),
        Text('Zeile 1'),
        Text('Zeile 2'),
        Text('Zeile 3'),
      ]),
    ]),
  );
}
