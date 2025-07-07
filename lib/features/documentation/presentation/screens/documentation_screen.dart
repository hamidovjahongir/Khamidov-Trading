import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_app/core/constants/app_colors.dart';
import 'package:trading_app/core/constants/app_images.dart';
import 'package:trading_app/core/constants/app_textstyles.dart';
import 'package:trading_app/core/extensions/num_extensions.dart';
import 'package:trading_app/core/widgets/w_custom_background.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WCustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            spacing: 50.h,
            children: [
              50.height,

              DocumentationItems(
                title: 'OFFLINE KURS',
                image: AppImages.offlinee,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget();
                    },
                  );
                },
              ),

              DocumentationItems(
                title: 'ONLINE KURS',
                image: AppImages.atOnline,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(online: true);
                    },
                  );
                },
              ),

              DocumentationItems(
                title: 'VIP KANAL',
                image: AppImages.candles,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(vip: true);
                    },
                  );
                },
              ),

              DocumentationItems(
                title: 'LEDGER',
                image: AppImages.hardware,
                color: AppColors.pink,
                isLedger: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(ledger: true);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentationItems extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String image;
  final Color? color;
  final bool? isLedger;
  const DocumentationItems({
    super.key,
    required this.title,
    required this.image,
    this.color = AppColors.darkBlue,
    this.isLedger = false,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: AppColors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.s20w800),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Batafsil', style: AppTextStyles.s14w400),
                        const SizedBox(width: 7),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (isLedger == true)
            Positioned(
              left: 130,
              child: Image.asset(
                AppImages.ledger,
                width: 63,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),

          Positioned(
            right: 0,
            top: -50,
            child: Image.asset(
              image,
              width: 133,
              height: 133,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class AlertDialogWidget extends StatelessWidget {
  final bool? online;
  final bool? vip;
  final bool? ledger;

  const AlertDialogWidget({
    super.key,
    this.online = false,
    this.vip = false,
    this.ledger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 35),
      backgroundColor: AppColors.primary.withOpacity(0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  online == true
                      ? "ONLINE KURS"
                      : vip == true
                      ? "VIP KANAL"
                      : ledger == true
                      ? "LEDGER"
                      : 'OFFLINE KURS',
                  style: AppTextStyles.s22w800.copyWith(
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 50,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, size: 30, color: AppColors.white),
                ),
              ],
            ),

            Text(
              maxLines: ledger == true ? 6 : 4,
              overflow: TextOverflow.ellipsis,
              online == true
                  ? "Online kursda ham Offline da o’rgatiladigan barcha narsalar o’rgatiladi. Bu kurslar orasidagi farqi ofisga kelib emas, online tarzda o’rganasiz!"
                  : vip == true
                  ? "VIP Kanalda shaxsan o’zim (Arashov) va jamoamdagi professional treyderlar bilan birgalikda signal beramiz. Shu signallar orqali savdo qilib daromad qilishingiz mumkin  📈"
                  : ledger == true
                  ? "Agar siz kriptovalyutalarni uzoq muddatga investitsiya qilishni rejalashtirmoqchi bo'lsangiz ushbu qurilmadan foydalanishingiz lozim. Chunki kriptovalyutalaringiz offline rejimda saqlanadi va ushbu qurilma Hackerlik va online hujumlardan himoya qiladi"
                  : "«Arashov Trading Academy» da siz Kriptovalyuta savdosi (Trading) ni 0 dan mukammal o'rganib, daromad qilishni boshlashingiz mumkin!",
              style: AppTextStyles.s16w800,
            ),
            Text(
              vip == true
                  ? "VIP Kanalga ulanish narxlari:"
                  : ledger == true
                  ? "Ledger narxlar"
                  : "Kurs haqida batafsil ma'lumot:",
              style: AppTextStyles.s16w800,
            ),
            vip == true
                ? Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff262C43),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          spacing: 18,
                          children: [
                            Image.asset(
                              AppImages.telegramCloud,
                              width: 85,
                              height: 85,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '1',
                                      style: AppTextStyles.s16w600.copyWith(
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    Text(
                                      ' oy - 150\$',
                                      style: AppTextStyles.s16w600,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '3',
                                      style: AppTextStyles.s16w600.copyWith(
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    Text(
                                      ' oy - 300\$',
                                      style: AppTextStyles.s16w600,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Doimiy',
                                      style: AppTextStyles.s16w600.copyWith(
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    Text(
                                      ' - 500\$',
                                      style: AppTextStyles.s16w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 15,
                      child: Image.asset(AppImages.ledger),
                    ),
                  ],
                )
                : ledger == true
                ? Row(
                  children: [
                    // LedgerCard()
                  ],
                )
                : KursDavomiyligi(),
            Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              "Kursimizda o'qib eng yaxshi natija ko'rsatgan o'quvchiga CAPTIVA avtomobili Sovg’a qilinadi",
              style: AppTextStyles.s16w800,
            ),
            Text(
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              "Kursga yozilmoqchi bo’lsangiz menedjerlarimizga murojaat qiling:",
              style: AppTextStyles.s16w800,
            ),
            NumberButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Icon(Icons.telegram, color: Colors.white),
                Text('@Arashov Manager', style: AppTextStyles.s14w600),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          spacing: 4,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                Text('+998 (95) 505-11-99', style: AppTextStyles.s16w700),
                Icon(Icons.copy, color: Colors.white, size: 15),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                Text('+998 (77) 020-11-99', style: AppTextStyles.s16w700),
                Icon(Icons.copy, color: Colors.white, size: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class KursDavomiyligi extends StatelessWidget {
  const KursDavomiyligi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 18,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.access_time, color: AppColors.white, size: 35),
            Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kurs davomiyligi: 1.5 oy', style: AppTextStyles.s16w700),
                Text(
                  "(Dars 2-3 soatdan bo'lib o'tadi)",
                  style: AppTextStyles.s16w500,
                ),
              ],
            ),
          ],
        ),
        25.height,
        Row(
          spacing: 18,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.dollar, width: 32),
            Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kurs davomiyligi: 1.5 oy', style: AppTextStyles.s16w700),
                Text(
                  "(Dars 2-3 soatdan bo'lib o'tadi)",
                  style: AppTextStyles.s16w500,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
