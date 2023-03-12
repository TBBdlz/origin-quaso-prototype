import 'package:flutter/material.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final List<String> _header = [
    'Ingredient',
    'Weight',
    'Nutrition',
  ];
  final List<List<String>> _data = [
    ['Tomato', '100g', 'Fiber 10g'],
    ['Pork', '100g', 'Protein 20g'],
    ['Rice', '100g', 'Carb 100g'],
    ['Egg', '100g', 'Protein 10g'],
    ['Onion', '100g', 'Fiber 10g'],
    ['Pork', '100g', 'Protein 20g'],
    ['Rice', '100g', 'Carb 100g'],
    ['Egg', '100g', 'Protein 10g'],
    ['Onion', '100g', 'Fiber 10g'],
    ['Pork', '100g', 'Protein 20g'],
    ['Rice', '100g', 'Carb 100g'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Menu'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: const Text(
              'Menu\'s name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: _header
                    .map((String column) => DataColumn(
                          label: Text(column),
                        ))
                    .toList(),
                rows: _data
                    .map((List<String> row) => DataRow(cells: [
                          DataCell(TextField(
                            decoration: InputDecoration(
                              hintText: row[0],
                            ),
                          )),
                          DataCell(TextField(
                            decoration: InputDecoration(
                              hintText: row[1],
                            ),
                          )),
                          DataCell(TextField(
                            decoration: InputDecoration(
                              hintText: row[2],
                            ),
                          )),
                        ]))
                    .toList(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
