// // ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cinemasync/movie-rating.dart';
import 'package:cinemasync/services/authorization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RatingsDB {
  static Future<List<double>> getMovieRatings() async {
    try {
      // Get the current user
      User? user = Authorization().currentUser;

      // Check if user is authenticated
      if (user == null) {
        print('User not authenticated. Cannot add data.');
        return [];
      } else {
        print('User Found');
      }

      // Get the user ID
      String userId = user.uid;

      List<double> ratingsList = [];

      // Query Firestore to get movie ratings for the current user
      await FirebaseFirestore.instance
          .collection('userRatings')
          .doc(userId)
          .get()
          .then((DocumentSnapshot snapshot) {
        // Cast data to Map<String, dynamic>
        Map<String, dynamic>? ratingData =
            snapshot.data() as Map<String, dynamic>?;

        if (ratingData != null && ratingData.containsKey('ratings')) {
          List<dynamic>? ratings =
              ratingData['ratings']; // Access the 'ratings' array
          if (ratings != null) {
            ratings.forEach((ratingEntry) {
              var rating = ratingEntry[
                  'rating']; // Access the 'rating' field of each entry
              var movieName = ratingEntry[
                  'movieName']; // Access the 'movieName' field of each entry
              print('Movie: $movieName, Rating: $rating');
              ratingsList.add(rating.toDouble());
            });
          }
        } else {
          print('Ratings field not found or null');
        }
      });

      print('ratingsList: $ratingsList');
      return ratingsList;
    } catch (error) {
      throw error;
    }
  }

  static Future<List<double>> getAverageRatings() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('userRatings').get();

      print('querySnapshot: $querySnapshot');
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
      });

      List<double> averageRatings = [];

      List<double> runningTotals = [0, 0, 0, 0, 0];

      double count = querySnapshot.size.toDouble();

      print('count: $count');

      querySnapshot.docs.forEach((userdoc) {
        print(userdoc['ratings']);
        print(userdoc['ratings'][0]);
        print(userdoc['ratings'][1]);
        print(userdoc['ratings'][2]);
        print(userdoc['ratings'][3]);
        print(userdoc['ratings'][4]);
        runningTotals[0] = runningTotals[0] +
            MovieRating.fromJson(userdoc['ratings'][0]).rating;
        runningTotals[1] = runningTotals[1] +
            MovieRating.fromJson(userdoc['ratings'][1]).rating;
        runningTotals[2] = runningTotals[2] +
            MovieRating.fromJson(userdoc['ratings'][2]).rating;
        runningTotals[3] = runningTotals[3] +
            MovieRating.fromJson(userdoc['ratings'][3]).rating;
        runningTotals[4] = runningTotals[4] +
            MovieRating.fromJson(userdoc['ratings'][4]).rating;
        print('runningTotals: $runningTotals');
      });

      runningTotals.forEach((totalRating) {
        averageRatings.add(totalRating / count);
      });

      print(averageRatings);

      return averageRatings;
    } catch (error) {
      throw error;
    }
  }

  static Future<void> addMovieRatings(List<MovieRating> movieRatings) async {
    try {
      // Get the current user
      User? user = Authorization().currentUser;

      // Check if user is authenticated
      if (user == null) {
        print('User not authenticated. Cannot add data.');
        return;
      }

      // Get the user ID
      String userId = user.uid;

      // Convert List<MovieRating> to List<Map<String, dynamic>>
      List<Map<String, dynamic>> movieRatingData = movieRatings
          .map((rating) => {
                'movieName': rating.movieName,
                'rating': rating.rating,
              })
          .toList();

      // Get a reference to the userRatings collection and add a document with the user ID
      await FirebaseFirestore.instance
          .collection('userRatings')
          .doc(userId)
          .set({'ratings': movieRatingData});

      print('Data added successfully for user: $userId');
    } catch (error) {
      print('Error adding data: $error');
    }
  }

  Future<void> createNewUser(
      String? userId, String? userName, String? userEmail) async {
    print('Database createNewUser: TRY');
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).set({
        "name": userName,
        "email": userEmail,
      });
      print('Database createNewUser: SUCCESS');
    } catch (e) {
      print('Database createNewUser: CATCH $e.toString');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamOfAppData(String userId) {
    print('Database streamOfAppData: TRY');
    try {
      return FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("todos")
          .orderBy("dateCreated", descending: true)
          .snapshots();
    } catch (e) {
      print('Database streamOfAppData: CATCH $e');
      rethrow;
    }
  }

  Future<void> addAppData(String content, String userId) async {
    print('Database addAppData: TRY');
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("todos")
          .add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
      print('Database addAppData: SUCCESS');
    } catch (e) {
      print('Database addAppData: CATCH $e.toString');
    }
  }

  Future<void> updateAppData(
      bool? newDoneValue, String userId, String appDataId) async {
    print('Database updateAppData: TRY');
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("todos")
          .doc(appDataId)
          .update({"done": newDoneValue});
      print('Database updateAppData: SUCCESS');
    } catch (e) {
      print('Database updateAppData: CATCH $e.toString');
    }
  }

  Future<void> deleteAppData(String userId, String appDataId) async {
    print('Database deleteAppData: TRY');
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("todos")
          .doc(appDataId)
          .delete();
      print('Database deleteAppData: SUCCESS');
    } catch (e) {
      print('Database deleteAppData: CATCH $e.toString');
    }
  }
}
