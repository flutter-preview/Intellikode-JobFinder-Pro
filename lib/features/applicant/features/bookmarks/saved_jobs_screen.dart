// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt_pro/features/applicant/features/bookmarks/widgets/saved_job_card.dart';
import 'package:jobhunt_pro/features/authentication/controller/auth_controller.dart';

import '../../../../common/custom_appbar.dart';

class SavedJobsScreen extends ConsumerWidget {
  const SavedJobsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicant = ref.watch(applicantStateProvider)!;
    return Scaffold(
      appBar: CustomAppBar(title: 'Saved', showSuffixIcon: false),
      body: 
            ListView.builder(
                itemCount: applicant.savedJobs.length,
                itemBuilder: (context, index) {
                  final saved = applicant.savedJobs.reversed.toList()[index];
                  return SavedJobCard(
                    jobId: saved,
                    imageUrl:
                        'https://pbs.twimg.com/profile_images/1658476926590414848/uqMIb2yx_400x400.jpg',
                    isBookmarked: true,
                  );
                })
        
         
      /* ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ApplyJobDialog(),
                SizedBox(height: 10),
                // Text(
                //   'You saved ${savedJobs.length} jobs',
                //   style: textStyle!.copyWith(fontSize: 22),
                // ),
                SizedBox(height: 20),
                // SelectableButtons(
                //   buttonList: savedScreenSelectableButtonText,
                //   selectedIndex: 1,
                // ),
              ],
            ),
          ),
          // ListView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: savedJobs.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return SavedJobCard(
          //       id: savedJobs[index].id,
          //       type: savedJobs[index].type,
          //       title: savedJobs[index].title,
          //       isBookmarked: savedJobs[index].isSaved,
          //       location: savedJobs[index].location,
          //       imageUrl: savedJobs[index].imageUrl,
          //       imageBackground: savedJobs[index].imageBackground,
          //     );
          //   },
          // ),
          SizedBox(height: 20)
        ],
      ),*/
    );
  }
}
