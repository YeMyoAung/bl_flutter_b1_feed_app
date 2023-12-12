import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_one/views/widgets/circle_profile.dart';

class MyDayCard extends StatelessWidget {
  final bool showProfileImage;
  const MyDayCard({
    super.key,
    this.showProfileImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: "https://via.placeholder.com/600/92c952",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.colorBurn,
                ),
              ),
            ),
            // alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: showProfileImage
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showProfileImage) const CircleProfile(),
                const Text(
                  "Ye Myo Aung",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
