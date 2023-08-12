import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nftmarket/login_page.dart';
import 'package:nftmarket/nft.dart';

import 'add_nft_page.dart';
import 'nft_category.dart';
import 'reposiroty.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Repository repository = Repository();
  final List<NftCategory> categories = [
    NftCategory('Gaming', 'assets/images/Category/Image (8).png'),
    NftCategory('Art', 'assets/images/Category/Image (9).png'),
    NftCategory('Virtual Worlds', 'assets/images/Category/Image (10).png'),
  ];

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
                        return NftCategoryItem(
                          category: categories[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 10);
                      },
                      itemCount: categories.length),
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
                  child: StreamBuilder<List<Nft>>(
                    stream: repository.getTrendingNfts(),
                    builder: (BuildContext context, AsyncSnapshot<List<Nft>> snapshot) {
                      final list = snapshot.data ?? [];
                      if (list.isEmpty) {
                        return const Center(
                          child: Text('No data'),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return NftTrendingItem(
                            nft: list[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: list.length,
                      );
                    },
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
                  child: StreamBuilder<List<Nft>>(
                      stream: repository.getTopSellingNfts(),
                      builder: (BuildContext context, AsyncSnapshot<List<Nft>> snapshot) {
                        final list = snapshot.data ?? [];
                        if (list.isEmpty) {
                          return const Center(
                            child: Text('No data'),
                          );
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return NftTopSellerItem(
                              nft: list[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 10);
                          },
                          itemCount: list.length,
                        );
                      }),
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
          if (repository.isLogin) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNftPage()));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          }
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
  const NftCategoryItem({super.key, required this.category});

  final NftCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 186,
      alignment: AlignmentDirectional.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(category.image),
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
            child: Text(
              category.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}

class NftTrendingItem extends StatelessWidget {
  const NftTrendingItem({super.key, required this.nft});

  final Nft nft;

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
              child: Image.network(
                nft.image,
                fit: BoxFit.cover,
                height: 155,
              )),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Text(nft.name, maxLines: 1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
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
  const NftTopSellerItem({super.key, required this.nft});

  final Nft nft;

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
          SizedBox(
            height: 155,
            width: 155,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(
                  nft.image,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nft.name, maxLines: 1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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
