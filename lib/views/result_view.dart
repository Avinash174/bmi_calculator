import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bmi_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_button.dart';

class ResultView extends GetView<BmiController> {
  const ResultView({Key? key}) : super(key: key);

  Color _getResultColor(String key) {
    switch (key) {
      case 'obese':
        return const Color(0xFFFF5252);
      case 'overweight':
        return const Color(0xFFFFAB40);
      case 'underweight':
        return const Color(0xFF40C4FF);
      default:
        return const Color(0xFF24D876);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.cardActive,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.08),
              ),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 18),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/bmi_logo.png',
              height: 36,
              width: 36,
            ),
            const SizedBox(width: 10),
            Text('YOUR RESULT', style: AppTextStyles.appBarTitle),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          final colorKey = controller.resultColorKey.value;
          final accentColor = _getResultColor(colorKey);

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      // Result header
                      _buildResultHeader(accentColor),
                      const SizedBox(height: 16),
                      // BMI Info card
                      _buildInfoCard(accentColor),
                      const SizedBox(height: 16),
                      // BMI Scale
                      _buildBmiScale(),
                    ],
                  ),
                ),
              ),
              GradientButton(
                title: 'RECALCULATE',
                onTap: () => Get.back(),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildResultHeader(Color accentColor) {
    return Column(
      children: [
        Text('Your Results', style: AppTextStyles.pageTitle),
        const SizedBox(height: 4),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            gradient: AppColors.brandGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(Color accentColor) {
    return GlassMorphicCard(
      isActive: true,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        children: [
          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: accentColor.withOpacity(0.4)),
            ),
            child: Text(
              controller.resultLabel.value.toUpperCase(),
              style: AppTextStyles.resultStatus.copyWith(color: accentColor),
            ),
          ),
          const SizedBox(height: 20),
          // BMI number with glow
          ShaderMask(
            shaderCallback: (bounds) => AppColors.brandGradient.createShader(bounds),
            child: Text(
              controller.bmiResult.value,
              style: AppTextStyles.bmiValue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Body Mass Index',
            style: AppTextStyles.label,
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.white.withOpacity(0.08)),
          const SizedBox(height: 20),
          // Interpretation
          Text(
            controller.interpretation.value,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText,
          ),
        ],
      ),
    );
  }

  Widget _buildBmiScale() {
    return GlassMorphicCard(
      isActive: false,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('BMI CATEGORIES', style: AppTextStyles.label),
          const SizedBox(height: 16),
          // Scale bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 10,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(color: const Color(0xFF40C4FF))),
                  Expanded(
                      flex: 3,
                      child: Container(color: const Color(0xFF24D876))),
                  Expanded(
                      flex: 2,
                      child: Container(color: const Color(0xFFFFAB40))),
                  Expanded(
                      flex: 2,
                      child: Container(color: const Color(0xFFFF5252))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _scaleLabel('Under', const Color(0xFF40C4FF)),
              _scaleLabel('Normal', const Color(0xFF24D876)),
              _scaleLabel('Over', const Color(0xFFFFAB40)),
              _scaleLabel('Obese', const Color(0xFFFF5252)),
            ],
          ),
          const SizedBox(height: 16),
          _categoryRow('Underweight', '< 18.5', const Color(0xFF40C4FF)),
          _categoryRow('Normal', '18.5 – 24.9', const Color(0xFF24D876)),
          _categoryRow('Overweight', '25 – 29.9', const Color(0xFFFFAB40)),
          _categoryRow('Obese', '≥ 30', const Color(0xFFFF5252)),
        ],
      ),
    );
  }

  Widget _scaleLabel(String text, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600),
    );
  }

  Widget _categoryRow(String label, String range, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(label,
                style: AppTextStyles.bodyText.copyWith(
                    color: Colors.white, fontSize: 13)),
          ),
          Text(range,
              style: AppTextStyles.bodyText
                  .copyWith(color: color, fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
