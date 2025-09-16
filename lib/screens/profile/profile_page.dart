import 'package:adaptix/adaptix.dart';
import 'package:elimde/widgets/gradient_button.dart';
import 'package:elimde/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/theme_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  String? _accessToken;

  @override
  void initState() {
    super.initState();
    _loadAccessToken();
  }

  Future<void> _loadAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _accessToken = prefs.getString("access_token"); // null if not saved
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppLocalizations.of(context)!;
    final surface = theme.colorScheme.surface;
    final outline = theme.colorScheme.outlineVariant;

    var maskFormatter = new MaskTextInputFormatter(
        mask: '+993 (##) ##-##-##',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.adaptedPx(context)),
              child: Column(
                children: [
                  SizedBox(height: 12.adaptedPx(context)),

                  if (_accessToken != null && _accessToken!.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        color: surface,
                        border: Border.all(color: outline, width: 0.5.adaptedPx(context)),
                        borderRadius: BorderRadius.circular(8.adaptedPx(context)),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person_outline)),
                        title: Text(s.userInformation),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${s.email}: john.doe@example.com'),
                            Text('${s.phone}: +1 555 123 4567'),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_outlined),
                          tooltip: s.editProfile,
                        ),
                      ),
                    ),

                  if (_accessToken == null || _accessToken!.isEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.adaptedPx(context),
                        vertical: 12.adaptedPx(context),
                      ),
                      decoration: BoxDecoration(
                        color: surface,
                        border: Border.all(color: outline, width: 0.5.adaptedPx(context)),
                        borderRadius: BorderRadius.circular(8.adaptedPx(context)),
                      ),
                      child: Column(
                        children: [
                          Text(s.quickSignIn, textAlign: TextAlign.center),
                          SizedBox(height: 12.adaptedPx(context)),
                          CustomTextField(
                            maskFormatter: maskFormatter,
                            hintText: "+993 (XX) XX-XX-XX",
                            controller: controller,
                            prefixIcon: const Icon(Icons.phone_android_sharp),
                          ),
                          SizedBox(height: 12.adaptedPx(context)),
                          SizedBox(
                            width: double.infinity,
                            child: GradientButton(
                              onPressed: () {},
                              child: Text(s.login),
                            ),
                          ),
                        ],
                      ),
                    ),

                  SizedBox(height: 8.adaptedPx(context)),

                  if (_accessToken != null && _accessToken!.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        color: surface,
                        border: Border.all(color: outline, width: 0.5.adaptedPx(context)),
                        borderRadius: BorderRadius.circular(8.adaptedPx(context)),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.receipt_long_outlined),
                            title: Text(s.orders),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.location_on_outlined),
                            title: Text(s.addresses),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.payment_outlined),
                            title: Text(s.paymentMethods),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  if (_accessToken != null && _accessToken!.isNotEmpty)
                    SizedBox(height: 8.adaptedPx(context)),

                  Container(
                    decoration: BoxDecoration(
                      color: surface,
                      border: Border.all(color: outline, width: 0.5.adaptedPx(context)),
                      borderRadius: BorderRadius.circular(8.adaptedPx(context)),
                    ),
                    child: Column(
                      children: [
                        Consumer<ThemeProvider>(
                          builder: (context, themeProvider, _) => ListTile(
                            leading: const Icon(Icons.dark_mode_outlined),
                            title: Text(s.darkMode),
                            onTap: () => _showThemeDialog(context, themeProvider),
                          ),
                        ),
                        Consumer<ThemeProvider>(
                          builder: (context, themeProvider, _) => ListTile(
                            leading: const Icon(Icons.language_outlined),
                            title: Text(s.languageSetting),
                            onTap: () => _showLanguageDialog(context, themeProvider),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.privacy_tip_outlined),
                          title: Text(s.privacy),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.help_outline),
                          title: Text(s.helpSupport),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 8.adaptedPx(context)),

                  if (_accessToken != null && _accessToken!.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        color: surface,
                        border: Border.all(color: outline, width: 0.5.adaptedPx(context)),
                        borderRadius: BorderRadius.circular(8.adaptedPx(context)),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: Text(
                          s.logout,
                          style: const TextStyle(color: Colors.red),
                        ),
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove("access_token");
                          setState(() {
                            _accessToken = null;
                          });
                        },
                      ),
                    ),

                  SizedBox(height: 20.adaptedPx(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showThemeDialog(BuildContext context, ThemeProvider themeProvider) async {
    final s = AppLocalizations.of(context)!;
    final selected = await showDialog<ThemeMode>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: Text(s.theme),
        children: [
          RadioListTile<ThemeMode>(
            title: Text(s.system),
            value: ThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: (val) => Navigator.of(ctx).pop(val),
          ),
          RadioListTile<ThemeMode>(
            title: Text(s.light),
            value: ThemeMode.light,
            groupValue: themeProvider.themeMode,
            onChanged: (val) => Navigator.of(ctx).pop(val),
          ),
          RadioListTile<ThemeMode>(
            title: Text(s.dark),
            value: ThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: (val) => Navigator.of(ctx).pop(val),
          ),
        ],
      ),
    );
    if (selected != null) {
      themeProvider.setThemeMode(selected);
    }
  }

  void _showLanguageDialog(BuildContext context, ThemeProvider themeProvider) async {
    final s = AppLocalizations.of(context)!;
    final selected = await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: Text(s.languageSetting),
        children: [
          RadioListTile<String>(
            title: Text("🇹🇲 ${s.turkmen}"),
            value: 'tk',
            groupValue: themeProvider.locale?.languageCode ?? 'system',
            onChanged: (val) => Navigator.of(ctx).pop(val),
          ),
          RadioListTile<String>(
            title: Text("🇷🇺 ${s.russian}"),
            value: 'ru',
            groupValue: themeProvider.locale?.languageCode ?? 'system',
            onChanged: (val) => Navigator.of(ctx).pop(val),
          ),
          RadioListTile<String>(
            title: Text("🇺🇸 ${s.english}"),
            value: 'en',
            groupValue: themeProvider.locale?.languageCode ?? 'system',
            onChanged: (val) => Navigator.of(ctx).pop(val),
          ),
          RadioListTile<String>(
            title: Text("🇹🇷 ${s.turkish}"),
            value: 'tr',
            groupValue: themeProvider.locale?.languageCode ?? 'system',
            onChanged: (val) => Navigator.of(ctx).pop(val),
          ),
        ],
      ),
    );
    if (selected != null) {
      if (selected == 'system') {
        themeProvider.setLocale(null);
      } else {
        themeProvider.setLocale(Locale(selected));
      }
    }
  }
}
