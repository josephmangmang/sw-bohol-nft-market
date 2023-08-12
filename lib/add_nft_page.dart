import 'package:flutter/material.dart';

class AddNftPage extends StatelessWidget {
  const AddNftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Add NFT',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
            )
          ],
        ),
      ),
    ));
  }
}
