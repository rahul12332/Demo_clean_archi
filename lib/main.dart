import 'package:demo/presentation/bloc/post_bloc/post__event.dart';
import 'package:demo/presentation/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/post_bloc/post__bloc.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc()..add(FetchPostsEvent()), // Trigger the initial event
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo',
        theme: appTheme, // Applying the theme
        home: PostListScreen(), // Set the main screen
      ),
    );
  }
}
