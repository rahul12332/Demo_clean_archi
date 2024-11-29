import 'package:demo/presentation/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/costant/color_contant.dart';
import '../bloc/post_bloc/post__bloc.dart';
import '../bloc/post_bloc/post__event.dart';
import '../bloc/post_bloc/post__state.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];


                return Card(
                  child: ListTile(
                    tileColor: post.isRead ? AppColors.white : AppColors.yellow,
                    title: Text(post.title),
                    subtitle: Text(
                      post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: ClockTimer(postId: post.id), // Use ClockTimer here
                    onTap: () {
                      context.read<PostBloc>().add(MarkPostAsReadEvent(post.id));
                    },
                  ),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No Posts Available'));
        },
      ),
    );
  }
}
