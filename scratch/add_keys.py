import json

ar_file = 'lib/l10n/intl_ar.arb'
en_file = 'lib/l10n/intl_en.arb'

with open(ar_file, 'r', encoding='utf-8') as f:
    ar_data = json.load(f)
with open(en_file, 'r', encoding='utf-8') as f:
    en_data = json.load(f)

ar_data['chooseLanguage'] = 'تغيير اللغة'
ar_data['arabic'] = 'العربية'
ar_data['english'] = 'English'

en_data['chooseLanguage'] = 'Choose Language'
en_data['arabic'] = 'Arabic'
en_data['english'] = 'English'

with open(ar_file, 'w', encoding='utf-8') as f:
    json.dump(ar_data, f, ensure_ascii=False, indent=2)
with open(en_file, 'w', encoding='utf-8') as f:
    json.dump(en_data, f, ensure_ascii=False, indent=2)

print('Done')