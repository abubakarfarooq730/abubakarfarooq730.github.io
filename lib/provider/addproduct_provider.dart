import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

import 'package:image_picker_web/image_picker_web.dart';

class ProductProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  // Controllers
  final TextEditingController itemTitleController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController restockAlertController = TextEditingController();
  final TextEditingController retailPriceController = TextEditingController();
  final TextEditingController wholesalePriceController = TextEditingController();
  final TextEditingController distributorPriceController = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController cylinderWeightController = TextEditingController();


  String? selectedBrand;
  String? selectedCategory;
  String? selectedUnit;
  String? minUnit;
  String? maxUnit;
  bool isMultiUnit = false;
  XFile? pickedImage;
  bool isLoading = false;
  Uint8List? imageBytes;

  ProductProvider() {
    _initControllers();
  }



  void updateSelectedBrand(String selectNewBrand) {
    selectedBrand = selectNewBrand;
    notifyListeners();
  }

  void updateSelectedCategory(String selectNewCategory) {
    selectedCategory = selectNewCategory;
    notifyListeners();
  }

  void updateMultiUnits(bool newMultiUnits) {
    isMultiUnit = newMultiUnits;
    if (!isMultiUnit) {
      minUnit = null;
      maxUnit = null;
    } else {
      selectedUnit = null;
    }
    notifyListeners();
  }


  void updateMinUnit(String newMinUnit){
    minUnit = newMinUnit;
    notifyListeners();
  }

  void updateMaxUnit(String newMaxUnit){
    maxUnit = newMaxUnit;
    notifyListeners();
  }

  void updateSelectedUnit(String newSelectedUnit){
    selectedUnit = newSelectedUnit;
    notifyListeners();
  }


  void _initControllers() {
    itemTitleController.addListener(_updateState);
    barcodeController.addListener(_updateState);
    skuController.addListener(_updateState);
    restockAlertController.addListener(_updateState);
    retailPriceController.addListener(_updateState);
    wholesalePriceController.addListener(_updateState);
    distributorPriceController.addListener(_updateState);
    description.addListener(_updateState);
    cylinderWeightController.addListener(_updateState);
  }

  void _updateState() => notifyListeners();

  Future<void> pickImage() async {
    try {
      if (kIsWeb) {
        // For Web
        final image = await ImagePickerWeb.getImageAsBytes();
        if (image != null) {
          imageBytes = image;
          notifyListeners();
        }
      } else {
        // For Mobile
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          pickedImage = image;
          imageBytes = await image.readAsBytes();
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  Future<void> saveProduct(BuildContext context) async {
    if (itemTitleController.text.isEmpty || selectedBrand == null || selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill required fields')),
      );
      return;
    }

    try {
      isLoading = true;
      notifyListeners();

      // Check if itemTitle already exists in the database
      QuerySnapshot existingProducts = await _firestore
          .collection('products')
          .where('itemTitle', isEqualTo: itemTitleController.text)
          .get();

      if (existingProducts.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This product is already added')),
        );
        isLoading = false;
        notifyListeners();
        return;
      }

      String? imageUrl;
      if (pickedImage != null) {
        final Reference ref = _storage.ref().child('products/${DateTime.now().millisecondsSinceEpoch}.jpg');
        await ref.putData(imageBytes!);
        imageUrl = await ref.getDownloadURL();
      }

      await _firestore.collection('products').add({
        'itemTitle': itemTitleController.text,
        'barcode': barcodeController.text,
        'sku': skuController.text,
        'restockAlert': restockAlertController.text,
        'retailPrice': retailPriceController.text,
        'wholesalePrice': wholesalePriceController.text,
        'distributorPrice': distributorPriceController.text,
        'description': description.text,
        'cylinderWeight': cylinderWeightController.text,
        'brand': selectedBrand,
        'category': selectedCategory,
        'unit': isMultiUnit ? {'min': minUnit, 'max': maxUnit} : selectedUnit,
        'imageUrl': imageUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });

      resetForm();
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  Stream<QuerySnapshot> getProducts() {
    return _firestore.collection('products').orderBy('createdAt', descending: true).snapshots();
  }

  void resetForm() {
    itemTitleController.clear();
    barcodeController.clear();
    skuController.clear();
    restockAlertController.clear();
    retailPriceController.clear();
    wholesalePriceController.clear();
    distributorPriceController.clear();
    description.clear();
    cylinderWeightController.clear();
    selectedBrand = null;
    selectedCategory = null;
    selectedUnit = null;
    minUnit = null;
    maxUnit = null;
    isMultiUnit = false;
    pickedImage = null;
    imageBytes = null;
    notifyListeners();
  }

  @override
  void dispose() {
    itemTitleController.dispose();
    barcodeController.dispose();
    skuController.dispose();
    restockAlertController.dispose();
    retailPriceController.dispose();
    wholesalePriceController.dispose();
    distributorPriceController.dispose();
    description.dispose();
    cylinderWeightController.dispose();
    super.dispose();
  }
}