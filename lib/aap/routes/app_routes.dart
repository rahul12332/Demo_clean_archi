import 'package:get/get.dart';
import '../../presentation/screens/post_detail_screen.dart';

class AppRoutes {
  static const posts = '/';
  static const postDetails = '/details';

  static final pages = [
    GetPage(name: posts, page: () => PostListScreen()),
  ];
}
