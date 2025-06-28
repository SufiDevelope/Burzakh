import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/features/emirati_svcs/presentation/controller/cubit.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/AppColor.dart';

class RequestSubmittedGreenContainer extends StatelessWidget {
  final String id;
  const RequestSubmittedGreenContainer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _emiratiScvCubit,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFf0fdf4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFA5D6A7),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFdcfce7),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_outline_outlined,
                  size: 24,
                  color: AppColor.darkGreen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Request Submitted",
                      fontSize: context.mh * 0.015,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'ns',
                      color: AppColor.darkGreen,
                    ),
                    SizedBox(height: 2),
                    AppText(
                      text: id == "CDA"
                          ? "Your request has been sent to the Community Development Authority."
                          : "Your request has been sent to the Road Transport Authority.",
                      fontSize: context.mh * 0.013,
                      color: AppColor.darkGreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

var _emiratiScvCubit = DiContainer().sl<EmirateSvcsCubit>();
