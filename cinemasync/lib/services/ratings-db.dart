// // ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cinemasync/movie-rating.dart';

class RatingsDB {
  Future<void> create() async {
    try {
      await FirebaseFirestore.instance
          .collection('ratings')
          .doc('Inception')
          .set({'movieName': 'Inception', 'rating': 9});
      await FirebaseFirestore.instance
          .collection('ratings')
          .doc('The ShawShank Redemption')
          .set({'movieName': 'The Shawshank Redemption', 'rating': 10});
      await FirebaseFirestore.instance
          .collection('ratings')
          .doc('The Godfather')
          .set({'movieName': 'The Godfather', 'rating': 10});
      // for (var rating in ratings) {
      //   await FirebaseFirestore.instance
      //       .collection('ratings')
      //       .doc(rating.id)
      //       .set(rating);
      // }
    } catch (error) {
      print(error);
    }
  }

  Future<void> read() async {
    // List<MovieRating> data;
    // DocumentSnapshot documentSnapshot;
    try {
      await FirebaseFirestore.instance
          .collection('ratings')
          .get()
          .then((event) {
        for (var doc in event.docs) {
          print("${doc.id} => ${doc.data()}");
        }
      });
    } catch (error) {
      print(error);
    }
  }
}
