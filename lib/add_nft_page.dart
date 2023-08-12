import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'nft.dart';

class AddNftPage extends StatefulWidget {
  const AddNftPage({Key? key}) : super(key: key);

  @override
  State<AddNftPage> createState() => _AddNftPageState();
}

class _AddNftPageState extends State<AddNftPage> {
  final nftNameTextController = TextEditingController();
  final priceTextController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();

  File? selectedImage;

  bool isLoading = false;

  bool isTrending = false;
  bool isTopSelling = false;

  @override
  void dispose() {
    nftNameTextController.dispose();
    priceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: IconButton.filledTonal(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ),
                        const Center(
                          child: Text(
                            'NFT Marketplace',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: nftNameTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'NFT Name',
                      ),
                    ),
                  ),
                  // Price
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: priceTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Price',
                        prefixIcon: Image.asset(
                          'assets/images/Ethereum.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),

                  CheckboxListTile(
                      title: Text('Trending'),
                      value: isTrending,
                      onChanged: (value) {
                        setState(() {
                          isTrending = value!;
                        });
                      }),

                  CheckboxListTile(
                      title: Text('Top selling'),
                      value: isTopSelling,
                      onChanged: (value) {
                        setState(() {
                          isTopSelling = value!;
                        });
                      }),
                  InkWell(
                    onTap: () async {
                      final image = await imagePicker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        selectedImage = File(image!.path);
                        if (selectedImage != null) {
                          print(selectedImage?.path);
                        }
                      });
                    },
                    child: Container(
                      height: 500,
                      margin: const EdgeInsets.all(16),
                      color: Colors.white.withOpacity(0.2),
                      alignment: Alignment.center,
                      child: selectedImage != null
                          ? Image.file(
                              selectedImage!,
                              fit: BoxFit.fitWidth,
                            )
                          : Text('Select Image'),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          if (isLoading)
            const CircularProgressIndicator()
          else
            FilledButton.tonal(
              onPressed: () async {
                if (nftNameTextController.text.isEmpty || priceTextController.text.isEmpty || selectedImage == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please fill all fields'),
                  ));
                } else {
                  setState(() {
                    isLoading = true;
                  });
                  final uploadTask =
                      FirebaseStorage.instance.ref('nfts/${nftNameTextController.text}').putFile(selectedImage!);
                  final snapshot = await uploadTask;
                  final downloadUrl = await snapshot.ref.getDownloadURL();
                  print(downloadUrl);

                  final name = nftNameTextController.text;
                  final price = priceTextController.text;

                  final nft = Nft(
                      name: name,
                      price: double.parse(price),
                      image: downloadUrl,
                      isTrending: isTrending,
                      isTopSelling: isTopSelling);

                  await FirebaseFirestore.instance.collection('nfts').add(nft.toJson());

                  setState(() {
                    isLoading = false;
                  });
                  // show success message
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('NFT added successfully'),
                  ));
                  Navigator.pop(context);
                }
              },
              child: const Text('Add NFT'),
            ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    ));
  }
}
