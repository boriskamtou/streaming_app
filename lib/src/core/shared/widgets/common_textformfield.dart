import '../../infrastructure/common_import.dart';

class CommonTextFormField extends StatelessWidget {
  final String hintText;
  final String? intialValue;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool hasFocus;
  final FocusNode? focusNode;
  final String? Function(String?) validator;

  const CommonTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.validator,
    this.hasFocus = false,
    this.focusNode,
    this.intialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      validator: validator,
      initialValue: intialValue,
      style: GoogleFonts.urbanist(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        letterSpacing: .2,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        filled: hasFocus ? true : false,
        fillColor: hasFocus ? const Color.fromRGBO(226, 18, 33, 0.08) : null,
      ),
    );
  }
}
