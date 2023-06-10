import 'dart:io'; // Import the dart:io package

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  // Define necessary variables and controllers for patient details form
  TextEditingController _nameController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dr. Ruben Dorwart"), // Use the actual doctor name
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Add Patient Details"), // Add appropriate title
            SizedBox(height: 20),
            if (_selectedImage != null)
              Image.file(
                File(_selectedImage!.path),
                height: 150,
              ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pick Image"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Patient Name",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: "Message",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to send the message
                // You can use _nameController.text, _messageController.text, and _selectedImage
              },
              child: Text("Send Message"),
            ),
          ],
        ),
      ),
    );
  }
}
