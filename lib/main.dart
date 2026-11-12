import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final agents = ['Агент 1', 'Агент 2', 'Агент 3'];
  int sel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 56,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < agents.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ChoiceChip(
                      label: Text(agents[i]),
                      selected: sel == i,
                      onSelected: (_) => setState(() => sel = i),
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => agents.add('Агент ${agents.length + 1}')),
                ),
              ],
            ),
          ),
          Expanded(child: Center(child: Text('Відкрито: ${agents[sel]}'))),
        ]),
      ),
    );
  }
}
