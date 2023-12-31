// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt_pro/common/route_transition.dart';
import 'package:jobhunt_pro/features/recruiter/features/post_job/controller/post_job_controller.dart';
import 'package:jobhunt_pro/routes/app_route.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../../../theme/colors.dart';
import '../../../../../../applicant/features/job_detail/job_detail_screen.dart';
import 'photo_pile.dart';

class JobCard extends ConsumerWidget {
  final bool isApplicant;
  final bool isActive;
  final String postedJobsId;
  final void Function()? onTap;
  const JobCard({
    Key? key,
    required this.isApplicant,
    this.onTap,
    required this.postedJobsId,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.displayMedium!;

    return ref.watch(myPostedJobProvider(postedJobsId)).when(
        data: (job) {
          Widget jobWidget = Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.secondaryColor,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 1)
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  job.jobTitle,
                                  style: textStyle.copyWith(
                                      color: Colors.grey.shade800,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.access_time_sharp,
                                  color: AppColors.secondaryColor, size: 20),
                              const SizedBox(width: 5),
                              Text(timeago.format(job.time),
                                  style: textStyle.copyWith(
                                      fontSize: 11, color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(height: 3),
                        const PhotoPile(
                          images: [
                            'https://i.pravatar.cc/300?img=1',
                            'https://i.pravatar.cc/300?img=2',
                            'https://i.pravatar.cc/300?img=3',
                            'https://i.pravatar.cc/300?img=4',
                            'https://i.pravatar.cc/300?img=5',
                            'https://i.pravatar.cc/300?img=6',
                            'https://i.pravatar.cc/300?img=7',
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ));
          return GestureDetector(
            onTap: () => isApplicant
                ? Navigator.of(context)
                    .push(pageRouteTransition(JobDetailScreen(
                    jobsData: job,
                  )))
                : Navigator.of(context)
                    .pushNamed(AppRoute.postedJobDetailsView, arguments: job),
            child: isActive
                ? job.isOpened
                    ? jobWidget
                    : const SizedBox()
                : !job.isOpened
                    ? jobWidget
                    : const SizedBox(),
          );
        },
        error: (error, stackTrace) => const Center(),
        loading: () => const SizedBox());
  }
}
