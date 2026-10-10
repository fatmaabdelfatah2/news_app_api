import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/screens/home_cubit.dart';
import 'package:news_app_api/screens/home_details.dart';
import 'package:news_app_api/screens/home_state.dart';
import 'package:news_app_api/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String>catogories=['All','Politic','Sport','Education'];
  int currindex=0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.menu),
          ),
          actions: [
            CircleAvatar(
               backgroundColor: Colors.white,
              child: Icon(Icons.search),
            ),
             SizedBox(width: 5,),
             CircleAvatar(
               backgroundColor: Colors.white,
              child: Icon(Icons.notifications_outlined),
            ),
          ],
        ),
       body: BlocBuilder<HomeCubit,HomeState>(
        builder: (context, state) {
         
            return Padding(
           padding: const EdgeInsets.only(top: 140,left: 13,right: 13),
           child: Column(
             children: [
            
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool isSelected=currindex ==index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currindex=index;
                      });
                      if(catogories[index]=='All'){
                        context.read<HomeCubit>().getHomeData();
                      }else{
                       context.read<HomeCubit>().getSearchData(query: catogories[index]);    }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: isSelected? Colors.amber:Colors.white,
                        border: Border.all(
                          width: 2,
                          color: isSelected?Colors.amber:Colors.black
                        )
                      ),
                      child: Center(
                        child: Text(catogories[index],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      ),
                    ),
                  );
                }, 
                separatorBuilder: (context, index) {
                  return SizedBox(width: 25,);
                }, 
                itemCount: catogories.length),
              ),

              SizedBox(height: 16,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('News For You',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text('Show More',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(height: 3,),
                BlocBuilder<HomeCubit,HomeState>(
                  builder: (context, state) {

                        if(state is HomeLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is HomeFailure){
            return Center(child: Text(state.msg),);
          }
          if(state is HomeSuccess){
                    return Expanded(
                    child: ListView.separated(
                      separatorBuilder:(context, index) => Divider(),
                      itemCount: state.data.length,
                     itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeDetails(model: state.data[index],),));
                        },
                        child: Row(
                          spacing: 12,
                          children: [
                            Expanded(child: Image.network(
                          state.data[index].image ?? 'fallback_url',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network('https://iso.500px.com/wp-content/uploads/2015/09/wide.jpeg');
                          },
                        ),),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.data[index].author??'fatma Abdelfatah',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                  ),
                                  Text(state.data[index].description??'Description',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                  Align(
                                    alignment: AlignmentGeometry.centerEnd,
                                    child: Text(state.data[index].date??'Date',
                                    
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                  ),
                                    textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                     }, 
                    
                      ),
                                 );
                    
                    
                  }
                    return  SizedBox();
                  },
                  
                ),
             ],
           ),
         
                );
          

        
        }, 
       ),
    ),
      
    );
  }
}