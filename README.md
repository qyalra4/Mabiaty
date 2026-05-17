# دليل رفع تحديث مبيعاتي على GitHub

هذا المجلد يحتوي حزمة تحديث جاهزة لتجربة ميزة التحديث التلقائي داخل تطبيق سطح المكتب `مبيعاتي`.

## الملف المهم

ارفع أو استخدم الملف:

```text
Mabiaty_Update_v1.0.2.zip
```

## رابط التجربة المباشر

بعد رفع الملف إلى الفرع `main` يمكن وضع هذا الرابط داخل شاشة التحديثات في التطبيق:

```text
https://github.com/qyalra4/Mabiaty/raw/main/Mabiaty_Update_v1.0.2.zip
```

## طريقة GitHub Release الصحيحة

1. افتح مستودع GitHub:

   ```text
   https://github.com/qyalra4/Mabiaty
   ```

2. ادخل إلى `Releases`.
3. اضغط `Draft a new release`.
4. اكتب Tag:

   ```text
   v1.0.2
   ```

5. اكتب العنوان:

   ```text
   مبيعاتي v1.0.2
   ```

6. انسخ محتوى `GITHUB_RELEASE_BODY.md` داخل وصف الإصدار.
7. ارفع ملف:

   ```text
   Mabiaty_Update_v1.0.2.zip
   ```

8. اضغط `Publish release`.

## طريقة التجربة داخل التطبيق

1. افتح `مبيعاتي`.
2. ادخل إلى `الأدوات`.
3. افتح تبويب `التحديثات`.
4. ضع رابط المستودع:

   ```text
   https://github.com/qyalra4/Mabiaty
   ```

   أو رابط ZIP المباشر:

   ```text
   https://github.com/qyalra4/Mabiaty/raw/main/Mabiaty_Update_v1.0.2.zip
   ```

5. اضغط `فحص التحديث`.
6. اضغط `تحميل وتثبيت التحديث`.
7. ستظهر نافذة فك الضغط وتركيب التحديث.
8. بعد الاكتمال سيعاد فتح التطبيق.
9. عند أول فتح تظهر نافذة معلومات التحديث من ملف `read.md`.

## محتوى ZIP

الحزمة تحتوي ملفات التشغيل فقط:

- `SalesManager.exe`
- ملفات Qt DLL
- مجلد `assets`
- مجلد `styles`
- مجلدات Qt runtime مثل `platforms`, `sqldrivers`, `imageformats`
- ملف `read.md`

## ما لا يتم تضمينه

لا يتم تضمين:

- قواعد البيانات
- مجلد `data`
- ملفات PDF
- ملفات CMake
- مجلدات البناء الداخلية

## إعادة إنشاء الحزمة

من PowerShell داخل مجلد `SalesManager` شغل:

```powershell
.\release-updates\package-update.ps1
```

سينشئ:

```text
release-updates\Mabiaty_Update_v1.0.2.zip
```

