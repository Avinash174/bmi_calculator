import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/bmi_controller.dart';
import '../models/bmi_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_button.dart';
import '../widgets/round_icon_btn.dart';

class InputView extends GetView<BmiController> {
  const InputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.height < 700;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  children: [
                    SizedBox(height: isSmall ? 4 : 8),
                    _buildGenderRow(),
                    SizedBox(height: isSmall ? 4 : 8),
                    _buildHeightCard(context),
                    SizedBox(height: isSmall ? 4 : 8),
                    _buildWeightAgeRow(),
                    SizedBox(height: isSmall ? 8 : 12),
                  ],
                ),
              ),
            ),
            GradientButton(
              title: 'CALCULATE BMI',
              onTap: controller.calculateAndNavigate,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.scaffoldBg,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/bmi_logo.png',
            height: 36,
            width: 36,
          ),
          const SizedBox(width: 10),
          Text('BMI CALCULATOR', style: AppTextStyles.appBarTitle),
        ],
      ),
    );
  }

  Widget _buildGenderRow() {
    return SizedBox(
      height: 160,
      child: Row(
        children: [
          Expanded(child: _buildGenderCard(Gender.male)),
          Expanded(child: _buildGenderCard(Gender.female)),
        ],
      ),
    );
  }

  Widget _buildGenderCard(Gender gender) {
    final isMale = gender == Gender.male;
    final icon = isMale ? FontAwesomeIcons.mars : FontAwesomeIcons.venus;
    final label = isMale ? 'MALE' : 'FEMALE';
    final iconColor = isMale ? const Color(0xFF4FC3F7) : const Color(0xFFF48FB1);

    return Obx(() {
      final isActive = controller.selectedGender.value == gender;
      return GlassMorphicCard(
        isActive: isActive,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        onTap: () => controller.selectGender(gender),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? iconColor.withOpacity(0.15)
                    : Colors.white.withOpacity(0.05),
                border: Border.all(
                  color: isActive ? iconColor.withOpacity(0.6) : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: FaIcon(
                icon,
                size: 36,
                color: isActive ? iconColor : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: AppTextStyles.genderLabel.copyWith(
                color: isActive ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildHeightCard(BuildContext context) {
    return GlassMorphicCard(
      isActive: true,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Text('HEIGHT', style: AppTextStyles.label),
          const SizedBox(height: 8),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.height.value.toString(),
                    style: AppTextStyles.bigNumber,
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('cm', style: AppTextStyles.unit),
                  ),
                ],
              )),
          const SizedBox(height: 8),
          Obx(() => SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 4,
                  activeTrackColor: AppColors.primary,
                  inactiveTrackColor: Colors.white.withOpacity(0.1),
                  thumbColor: AppColors.accent,
                  overlayColor: AppColors.accentGlow,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 28),
                ),
                child: Slider(
                  value: controller.height.value.toDouble(),
                  min: 50,
                  max: 220,
                  onChanged: controller.setHeight,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildWeightAgeRow() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _buildCounterCard('WEIGHT', 'kg', controller.weight,
              controller.incrementWeight, controller.decrementWeight)),
          Expanded(child: _buildCounterCard('AGE', 'yrs', controller.age,
              controller.incrementAge, controller.decrementAge)),
        ],
      ),
    );
  }

  Widget _buildCounterCard(
    String label,
    String unit,
    RxInt value,
    VoidCallback onIncrement,
    VoidCallback onDecrement,
  ) {
    return GlassMorphicCard(
      isActive: true,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: AppTextStyles.label),
          const SizedBox(height: 4),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(value.value.toString(), style: AppTextStyles.bigNumber),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(unit, style: AppTextStyles.unit),
                  ),
                ],
              )),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconBtn(
                icon: FontAwesomeIcons.minus,
                onPressed: onDecrement,
              ),
              const SizedBox(width: 16),
              RoundIconBtn(
                icon: FontAwesomeIcons.plus,
                onPressed: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
