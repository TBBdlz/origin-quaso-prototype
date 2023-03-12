import 'dart:io';
import 'package:tflite/tflite.dart';

class MyModel {
  late File _modelFile;
  late File _labelsFile;
  late List _labels;
  bool _isLoaded = false;

  MyModel() {
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      _modelFile = File('assets/model_unquant.tflite');
      _labelsFile = File('assets/labels.txt');

      // Load model
      await Tflite.loadModel(
        model: _modelFile.path,
        labels: _labelsFile.path,
      );

      // Load labels
      _labels = await _labelsFile.readAsLines();

      _isLoaded = true;
    } catch (e) {
      print('Failed to load model. $e');
    }
  }

  Future<List?>? predict(File image) {
    if (!_isLoaded) {
      print('Model not loaded.');
      return null;
    }

    try {
      final Future<List?> recognitions = Tflite.runModelOnImage(
        path: image.path,
        numResults: _labels.length,
        threshold: 0.05,
      );
      return recognitions;
    } catch (e) {
      print('Failed to predict image. $e');
      return null;
    }
  }

  void dispose() {
    Tflite.close();
  }
}
