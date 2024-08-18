part of 'add_food_bloc.dart';

@immutable
abstract class AddFoodEvent extends Equatable {
  const AddFoodEvent();
}

class AddFoodRequestEvent extends AddFoodEvent {
  final File image;
  final int category;
  final double price;
  final String name;
  final String desc;

  const AddFoodRequestEvent(
      this.image, this.category, this.name, this.desc, this.price);
  @override
  List<Object?> get props => [
        image,
        category,
        desc,
        name,
        price,
      ];
}
