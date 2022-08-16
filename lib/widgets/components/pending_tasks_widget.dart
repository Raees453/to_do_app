import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PendingTasksWidget extends StatelessWidget {
  PendingTasksWidget({Key? key}) : super(key: key);

  final _items = ['In 7 days', 'In 30 days', 'All'];
  String _value = 'In 7 days';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).colorScheme.secondary,
      ),
      height: 220,
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: Text('Pending Tasks in Categories')),
              StatefulBuilder(
                builder: (_, setState) => DropdownButton<String>(
                  items: _items
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() => _value = value!);
                  },
                  isDense: true,
                  underline: Container(),
                  value: _value,
                  alignment: Alignment.centerRight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          SizedBox(
            child: ListTile(
              leading: SizedBox(
                width: 140,
                child: PieChart(
                  PieChartData(
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 30,
                    sections: [
                      PieChartSectionData(
                        color: Colors.black87,
                        value: 10,
                        title: 'Title 1',
                      ),
                      PieChartSectionData(
                        color: Colors.purple,
                        value: 10,
                        title: 'Title 2',
                      ),
                      PieChartSectionData(
                        color: Colors.pink,
                        value: 10,
                        title: 'Title 3',
                        radius: 40,
                      ),
                    ],
                  ),
                ),
              ),
              minLeadingWidth: 160,
              title: const Text('Hello Text'),
            ),
          ),
        ],
      ),
    );
  }
}
