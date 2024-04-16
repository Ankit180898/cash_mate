import 'package:cash_mate/config/app_color.dart';
import 'package:cash_mate/routes/app_pages.dart';
import 'package:cash_mate/utils/size_helpers.dart';
import 'package:cash_mate/widgets/custom_button.dart';
import 'package:cash_mate/widgets/dialog/custom_dialog.dart';
import 'package:cash_mate/widgets/toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPickerDialog extends StatefulWidget {
  const AvatarPickerDialog({super.key});

  @override
  _AvatarPickerDialogState createState() => _AvatarPickerDialogState();
}

class _AvatarPickerDialogState extends State<AvatarPickerDialog> {
  // Single list of 8 avatars (combined from male and female avatars)
  List<String> avatarList = [
    'camera_icon_url_or_asset_here', // Add a camera icon
    'https://avatar.iran.liara.run/public/32',
    'https://avatar.iran.liara.run/public/35',
    'https://avatar.iran.liara.run/public/23',
    'https://avatar.iran.liara.run/public/50',
    'https://avatar.iran.liara.run/public/73',
    'https://avatar.iran.liara.run/public/64',
    'https://avatar.iran.liara.run/public/77',
  ];

  // RxString to hold the selected avatar URL
  RxString selectedAvatarUrl = ''.obs;
  XFile? file;

  // ImagePicker instance
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Pick an Avatar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Main content of the dialog
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Avatar selection grid
                  SizedBox(
                    height: displayHeight(context) * 0.6,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: avatarList.length,
                      itemBuilder: (context, index) {
                        final avatarUrl = avatarList[index];

                        // Handle the camera image click
                        if (avatarUrl == 'camera_icon_url_or_asset_here') {
                          return AvatarItem(
                            avatarUrl: avatarUrl,
                            isSelected: false,
                            onTap: () => showBottomSheetOptions(context),
                          );
                        } else {
                          // Handle the regular avatar selection
                          return AvatarItem(
                            avatarUrl: avatarUrl,
                            isSelected: avatarUrl == selectedAvatarUrl.value,
                            onTap: () {
                              selectedAvatarUrl.value = avatarUrl;
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // "Get Started" button at the bottom of the screen
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CustomButton(
              isCenter: false,
              text: "Get Started",
              onPressed: () {
                // Check if an avatar is selected
                if (selectedAvatarUrl.value.isNotEmpty) {
                  // Perform any additional tasks with the selected avatar URL
                  // Then navigate to the desired route

                  // You can use the selected avatar URL for further processing
                  // e.g., passing it as an argument to the next route
                  String avatarUrl = selectedAvatarUrl.value;

                  // Navigate to the desired route (e.g., Routes.REGISTER)
                  Get.offAllNamed(
                    Routes.REGISTER,
                    arguments: {
                      'selectedAvatarUrl': avatarUrl,
                    },
                  );
                } else {
                  // Display a message if no avatar is selected
                  Get.snackbar(
                    'No Avatar Selected',
                    'Please select an avatar before proceeding.',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              bgcolor: AppColor.secondary,
              height: displayHeight(context) * 0.08,
              width: displayWidth(context),
              textSize: 16,
              textColor: AppColor.secondaryExtraSoft,
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle bottom sheet options
  void showBottomSheetOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to handle image picking
  Future<void> pickImage(ImageSource source) async {
    // Use image picker to pick an image from the specified source (gallery or camera)
    final pickedFile = await _picker.pickImage(
      source: source,
    );

    if (pickedFile != null) {
      // Update the state with the new image URL
      file = pickedFile.path as XFile?;
    } else {
      // Handle the case where no image is selected (e.g., user cancels the operation)

      CustomToast.errorToast('No Image Selected',
          'Please select an image from the gallery or camera.');
    }
  }
}

class AvatarItem extends StatelessWidget {
  final String avatarUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const AvatarItem({
    required this.avatarUrl,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Display the avatar image
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              avatarUrl,
            ),
          ),
          // Display selection ring if avatar is selected
          if (isSelected)
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 3,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
