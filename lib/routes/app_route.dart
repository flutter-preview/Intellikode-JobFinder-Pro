import 'package:flutter/material.dart';
import 'package:jobhunt_pro/features/applicant/features/home/views/page_navigator.dart';
import 'package:jobhunt_pro/features/recruiter/features/home/views/page_navigator.dart';
import 'package:jobhunt_pro/features/recruiter/features/home/views/recruiter_home.dart';

import '../features/applicant/features/profile/edit_profile.dart';
import '../features/recruiter/features/post_job/views/post_jobs_screen/post_a_job_view.dart';
import '../features/recruiter/features/post_job/views/post_jobs_screen/posted_job_detail_view.dart';
import '../features/recruiter/features/post_job/views/view_applicants/view_applicants_view.dart';

class AppRoute {
  static const String postedJobDetailsView = 'posted-job-detail-view';
  static const String postAJobView = 'post-a-job-view';
  static const String viewApplicants = 'view-applicants-view';
  static const String applicantsHomeView = 'applicants-home-view';
  static const String recruiterHomeView = 'recruiter-home-view';
  static const String recruiterPageNavigator = 'recruiter-page-navigator';
    static const String editApplicantProfile = 'edit-applicant-profile';
  static toPage(Widget page) => MaterialPageRoute(builder: (context) => page);

  static Route<dynamic> generatedRoute(RouteSettings routeSettings) {
    dynamic routeObject;
    if (routeSettings.arguments != null) {
      routeObject = routeSettings.arguments;
    }

    return switch (routeSettings.name) {
      postedJobDetailsView => toPage(PostedJobDetailView(job: routeObject)),
      postAJobView => toPage(const PostAJobView()),
      viewApplicants => toPage(ViewApplicantsView(applicantId: routeObject)),
      applicantsHomeView => toPage(const ApplicantPageNavigator()),
      recruiterHomeView => toPage(const RecruiterHomeView()),
      recruiterPageNavigator => toPage(const RecruiterPageNavigator()),
      editApplicantProfile => toPage( EditApplicantProfile(applicant: routeObject,)),
      _ => MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(
                  child: Text('Wrong route'),
                ),
              )),
    };
  }
}
