import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';

class RoundButton extends StatefulWidget {
  const RoundButton({
    super.key,
    this.buttonColor = AppColors.blackColor,
    this.textColor = AppColors.whiteColor,
    required this.title,
    required this.onpress,
    this.width = 60,
    this.height = 50,
    this.loading = false,
  });

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onpress;
  final Color textColor, buttonColor;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: widget.loading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              )),
      ),
    );
  }
}
