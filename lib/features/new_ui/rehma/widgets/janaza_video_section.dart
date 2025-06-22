import 'dart:developer';
import 'dart:ui';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class JanazaVideoSection extends StatefulWidget {
  const JanazaVideoSection({super.key});

  @override
  State<JanazaVideoSection> createState() => _JanazaVideoSectionState();
}

class _JanazaVideoSectionState extends State<JanazaVideoSection> {
  VideoPlayerController? controller;

  @override
  void initState() {
    controller=VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))..initialize().then((value) {
      setState(() {

      });
    },);

    controller!.addListener(() {
      final isFinished = controller!.value.position >= controller!.value.duration;
      if (isFinished) {
        controller!.seekTo(Duration.zero);
        controller!.pause();
        // Optional: reset to start
        // controller!.seekTo(Duration.zero);
        setState(() {
        }); // refresh UI to show play button again
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: .5,color: AppColor.darkYellow()),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if(controller!.value.isPlaying){
                  controller!.pause();
                }else{
                  controller!.play();
                }
              });
            },
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Container(
                    height:200 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                      color: AppColor.darkGreen,
                    ),
                    width: mdWidth(context)*1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                        child:   controller!.value.isInitialized
                            ? AspectRatio(
                          aspectRatio: controller!.value.aspectRatio,
                          child: VideoPlayer(controller!),
                        )
                            : Center(child: const CircularProgressIndicator.adaptive(backgroundColor: Colors.white,))
                    ),
                  ),
                  controller!.value.isPlaying? SizedBox(): Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.white),
                        shape: BoxShape.circle,

                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(text: "Sheikh Yaqub Al-Hooti",color: AppColor.darkGreen,fontFamily: 'ns',fontSize: context.mh * 0.015,),
                AppText(text: "General Authority Of Islamic Affairs, Endowments & Zakat",fontSize: context.mh * 0.012,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
