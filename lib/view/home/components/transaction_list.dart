import 'package:cash_mate/config/app_color.dart';
import 'package:cash_mate/utils/image_constants.dart';
import 'package:cash_mate/utils/size_helpers.dart';
import 'package:flutter/material.dart';

class SegmentedButtonExample extends StatefulWidget {
  @override
  _SegmentedButtonExampleState createState() => _SegmentedButtonExampleState();
}

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  // Define a list of booleans to track the selected state of each button
  List<bool> isSelected = [
    true,
    false
  ]; // By default, "Transaction" is selected

  // Define the lists for "Transaction" and "Income"
  List<String> transactionList = [
    'Transaction 1',
    'Transaction 2',
    'Transaction 3',
    'Transaction 4',
    'Transaction 5',
    'Transaction 6'
  ];
  List<String> incomeList = [
    'Income 1',
    'Income 2',
    'Income 3',
    'Income 4',
    'Income 5',
    'Income 6'
  ];

  // A function to get the currently selected list
  List<String> getCurrentList() {
    return isSelected[0] ? transactionList : incomeList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ToggleButtons for "Transaction" and "Income"
          ToggleButtons(

            borderRadius: BorderRadius.circular(28),
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                // Update the selected state
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = i == index;
                }
              });
            },
            children: const [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Text('Transaction'),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Text('Income'),
              ),
            ],
          ),
          // Display the list of the selected category
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: getCurrentList().length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: ListTile(
                    leading: Image.network(
                        "https://avatar.iran.liara.run/public/boy"),
                    title: Text(getCurrentList()[index]),
                    trailing: Text("\$100"),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                // Define the separator between items
                return Divider(
                  thickness: 1,
                  color: AppColor.secondaryExtraSoft,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
