import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'NFT Marketplace',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 48),
                Container(
                  height: 186,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 280,
                    children: [
                      NftCategoryItem(),
                      NftCategoryItem(),
                      NftCategoryItem(),
                    ],
                  ),
                ),
                SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Trending Collections',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 19),
                Container(
                  height: 216,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 175 + 10,
                    children: [
                      NftTrendingItem(),
                      NftTrendingItem(),
                      NftTrendingItem(),
                      NftTrendingItem(),
                    ],
                  ),
                ),
                SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Sellers',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View more',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19),
                SizedBox(
                  height: 262,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const NftTopSellerItem();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: 5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NftCategoryItem extends StatelessWidget {
  const NftCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('assets/images/nft1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 60,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
            alignment: AlignmentDirectional.center,
            child: const Text(
              'Gaming',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}

class NftTrendingItem extends StatelessWidget {
  const NftTrendingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                'assets/images/nft1.png',
                fit: BoxFit.cover,
                height: 155,
              )),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: Text('Samurai Girl skdjflsd',
                      maxLines: 1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 13,
              ),
              SizedBox(width: 5),
              Text('200',
                  style: TextStyle(
                    fontSize: 13,
                  )),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class NftTopSellerItem extends StatelessWidget {
  const NftTopSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 262,
      width: 175,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                'assets/images/nft1.png',
                fit: BoxFit.cover,
              )),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Samurai Girl', maxLines: 1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              Text('kenpai pandas #2538', maxLines: 1, style: TextStyle(fontSize: 12, color: Color(0xff8D8D8D))),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'assets/images/Ethereum.png',
                width: 13,
                height: 13,
                color: Colors.white,
              ),
              Expanded(child: Text('Samurai Girl skdjflsd', maxLines: 1, style: TextStyle(fontSize: 13))),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 13,
              ),
              SizedBox(width: 5),
              Text('1800',
                  style: TextStyle(
                    fontSize: 13,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
