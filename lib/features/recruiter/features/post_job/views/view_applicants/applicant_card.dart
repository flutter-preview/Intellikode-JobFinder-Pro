import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:jobhunt_pro/features/authentication/controller/auth_controller.dart';
import 'package:jobhunt_pro/features/recruiter/features/post_job/controller/post_job_controller.dart';

class ApplicantCard extends ConsumerWidget {
  final String applicationId;
  const ApplicantCard({super.key, required this.applicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(appliedApplicantProvider(applicationId)).when(
        data: (applyJob) {
          return ref
              .watch(applicantProfileDetailsProvider(applyJob.applicantId))
              .when(
                  data: (profile) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          profile.profilePicture ??
                              'https://i.pravatar.cc/300?img=60',
                        ),
                      ),
                      title: Text(profile.name),
                      onTap: () {
                        print(applyJob.appliedTime);
                        print(applyJob.cvUrl);
                      },
                      trailing: const Icon(IconlyLight.arrow_right_2),
                    );
                  },
                  error: (error, statckTrace) => Center(
                        child: Text(error.toString()),
                      ),
                  loading: () => const Center());
        },
        error: (error, statckTrace) => Center(
              child: Text(error.toString()),
            ),
        loading: () => const Center());
  }
}