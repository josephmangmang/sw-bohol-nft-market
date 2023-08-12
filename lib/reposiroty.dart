import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nftmarket/nft.dart';


class Repository {
  static final Repository _instance = Repository._internal();

  Repository._internal();

  factory Repository() {
    return _instance;
  }

  bool get isLogin => FirebaseAuth.instance.currentUser != null;

  Stream<List<Nft>> getTrendingNfts() {
    return FirebaseFirestore.instance
        .collection('nfts')
        .where('isTrending', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Nft.fromJson(doc.data())).toList();
    });
  }

  Stream<List<Nft>> getTopSellingNfts() {
    return FirebaseFirestore.instance
        .collection('nfts')
        .where('isTopSelling', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Nft.fromJson(doc.data())).toList());
  }
}
