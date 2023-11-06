import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  ImagePicker picker = ImagePicker();
  File? selectedImage;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Widget _selectedImage() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Center(
            child: (selectedImage == null)
                ? const Icon(
                    Icons.image_not_supported,
                    color: Colors.white,
                    size: 50,
                  )
                : Image.file(
                    selectedImage!,
                    fit: BoxFit.fill,
                  )));
  }

  Future<void> pickImageFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> uploadImage() async {
    final now = DateTime.now();
    var ref = storage.ref().child('images/$now.jpg');
    var uploadTask = ref.putFile(selectedImage!);

    final snapshot = await uploadTask.whenComplete(() => {});
    final url = await snapshot.ref.getDownloadURL();

    firebaseFirestore.collection('images').doc().set({
      'url': url,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _selectedImage(),
            ElevatedButton(
              onPressed: () {
                pickImageFromGallery();
              },
              child: const Row(
                children: [
                  Text('카메라',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(width: 3),
                  Icon(
                    Icons.camera,
                    size: 18,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
