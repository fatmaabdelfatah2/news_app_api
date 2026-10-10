import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/screens/home_cubit.dart';
import 'package:news_app_api/screens/home_details.dart';
import 'package:news_app_api/screens/home_state.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;

  const SearchResultsScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSearchData(query: query),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(),
          centerTitle: true,
          title: Text('Search Results for $query',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
          
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

        
            if (state is HomeFailure) {
              return Center(
                child: Text(
                  state.msg,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }

       
            if (state is HomeSuccess) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final item = state.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetails(model: item),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.description ?? 'Description',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.author ?? 'Rana Mohy',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                       
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,                                    ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        item.date ?? 'Date',
                                          maxLines: 1,
                                        overflow: TextOverflow.ellipsis,   
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Image.network(
                              item.image ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR...',
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error, color: Colors.red);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}