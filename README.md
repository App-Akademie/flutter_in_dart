# Flutter Widgets Simulation in Dart

## Über dieses Projekt

Dieses Projekt implementiert eine einfache Simulation von Widgets in Dart, inspiriert durch Flutter.
Es zeigt die grundlegende Funktionsweise von Flutter-Komponenten wie Text, Padding, Center und Column mithilfe von Klassen, Vererbung und anderen Konzepten.

## Inhalt

Die Hauptkomponenten dieses Projekts umfassen:

- **Widget**: Eine abstrakte Basisklasse, von der alle Widgets erben.
- **Text**: Ein einfaches Widget, das einen Textinhalt darstellt.
- **Column**: Zeigt mehrere Widgets untereinander an.
- **Padding**: Fügt einem Widget Leerzeichen um den Inhalt hinzu.
- **Center**: Zentriert ein Widget horizontal in der Ausgabe.
- **runApp**: Die Funktion, die das Root-Widget rendert und die App startet.

## Klassen und Widgets

### Widget

`Widget` ist die abstrakte Basisklasse, die von allen anderen Widgets geerbt wird.
Die Methode `build()` gibt in dieser Simulation einen String zurück, der die Ausgabe des Widgets darstellt.

### Beispiel

Das `Text`-Widget zeigt einfachen Text an.
```dart
class Text extends Widget {
  final String content;

  Text(this.content);

  @override
  String build() {
    return content;
  }
}
