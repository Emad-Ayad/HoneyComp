import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const routeName = 'settings_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).settings, backButtonVisibility: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).chooseLanguage, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<LocaleCubit>().changeLocale('ar');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.locale.languageCode == 'ar' ? Colors.amber : Colors.grey,
                      ),
                      child: Text(S.of(context).arabic, style: const TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LocaleCubit>().changeLocale('en');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.locale.languageCode == 'en' ? Colors.amber : Colors.grey,
                      ),
                      child: Text(S.of(context).english, style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
