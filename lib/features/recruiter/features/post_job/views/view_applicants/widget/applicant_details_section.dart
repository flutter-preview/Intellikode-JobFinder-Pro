import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../common/custom_forms_kit.dart';
import '../../../../../../../common/info_chip.dart';
import '../../../../../../../constants/app_svg.dart';
import '../../../../../../../model/applicant.dart';
import '../../../../../../../theme/colors.dart';
import '../../../../../../applicant/features/job_detail/job_detail_screen.dart';
import 'applicant_icon_infobox.dart';
import 'decorated_box_container.dart';

class ApplicantDetailsSection extends StatelessWidget {
  final Applicant applicant;
  const ApplicantDetailsSection({super.key, required this.applicant});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displayMedium;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(applicant.profilePicture),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(applicant.name,
                style: textStyle!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(applicant.title, style: textStyle.copyWith(fontSize: 15)),
            SvgPicture.asset(AppSvg.verifyBold, color: AppColors.primaryColor),
          ],
        ),
        const SizedBox(height: 15),
        ApplicantIconInfoBox(
            title: 'Email',
            subtitle: applicant.email,
            icon: AppSvg.atSignBold,
            iconColor: Colors.lime),
        const SizedBox(height: 10),
        ApplicantIconInfoBox(
            title: 'Location',
            subtitle: applicant.location,
            icon: AppSvg.locationBold,
            iconColor: Colors.red),
        const SizedBox(height: 15),
        DecoratedBoxContainer(children: [
          const CustomText(text: 'About', bold: true, size: 18),
          const SizedBox(height: 8),
          Text(applicant.about,
              style: textStyle.copyWith(
                  fontSize: 14, letterSpacing: 0.2, wordSpacing: 3)),
        ]),
        DecoratedBoxContainer(children: [
          const CustomText(text: 'Skills', bold: true, size: 18),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 10,
            children: applicant.skills
                .map((item) => InfoChip(
                      title: item,
                      plain: true,
                      titleColor: AppColors.primaryColor,
                    ))
                .toList(),
          ),
        ]),
        DecoratedBoxContainer(children: [
          const CustomText(text: 'Experience', bold: true, size: 18),
          BulletedListBuilder(list: applicant.experience),
        ]),
      ],
    );
  }
}
