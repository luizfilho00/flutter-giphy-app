import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:mymovies/data/remote/api_client.dart';
import 'package:mymovies/data/repository/default_gif_repository.dart';
import 'package:mymovies/presentation/home/bloc/home_bloc.dart';
import 'package:mymovies/presentation/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc(
            (i) => HomeBloc(BlocProvider.getDependency<DefaultGifRepository>()))
      ],
      dependencies: [
        Dependency((i) => ApiClient()),
        Dependency((i) =>
            DefaultGifRepository(BlocProvider.getDependency<ApiClient>()))
      ],
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          hintColor: Colors.white,
        ),
      ),
    );
  }
}
