// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:jobhunt_pro/features/applicant/features/apply_job/controller/apply_job_conntroller.dart';
import 'package:jobhunt_pro/features/authentication/controller/auth_controller.dart';
import 'package:jobhunt_pro/model/post_job.dart';

import '../../../../../common/company_logo.dart';
import '../../../../../common/svg_icon_mini.dart';
import 'package:timeago/timeago.dart' as timeAgo;

import '../../../../../constants/app_svg.dart';

class RecentJobCard extends ConsumerStatefulWidget {
  final PostJob job;

  final String imageUrl;
  final Color imageBackground;
  final bool isSaved;

  final void Function()? onTap;

  const RecentJobCard({
    Key? key,
    required this.imageUrl,
    required this.imageBackground,
    required this.isSaved,
    required this.job,
    this.onTap,
  }) : super(key: key);

  @override
  ConsumerState<RecentJobCard> createState() => _RecentJobCardState();
}

class _RecentJobCardState extends ConsumerState<RecentJobCard> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displayMedium!;
    return InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 1)
            ],
          ),
          child: Row(
            children: [
              CompanyLogo(
                size: 30,
                imageUrl: widget.imageUrl,
              ),
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
                            widget.job.jobTitle,
                            style: textStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SvgIconMini(svg: AppSvg.locationLight),
                        Text(
                          ' ${widget.job.location}',
                          style: textStyle.copyWith(fontSize: 11),
                        ),
                        const SizedBox(width: 10),
                        const SvgIconMini(svg: AppSvg.briefcaseLight),
                        Text(
                          ' ${widget.job.jobType}',
                          style: textStyle.copyWith(fontSize: 11),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  ref.watch(currentApplicantDetailsProvider).when(
                      data: (applicant) {
                        return InkWell(
                          onTap: () {
                            ref
                                .watch(applyJobControllerProvider.notifier)
                                .saveJob(
                                    applicant: applicant,
                                    jobId: widget.job.jobId);
                            setState(() {});
                          },
                          child: Icon(
                            applicant.savedJobs.contains(widget.job.jobId)
                                ? IconlyBold.bookmark
                                : IconlyLight.bookmark,
                            color: Colors.grey[700],
                          ),
                        );
                      },
                      error: (error, stack) => const SizedBox(),
                      loading: () => const SizedBox()),
                  const SizedBox(height: 10),
                  Text(timeAgo.format(widget.job.time, locale: 'en_short'))
                ],
              )
            ],
          ),
        ));
  }
}
