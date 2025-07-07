import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/features/home/data/model/post_model.dart';
import 'package:trading_app/features/home/presentation/widgets/date_formatter_widget.dart';

class HomeWidget extends StatefulWidget {
  final TradingPostModel data;
  const HomeWidget({super.key, required this.data});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 5,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                          (widget.data.userImage != null &&
                                  widget.data.userImage!.isNotEmpty)
                              ? Image.network(
                                widget.data.userImage!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(AppImages.mask);
                                },
                              )
                              : Image.asset(AppImages.mask),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.userName ?? 'No Name',
                        style: AppTextStyles.s14w500,
                      ),
                      Text(
                        widget.data.date != null
                            ? DateFormatter.parseAndFormatToUzbek(
                              widget.data.date!,
                            )
                            : 'No Date',
                        style: AppTextStyles.s10w400,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.data.postTime ?? '1 soat oldin',
                    style: AppTextStyles.s10w600.copyWith(
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          8.height,
          Container(
            decoration: BoxDecoration(
              color: AppColors.backBlackColor2,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.message ?? 'No Message',
                    style: AppTextStyles.s14w700,
                  ),
                  20.height,
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:
                          (widget.data.userImage != null &&
                                  widget.data.userImage!.isNotEmpty)
                              ? Image.network(
                                widget.data.userImage!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(AppImages.mask);
                                },
                              )
                              : Image.asset(AppImages.mask),
                    ),
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Text(
                        widget.data.time ?? '',
                        style: AppTextStyles.s10w400.copyWith(
                          color: AppColors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          10.height,
          Row(
            spacing: 5,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite, color: Colors.red),
              ),
              Text('${widget.data.likes ?? 0}', style: AppTextStyles.s14w400),
            ],
          ),
          10.height,
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: AppColors.white.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}
