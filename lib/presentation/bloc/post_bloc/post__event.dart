abstract class PostEvent {}

class FetchPostsEvent extends PostEvent {}

class FetchPostDetailsEvent extends PostEvent {
  final int postId;

  FetchPostDetailsEvent(this.postId);
}

class MarkPostAsReadEvent extends PostEvent {
  final int postId;

  MarkPostAsReadEvent(this.postId);
}
