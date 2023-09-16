import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/hotel/presentation/widgets/widgets.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({super.key});

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;

  late final AnimationController _animationController;
  final controller = ExpansionTileController();

  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  late final Animation<double> _iconTurns;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
  }

  Widget _buildIcon(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: _toggleExpansion,
      child: SemiTransperantButton(
        buttonColor: CustomColors.lightBlue,
        child: RotationTransition(
          turns: _iconTurns,
          child: Icon(
            Icons.expand_more,
            size: 24.sp,
            color: CustomColors.blue,
          ),
        ),
      ),
    );
  }

  void _toggleExpansion() {
    controller.isExpanded ? controller.collapse() : controller.expand();
    setState(() {
      if (controller.isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ExpansionTile(
          controller: controller,
          trailing: _buildIcon(
            context,
          ),
          collapsedShape: InputBorder.none,
          shape: InputBorder.none,
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          title: Text(
            'Первый турист ',
            style: CustomStyles.sfProMedium.copyWith(
              color: Colors.black,
              fontSize: 22.sp,
            ),
          ),
          children: [
            const CustomTextField(labelText: 'Имя'),
            SizedBox(
              height: 10.sp,
            ),
            const CustomTextField(labelText: 'Фамилия'),
            SizedBox(
              height: 10.sp,
            ),
            const CustomTextField(labelText: 'Дата рождения'),
            SizedBox(
              height: 10.sp,
            ),
            const CustomTextField(labelText: 'Гражданство'),
            SizedBox(
              height: 10.sp,
            ),
            const CustomTextField(labelText: 'Номер загранпаспорта'),
            SizedBox(
              height: 10.sp,
            ),
            const CustomTextField(labelText: 'Срок действия загранпаспорта'),
            SizedBox(
              height: 10.sp,
            ),
          ],
        ),
      ),
    );
  }
}
