import 'dart:ui';

import 'package:flutter/material.dart';

import 'add_nft_page.dart';

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
                const Center(
                  child: Text(
                    'NFT Marketplace',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  height: 186,
                  child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const NftCategoryItem();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: 5,
                  ),
                ),
                const SizedBox(height: 19),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Trending Collections',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 19),
                SizedBox(
                  height: 216,
                  child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const NftTrendingItem();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: 5,
                  ),
                ),
                const SizedBox(height: 19),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                const SizedBox(height: 19),
                SizedBox(
                  height: 262,
                  child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const NftTopSellerItem();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: 5,
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNftPage()));
        },
        child: Image.asset(
          'assets/images/nav_icons/Minted Button.png',
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/nav_icons/Home.png'),
            Image.asset('assets/images/nav_icons/Stats.png'),
            const SizedBox.shrink(),
            Image.asset('assets/images/nav_icons/Explore.png'),
            Image.asset('assets/images/nav_icons/More.png'),
          ],
        ),
      )),
    );
  }
}

class NftCategoryItem extends StatelessWidget {
  const NftCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 186,
      alignment: AlignmentDirectional.bottomCenter,
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
      height: 216,
      width: 175,
      padding: const EdgeInsets.all(10),
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
          const SizedBox(height: 10),
          const Row(
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
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Samurai Girl', maxLines: 1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              Text('kenpai pandas #2538', maxLines: 1, style: TextStyle(fontSize: 12, color: Color(0xff8D8D8D))),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'assets/images/Ethereum.png',
                width: 13,
                height: 13,
                color: Colors.white,
              ),
              const Expanded(child: Text('Samurai Girl skdjflsd', maxLines: 1, style: TextStyle(fontSize: 13))),
              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 13,
              ),
              const SizedBox(width: 5),
              const Text('1800',
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
