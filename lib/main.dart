
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/utils/app_bloc_observer.dart';
import 'package:netflix_clone/core/utils/functions/service_locator.dart';
import 'package:netflix_clone/core/utils/managers/router_manager.dart';
import 'package:netflix_clone/core/utils/managers/string_manager.dart';
import 'package:netflix_clone/core/utils/managers/theme_manager.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = AppBlocObserver();
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: StringManager.appName,
      theme: ThemeManager.darkTheme,
      routerConfig: RouterManager.routes,
    );
  }
}






///////////////////////////////////////////////////////////

// class Show {
//   final int? id;
//   final String? url;
//   final String? name;
//   final String? type;
//   final String? language;
//   final List<String>? genres;
//   final String? status;
//   final int? runtime;
//   final String? premiered;
//   final String? summary;
//   final String? image;

//   Show({
//     required this.id,
//     required this.url,
//     required this.name,
//     required this.type,
//     required this.language,
//     required this.genres,
//     required this.status,
//     required this.runtime,
//     required this.premiered,
//     required this.image,
//     required this.summary,
//   });

//   factory Show.fromJson(Map<String, dynamic> json) {
//     return Show(
//       id: json['id'] as int,
//       url: json['url'] as String?,
//       name: json['name'] as String?,
//       type: json['type'] as String?,
//       language: json['language'] as String?,
//       genres:
//           (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
//       status: json['status'] as String?,
//       runtime: json['runtime'] as int? ?? 0,
//       premiered: json['premiered'] as String?,
//       summary: json['summary'] as String?,
//       image: json['image'] != null ? json['image']['original'] : null,
//     );
//   }
// }

// class ApiService {
//   final Dio _dio = Dio();

//   Future<List<Show>> fetchShowDetails() async {
//     final response = await _dio.get(ApiManager.getMoviesBaseUrl);
//     if (response.statusCode == 200) {
//       final List<dynamic> results = response.data;

//       return results
//           .where((result) => result['show']?['image']?['original'] != null)
//           .map(
//             (result) => Show.fromJson(result['show']),
//           )
//           .toList();
//     } else {
//       throw Exception('Failed to load show details');
//     }
//   }
// }

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ShowDetailsScreen(),
//     );
//   }
// }

// class ShowDetailsScreen extends StatelessWidget {
//   final ApiService apiService = ApiService();

//   ShowDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Show Details')),
//       body: FutureBuilder<List<Show>>(
//         future: apiService.fetchShowDetails(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No data available'));
//           }

//           final shows = snapshot.data!;
//           return ListView.builder(
//             itemCount: shows.length,
//             itemBuilder: (context, index) {
//               final show = shows[index];
//               return Card(
//                 margin: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   leading: show.image != null && show.image!.isNotEmpty
//                       ? Image.network(
//                           show.image!,
//                           height: 300,
//                           width: 150,
//                           fit: BoxFit.fill,
//                         )
//                       : Container(
//                           height: 300,
//                           width: 50,
//                           color: Colors.grey,
//                           child: const Icon(Icons.image, color: Colors.white),
//                         ),
//                   title: Text(show.name ?? 'No Name'),
//                   subtitle: Text(show.genres?.join(', ') ?? 'No Genres'),
//                   onTap: () {
//                     // Navigate to details or show more information
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
