import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../src/controller/video_controller.dart';
import '../../src/models/video.dart';

class VideoWidget extends StatefulWidget {
  final Video video;
  const VideoWidget({Key key, this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController _videoController;

  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id.videoId);
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            color: Colors.grey.withOpacity(0.5),
            child: CachedNetworkImage(
              imageUrl: widget.video.snippet.thumbnails.medium.url,
              placeholder: (context, url) => Container(
                height: 230,
                child: Center(child: CircularProgressIndicator()),
              ),
              fit: BoxFit.fitWidth,
            )

            // Image.network(
            //   widget.video.snippet.thumbnails.medium.url,
            //   fit: BoxFit.fitWidth,
            // ),
            ),
      ],
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          Obx(() => CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.withOpacity(0.5),
                backgroundImage: Image.network(
                  _videoController.youtuberThumnailUrl,
                  scale: 0.5,
                ).image,
              )),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.video.snippet.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                      alignment: Alignment.topCenter,
                      icon: Icon(Icons.more_vert),
                      onPressed: () {})
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.video.snippet.channelTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                  Obx(() => Expanded(
                        child: Text(
                          _videoController.viewCountString,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      )),
                  Expanded(
                    child: Text(
                      DateFormat('yyyy-MM--dd')
                          .format(widget.video.snippet.publishedAt),
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
