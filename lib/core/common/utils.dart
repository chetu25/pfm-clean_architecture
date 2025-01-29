// import 'dart:io';
// import 'dart:math';
// import 'dart:developer' as dev;

// import 'package:dartz/dartz.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../data/data_sources/local/token_local_data_source.dart';
// import '../di/get_it.dart';
// import '../domain/entities/app_error.dart';
// import '../domain/entities/enums.dart';
// import '../flavors.dart';
// import '../gen/assets.gen.dart';
// import '../presentation/theme/app_colors.dart';
// import 'common.dart';
// import '../gen/assets.gen.dart';
// import '../presentation/theme/app_colors.dart';
// import 'custom_styles.dart';

// class Utils {
//   Utils._();

//   static String getErrorMessage(
//       {required String? msg, required AppErrorType errorType}) {
//     if (msg != null && msg.isNotEmpty) {
//       return msg;
//     }
//     switch (errorType) {
//       case AppErrorType.api:
//         return "Something Went Wrong! Try again later";

//       case AppErrorType.network:
//         return "No Internet Connection!";

//       case AppErrorType.timeout:
//         return "Server seems to be not responding!";

//       case AppErrorType.database:
//         return "Something went wrong!";
//     }
//   }

//   static Future<File?> pickImage(ImageSource imageSource) async {
//     final ImagePicker picker = ImagePicker();
//     XFile? image = await picker.pickImage(
//         source: imageSource,
//         preferredCameraDevice: CameraDevice.rear,
//         imageQuality: 10);
//     if (image == null) {
//       return null;
//     }
//     return File(image.path);
//   }

//   static Future<Either<AppError, File>> fileFromUrl(String url) async {
//     try {
//       final Response response = await getIt<Dio>().get<List<int>>(
//         '${F.baseUrl}/$url',
//         options: Options(
//           responseType: ResponseType.bytes,
//         ),
//       );
//       final Directory tempDir = await getTemporaryDirectory();
//       final String fileName = url.split('/').last;
//       final File file = File('${tempDir.path}/$fileName');
//       await file.writeAsBytes(response.data as List<int>);
//       return Right(file);
//     } on DioError catch (e) {
//       return Left(AppError(AppErrorType.api, error: e.message));
//     }
//   }

//   static Future<bool> isValidFileSize(File file, int maxSizeInMB) async =>
//       !(await file.length() > maxSizeInMB * pow(10, 6));

//   static String getDGString(MetalType metalType) {
//     switch (metalType) {
//       case MetalType.gold:
//         return "Digital Gold";
//       case MetalType.silver:
//         return "Digital Silver";
//     }
//   }

//   static DateTime getNextSipDate(int selectedDate) {
//     //First Installment will be today
//     DateTime firstInstallment = Jiffy.now().dateTime;
//     DateTime selectedDateObj =
//         DateTime(firstInstallment.year, firstInstallment.month, selectedDate);
//     //If the next installment is less than 30 days for next month, add 60 more days and it be next to next month
//     if (selectedDate < DateTime.now().day) {
//       return Jiffy.parseFromDateTime(selectedDateObj).add(months: 2).dateTime;
//     } else {
//       return Jiffy.parseFromDateTime(selectedDateObj).add(months: 1).dateTime;
//     }
//   }

//   static DateTime getNextStpSwpDate(int selectedDate) {
//     DateTime firstInstallment = Jiffy.now().dateTime;
//     DateTime selectedDateObj =
//         DateTime(firstInstallment.year, firstInstallment.month, selectedDate);
//     //If the next installment date is before today, add 1 month and it be next to next month

//     if (selectedDate < DateTime.now().day) {
//       return Jiffy.parseFromDateTime(selectedDateObj).add(months: 1).dateTime;
//     } else {
//       return selectedDateObj;
//     }
//   }

//   static String suffixText(int i) {
//     int j = i % 10;
//     int k = i % 100;
//     if (j == 1 && k != 11) {
//       return "${i}st";
//     }
//     if (j == 2 && k != 12) {
//       return "${i}nd";
//     }
//     if (j == 3 && k != 13) {
//       return "${i}rd";
//     }
//     return "${i}th";
//   }

//   static String durationString(int duration) {
//     final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, "0");
//     final seconds = (duration % 60).floor().toString().padLeft(2, "0");
//     return "$minutes:$seconds";
//   }

//   static void showSuccessSnackbar({
//     required BuildContext context,
//     required String message,
//     SnackBarAction? action,
//     Duration? duration,
//   }) {
//     final materialBanner = SnackBar(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//       ),
//       content: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Assets.gifs.addedToCart.image(
//             width: 50,
//             height: 50,
//           ),
//           const Gap(8),
//           Text(
//             message,
//             style: TextStyle(
//               color: AppColors.neutral[300],
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//       action: action,
//       elevation: 0,
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//         side: BorderSide(
//           color: AppColors.primary[50]!,
//           width: 1,
//         ),
//       ),
//       behavior: SnackBarBehavior.floating,
//       duration: duration ?? const Duration(milliseconds: 2500),
//     );
//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(materialBanner);
//   }

//   static void showSuccessAlert(BuildContext context, String message,
//       {String? title, Widget? child, int? duration}) {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           Future.delayed(Duration(seconds: duration ?? 3), () {
//             Navigator.of(context).pop(); // Close the dialog
//           });
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             icon: Assets.pngs.alertApproved.image(width: 75, height: 75),
//             title: Text(
//               title ?? 'Success',
//               style:
//                   baseTextStyle14500.copyWith(color: AppColors.textLightGrey),
//             ), //this right here
//             content: Text(
//               message,
//               textAlign: TextAlign.center,
//               style: baseTextStyle12400.copyWith(color: AppColors.textGrey),
//             ),
//             actions: [
//               child ?? const SizedBox(),
//             ],
//             actionsPadding: const EdgeInsets.all(16),
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
//           );
//         });
//   }

//   static void showWarningAlert(BuildContext context, String message,
//       {String? title, Widget? child}) {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           child == null
//               ? Future.delayed(const Duration(seconds: 3), () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 })
//               : null;
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             icon: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Assets.pngs.alertWarning.image(width: 75, height: 75),
//                 Align(
//                     alignment: Alignment.topLeft,
//                     child: IconButton(
//                         onPressed: () {}, icon: const Icon(Icons.close)))
//               ],
//             ),
//             insetPadding: const EdgeInsets.all(50),
//             title: Text(
//               title ?? 'Warning',
//               style:
//                   baseTextStyle14500.copyWith(color: AppColors.textLightGrey),
//             ), //this right here
//             content: Text(
//               message,
//               textAlign: TextAlign.center,
//               style: baseTextStyle12400.copyWith(color: AppColors.textGrey),
//             ),
//             actions: [
//               child ?? const SizedBox(),
//             ],
//             actionsPadding: const EdgeInsets.all(16),
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
//           );
//         });
//   }

//   static void showErrorAlert(
//     BuildContext context,
//     String message, {
//     String? title,
//     Widget? child,
//     int? duration,
//     bool barrierDismissible = false,
//   }) {
//     showDialog(
//         context: context,
//         barrierDismissible: barrierDismissible,
//         builder: (BuildContext context) {
//           Future.delayed(Duration(seconds: duration ?? 3), () {
//             Navigator.of(context).pop(); // Close the dialog
//           });
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             icon: Assets.pngs.alertError.image(width: 75, height: 75),
//             title: Text(
//               title ?? 'Error',
//               style:
//                   baseTextStyle14500.copyWith(color: AppColors.textLightGrey),
//             ), //this right here
//             content: Text(
//               message,
//               textAlign: TextAlign.center,
//               style: baseTextStyle12400.copyWith(color: AppColors.textGrey),
//             ),
//             actions: [
//               child ?? const SizedBox(),
//             ],
//             actionsPadding: const EdgeInsets.all(16),
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
//           );
//         });
//   }

//   static void downloadFile({
//     required String url,
//     required BuildContext context,
//     required String fileName,
//     String? downloadSuccessMsg,
//   }) async {
//     final status = await Permission.storage.request();
//     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

//     late AndroidDeviceInfo androidInfo;
//     if (Platform.isAndroid) {
//       androidInfo = await deviceInfoPlugin.androidInfo;
//     }
//     if (kDebugMode) {
//       print("STATUS $status");
//     }

//     if (status.isGranted ||
//         // since Android 13 can allow to download without permission for PDF's
//         (Platform.isAndroid && int.parse(androidInfo.version.release) >= 13)) {
//       final externalDirPath = Platform.isAndroid
//           ? (await getExternalStorageDirectory())!.path
//           : (await getApplicationDocumentsDirectory()).absolute.path;

//       await FlutterDownloader.enqueue(
//         url: url,
//         savedDir: externalDirPath,
//         headers: {
//           'Authorization':
//               'Bearer ${await getIt<TokenLocalDataSource>().getAccessToken()}',
//         },
//         showNotification: true,
//         openFileFromNotification: true,
//         fileName: fileName,
//         saveInPublicStorage: true,
//       ).catchError((e) {
//         dev.log("ERROR $e");
//       }).whenComplete(
//         () => showSuccessAlert(
//             context,
//             downloadSuccessMsg ??
//                 'Downloaded Successfully to ${Platform.isIOS ? externalDirPath : 'your Downloads folder'}'),
//       );
//       //FlutterDownloader.open(taskId: taskId!);
//     } else {
//       if (context.mounted) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Permission Denied'),
//             content: const Text(
//                 'Please grant storage permission to download invoice'),
//             actions: [
//               TextButton(
//                 child: const Text('OK'),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }

//   static String compactCurrency(double amount) {
//     /// This is a hack to fix the issue of K instead of T in thousands
//     return NumberFormat.compactCurrency(
//       decimalDigits: 2,
//       symbol: '\u20B9 ',
//       locale: 'en_IN',
//     ).format(amount).replaceAll('T', 'K');
//   }

//   static DateTime formatStringToDate(String date) {
//     return DateTime(
//       int.parse(date.substring(6, 10)),
//       int.parse(date.substring(3, 5)),
//       int.parse(date.substring(0, 2)),
//     );
//   }

//   static String compactCurrencyWithoutSymbol(double amount) {
//     /// This is a hack to fix the issue of K instead of T in thousands
//     return NumberFormat.compactCurrency(
//       decimalDigits: 2,
//       symbol: '',
//       locale: 'en_IN',
//     ).format(amount).replaceAll('T', 'K');
//   }

//   static String dateTime(int date) {
//     int milliseconds = date * 1000;
//     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
//     String formattedDate =
//         "${_getMonth(dateTime.month)} ${dateTime.day}, ${dateTime.year}";
//     return formattedDate;
//   }

//   static String _getMonth(int month) {
//     switch (month) {
//       case 1:
//         return "Jan";
//       case 2:
//         return "Feb";
//       case 3:
//         return "Mar";
//       case 4:
//         return "Apr";
//       case 5:
//         return "May";
//       case 6:
//         return "Jun";
//       case 7:
//         return "Jul";
//       case 8:
//         return "Aug";
//       case 9:
//         return "Sep";
//       case 10:
//         return "Oct";
//       case 11:
//         return "Nov";
//       case 12:
//         return "Dec";
//       default:
//         return "";
//     }
//   }

//   static double mapRange(double value, double minInput, double maxInput,
//       double minOutput, double maxOutput) {
//     value = value.clamp(minInput, maxInput);
//     double normalizedValue = (value - minInput) / (maxInput - minInput);
//     double mappedValue = minOutput + (maxOutput - minOutput) * normalizedValue;

//     return mappedValue;
//   }
// }
