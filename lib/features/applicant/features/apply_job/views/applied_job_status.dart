import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:jobhunt_pro/common/custom_forms_kit.dart';
import 'package:jobhunt_pro/common/info_chip.dart';
import 'package:jobhunt_pro/core/enums/application_status.dart';
import 'package:jobhunt_pro/core/resuables/ui/error_and_loading.dart';
import 'package:jobhunt_pro/features/applicant/features/apply_job/controller/apply_job_conntroller.dart';
import 'package:jobhunt_pro/features/recruiter/features/post_job/controller/post_job_controller.dart';
import 'package:jobhunt_pro/routes/app_route.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../../theme/colors.dart';

class AppliedJobStatus extends ConsumerWidget {
  final String applicationId;
  const AppliedJobStatus({super.key, required this.applicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobStatus = ref.watch(appliedJobsFutureProvider(applicationId));
    final textStyle = Theme.of(context).textTheme.displayMedium!;
    return jobStatus.when(
        data: (application) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, AppRoute.applicationStatusMessage,
                arguments: application.acceptanceMessage,),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ref.watch(myPostedJobProvider(application.jobId)).when(
                      data: (job) {
                        return GestureDetector(
                            // onTap: () => Navigator.of(context)
                            //         .push(pageRouteTransition(JobDetailScreen(
                            //       jobsData: job,
                            //     ))),
                            child: SizedBox(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    Text('Posted ${timeago.format(job.time)}',
                                        style: textStyle.copyWith(
                                            fontSize: 11, color: Colors.grey))
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
                                ],
                              )
                            ],
                          ),
                        )));
                      },
                      error: (error, stackTrace) => const Center(),
                      loading: () => const SizedBox()),
                  ListTile(
                    leading: const Icon(IconlyLight.work),
                    title: const CustomText(
                      text: 'Application Status',
                      size: 17,
                    ),
                    subtitle: Text(
                        'Applied ${timeago.format(application.appliedTime)}',
                        style: textStyle.copyWith(
                            fontSize: 11, color: Colors.grey)),
                    trailing: InfoChip(
                        title: application.status.text,
                        fontSize: 17,
                        bold: false,
                        titleColor: applicationStatusColor(application.status)),
                  ),
                ],
              ),
            ),
          );
        },
        error: errorWidget,
        loading: loading);
  }
}

Color applicationStatusColor(ApplicationStatus status) => switch (status) {
      ApplicationStatus.review => Colors.amber,
      ApplicationStatus.accepted => Colors.green,
      ApplicationStatus.rejected => Colors.red,
    };

