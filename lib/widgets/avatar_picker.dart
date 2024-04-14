import 'package:cash_mate/utils/size_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AvatarPickerDialog extends StatefulWidget {
  const AvatarPickerDialog({super.key});

  @override
  _AvatarPickerDialogState createState() => _AvatarPickerDialogState();
}

class _AvatarPickerDialogState extends State<AvatarPickerDialog> {

  // RxBool isLoading = true.obs;
  RxString selectedSegment = 'male'.obs; // Default segment is 'male'

  // Variables to hold avatarsList 
  List<String> maleList = [
    'https://avatar.iran.liara.run/public'
  ];
    List<String> femaleList = ['https://avatar.iran.liara.run/public'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.none,
        title: const Text('Pick an Avatar'),
      ),
      body: Obx(() {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                isSelected: [
                  selectedSegment.value == 'male',
                  selectedSegment.value == 'female'
                ],
                onPressed: (int index) {
                  // Change the selected segment and refetch avatars
                  selectedSegment.value = index == 0 ? 'male' : 'female';
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Male'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Female'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  final avatarUrl = selectedSegment.value == 'male'
                      ? maleList
                      : femaleList;
        
                  return GestureDetector(
                    onTap: () {
                      // Handle the tap on the avatar (e.g., navigate to a new screen, etc.)
                      print('Tapped on avatar:');
                    },
                    child: SizedBox(
                      height: displayHeight(context) * 0.20,
                      width: displayHeight(context) * 0.20,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.transparent,
                        child: Image.network(avatarUrl[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
