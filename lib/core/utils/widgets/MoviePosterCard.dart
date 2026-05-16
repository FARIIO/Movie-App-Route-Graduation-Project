import 'package:flutter/material.dart';

import '../app_colors.dart';

class MoviePosterCard extends StatelessWidget {
  const MoviePosterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage('assets/images/poster_placeholder.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Row(
                children: <Widget>[
                  Text(
                    "7.7 ",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 10),
                  ),
                  Icon(Icons.star, color: AppColors.yellowColor, size: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
