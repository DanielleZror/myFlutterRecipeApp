import 'package:flutter/material.dart';

Widget favoriteIcon(isFavorited, likes, _toggleFavorite) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => _toggleFavorite(),
            child: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: Colors.pink,
              size: 24,
            ),
          ),
          (likes < 500) ? Text(likes.toString()) : Text('500+'),
        ],
      ),
    ],
  );
}
