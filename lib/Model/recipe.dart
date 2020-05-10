import 'package:flutter/cupertino.dart';

class Recipe {
  final String name;
  final String description;
  final String author;
  final int hours;
  final int minutes;
  final String image;
  final int likes;
  bool isFavorite;

  Recipe(this.name, this.description, this.author, this.hours, this.minutes,
      this.image, this.likes, this.isFavorite);
}
