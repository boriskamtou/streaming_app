import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_app/src/core/shared/widgets/common_textformfield.dart';

import '../../../core/infrastructure/common_import.dart';
import '../../core/shared/widgets/skip_or_continue_buttons.dart';

class FillProfileScreen extends StatefulHookConsumerWidget {
  const FillProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FillProfileScreenState();
}

class _FillProfileScreenState extends ConsumerState<FillProfileScreen> {
  final _formkey = GlobalKey<FormState>();
  String _genderValue = 'Male';

  final _genderList = [
    'Male',
    'Female',
  ];
  @override
  Widget build(BuildContext context) {
    final _userNameController = useTextEditingController();
    final _nicknameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _phoneController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Your Profile'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: AppColors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/empty_pp.png'),
                    ),
                    Positioned(
                      right: 110,
                      bottom: 8,
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CommonTextFormField(
                  hintText: 'Full Name',
                  controller: _userNameController,
                ),
                const SizedBox(height: 15),
                CommonTextFormField(
                  hintText: 'Nickname',
                  controller: _nicknameController,
                ),
                const SizedBox(height: 15),
                CommonTextFormField(
                  hintText: 'Email',
                  controller: _emailController,
                  suffixIcon: Image.asset('assets/icons/user_email.png'),
                ),
                const SizedBox(height: 15),
                CommonTextFormField(
                  hintText: 'Phone Number',
                  controller: _phoneController,
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton(
                    value: _genderValue,
                    isExpanded: true,
                    hint: Text(
                      'Gender',
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                    icon: Image.asset('assets/icons/arrow_down.png'),
                    underline: const SizedBox.shrink(),
                    items: _genderList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _genderValue = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),
                SkipOrContinueButtons(
                  onSkipPressed: () {},
                  onContinuePressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
