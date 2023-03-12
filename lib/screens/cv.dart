import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model.dart';

class CVPage extends StatefulWidget {
  @override
  _CVPageState createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  late File _imageFile;
  MyModel _model = MyModel();

  Future<void> _getImageAndPredict() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      final Future<List?>? results = _model.predict(_imageFile);
      if (results != null && results != []) {
        print(results);
      }
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TFLite Demo'),
      ),
      body: Center(
        child: _imageFile == null
            ? Text('No image selected.')
            : Image.file(_imageFile),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageAndPredict,
        tooltip: 'Select Image',
        child: Icon(Icons.image),
      ),
    );
  }
}
