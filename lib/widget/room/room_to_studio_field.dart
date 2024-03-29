import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/screen/studio_detail_screen.dart';

class ToStudioField extends StatelessWidget {
  final String studioId;

  const ToStudioField(this.studioId) : super(key: const Key('toStudioField'));

  @override
  Widget build(BuildContext context) {
    final studio =
        Provider.of<StudioListProvider>(context, listen: false).byId(studioId);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          StudioDetailScreen.routeName,
          arguments: studioId,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 15,
                  ),
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      studio.image!,
                      fit: BoxFit.fill,
                      errorBuilder: (ctx, exception, _) {
                        return Container(
                          color: Colors.black12,
                          alignment: AlignmentDirectional.center,
                          child: const Text('Не удалось загрузить изображение'),
                        );
                      },
                      loadingBuilder: (ctx, ch, loadingProgress) {
                        if (loadingProgress == null) {
                          return ch;
                        }
                        return SkeletonAnimation(
                          shimmerColor: Colors.white54,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 143,
                  child: Text(
                    studio.name,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  StudioDetailScreen.routeName,
                  arguments: studioId,
                );
              },
              icon: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
