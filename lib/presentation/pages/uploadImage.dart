import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/bottomMenu.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;
import 'package:flutter_application_1/presentation/widgets/menu.dart';

class UploadImage extends StatefulWidget {
  @override
  State<UploadImage> createState() => _MyUploadImage();
}

class _MyUploadImage extends State<UploadImage> {
  XFile? image;
  String? base64Image;
  static final String uploadEndPoint =
      'https://progresivneaplikacie.sk/project/flutter/flutterImages/index.php';

  uploadImage(filename, base64ImageUpload) {
    http.post(Uri.parse(uploadEndPoint), body: {
      "image": base64ImageUpload,
      "name": filename,
    }).then((result) {
      print("success");
    }).catchError((error) {
      print("error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainMenu(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  final img =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    image = img;
                  });
                },
                label: const Text('Choose Image'),
                icon: const Icon(Icons.image),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  final img =
                      await _picker.pickImage(source: ImageSource.camera);
                  base64Image = base64Encode(File(img!.path).readAsBytesSync());

                  setState(() {
                    image = img;
                    print(base64Image);
                    uploadImage(image!.name, base64Image);
                  });
                },
                label: const Text('Take Photo'),
                icon: const Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
          if (image != null)
            Expanded(
              child: Column(
                children: [
                  Expanded(child: Image.file(File(image!.path))),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        image = null;
                      });
                    },
                    label: const Text('Remove Image'),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            )
          else
            const SizedBox(),
        ],
      ),
      bottomNavigationBar: bottomMenu(),
    );
  }
}
