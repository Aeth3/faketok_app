import 'package:faketok_app/models/user.dart';
import 'package:faketok_app/models/video.dart';
import 'package:faketok_app/providers/user_provider.dart';
import 'package:faketok_app/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoWidget extends ConsumerStatefulWidget {
  const VideoWidget(
      {super.key,
      required this.video,
      required this.containerHeight,
      required this.screenHeight,
      required this.screenWidth,
      required this.isEnd});

  final Video video;
  final double containerHeight;
  final double screenHeight;
  final double screenWidth;
  final bool isEnd;
  @override
  ConsumerState<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends ConsumerState<VideoWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(userNotifierProvider);
    super.build(context).key;
    return Stack(
      children: [
        Image(
          image: widget.video.userImage,
          height: widget.containerHeight * 1,
        ),
        Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: widget.isEnd
                ? GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! < 0) {
                        User user = users.firstWhere((element) => element.id == widget.video.userId);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserProfile(user: user),
                        ));
                      }
                    },
                    child: Container(
                      width: 100,
                      color: Colors.transparent,
                    ),
                  )
                : Container()),
        Positioned(
          right: 0,
          top: widget.screenHeight * 0.4 + 45,
          child: Container(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    foregroundImage: widget.video.userImage,
                    radius: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  widget.video.likes.toInt().toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.comment,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  widget.video.comment.toInt().toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.bookmark,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  widget.video.favorites.toInt().toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.play_arrow_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  widget.video.shares.toInt().toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 10, color: Colors.black26),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    foregroundImage: widget.video.userImage,
                    radius: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 58,
          left: 0,
          child: Container(
            height: 35,
            color: const Color.fromARGB(67, 0, 0, 0),
            child: Row(children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                    text: 'Search• ',
                    children: [TextSpan(text: widget.video.search)]),
              ),
            ]),
          ),
        ),
        Positioned(
            bottom: 100,
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.video.username,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: widget.screenWidth - 70,
                    child: Text(
                      widget.video.caption,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
