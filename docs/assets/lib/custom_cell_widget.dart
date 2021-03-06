import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCellWidgetExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const MainWidget();
}

class Person {
  Person(this.name, this.stars);

  final String name;
  final int stars;
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  EasyTableModel<Person>? _model;

  @override
  void initState() {
    super.initState();
    List<Person> rows = [
      Person('Landon', 1),
      Person('Sari', 0),
      Person('Julian', 2),
      Person('Carey', 4),
      Person('Cadu', 5),
      Person('Delmar', 2)
    ];
    _model = EasyTableModel<Person>(rows: rows, columns: [
      EasyTableColumn(name: 'Name', stringValue: (row) => row.name),
      EasyTableColumn(
          name: 'Rate',
          width: 150,
          cellBuilder: (context, data) => StarsWidget(stars: data.row.stars))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTable<Person>(_model);
  }
}

class StarsWidget extends StatelessWidget {
  const StarsWidget({Key? key, required this.stars}) : super(key: key);

  final int stars;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List.generate(
        stars,
        (index) =>
            const Flexible(child: Icon(Icons.star, color: Colors.orange)));
    return Row(children: children);
  }
}
