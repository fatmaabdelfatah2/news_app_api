import 'package:flutter/material.dart';
import 'package:news_app_api/widgets/circle_icon.dart';
import 'package:news_app_api/widgets/custom_appbar_details.dart';

import '../models/article_model.dart';

class HomeDetails extends StatelessWidget {
   HomeDetails({super.key,
   required this.model
   });

   final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarDetails(),

    body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                model.image ?? '',
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://iso.500px.com/wp-content/uploads/2015/09/wide.jpeg',
                    height: 230,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
             SizedBox(height: 14),

         
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.author ?? 'Fatma Abdelfatah',
                  style:  TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                 Row(
                  children: [
                    Icon(Icons.favorite_border, size: 21, color: Colors.black87),
                    SizedBox(width: 4),
                    Text(
                      '204',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
             SizedBox(height: 6),

           
            Text(
              model.date ?? '8 min read . Updated recently',
              style:  TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
             SizedBox(height: 14),

           
            Text(
              model.description ?? 'News Title goes here...',
              style:  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.3,
              ),
            ),
             SizedBox(height: 16),

       
            Text(
              model.description ?? '',
              style:  TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}