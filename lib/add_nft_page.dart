import 'package:flutter/material.dart';

class AddNftPage extends StatelessWidget {
  const AddNftPage({Key? key}) : super(key: key);

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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
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
                  Container(
                    height: 500,
                    margin: const EdgeInsets.all(16),
                    color: Colors.white.withOpacity(0.2),
                    child: const Center(child: Text('Select Image')),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FilledButton.tonal(
            onPressed: () {},
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
