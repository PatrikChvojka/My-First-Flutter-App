import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/bottomMenu.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// style
import 'package:flutter_application_1/presentation/style/style.dart' as style;
import 'package:flutter_application_1/presentation/widgets/menu.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moja prvá aplikácia',
      theme: style.MainAppStyle().themeData,
    );
  }
}

class MyUploadImage extends StatefulWidget {
  @override
  State<MyUploadImage> createState() => _MyUploadImage();
}

class _MyUploadImage extends State<MyUploadImage> {
  XFile? image;
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
                  setState(() {
                    image = img;
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
