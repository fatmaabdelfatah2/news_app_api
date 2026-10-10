import 'package:flutter/material.dart';
import 'package:news_app_api/screens/search_results_screen.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key,
    this.quary
   });
final String? quary;
 TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                onFieldSubmitted: (value) {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>SearchResultsScreen(query: value) ,));
                },
                decoration:  InputDecoration(
filled: true,
fillColor: Color(0xffF0EFF0),
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search_sharp),
                  suffixIcon:  GestureDetector(
                    onTap: () {
                      controller.clear();
                    },
                    child: Icon(Icons.close)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color:Color(0xffF0EFF0),
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color:Color(0xff0088FF),
                    )
                  )
                ),
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
             
              onPressed: () {
               controller.clear();
              },
              child:  Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }
}