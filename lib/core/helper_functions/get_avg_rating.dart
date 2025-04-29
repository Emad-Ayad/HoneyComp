import 'package:honey_comp/features/home/domain/entities/review_entity.dart';


// todo not working right now
num getAvgRating(List<ReviewEntity> reviews) {
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.ratting;
  }
  return sum;
}
