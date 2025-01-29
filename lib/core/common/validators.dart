import 'package:intl/intl.dart';
import 'package:pfm_ekyc/core/common/meta_strings.dart';

import 'adhaar_validator.dart';

class Validators {
  Validators._();

  // Function: validateEmail
  // Description: Validates an email address
  // Parameters:
  //  - email: The email address to validate
  // Returns:
  //  - true if the email is valid, false otherwise
  static bool _validateEmail(String email) {
    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return emailExp.hasMatch(email);
  }

  // Function: validateDrivingLicense
  // Description: Validates a driving license number
  // Parameters:
  //  - drivingLicense: The driving license number to validate
  // Returns:
  //  - true if the driving license number is valid, false otherwise
  static bool _validateDrivingLicense(String drivingLicense) {
    RegExp drivingLicenseExp = RegExp(
        r"^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$");
    return drivingLicenseExp.hasMatch(drivingLicense);
  }

  // Function: validatePassport
  // Description: Validates a passport number
  // Parameters:
  //  - passport: The passport number to validate
  // Returns:
  //  - true if the passport number is valid, false otherwise
  static bool _validatePassport(String passport) {
    RegExp passportExp = RegExp(r"^[A-PR-WYa-pr-wy][1-9]\d\s?\d{4}[1-9]$");
    return passportExp.hasMatch(passport);
  }

  // Function: validateVoterId
  // Description: Validates a voter ID number
  // Parameters:
  //  - voterId: The voter ID number to validate
  // Returns:
  //  - true if the voter ID number is valid, false otherwise
  static bool _validateVoterId(String voterId) {
    RegExp voterIdExp = RegExp(r"^[A-Z]{3}[0-9]{7}$");
    return voterIdExp.hasMatch(voterId);
  }

  //Function: validateMobileNumber
  //Description: Validates a mobile number
  //Parameters:
  // - mobileNumber: The mobile number to validate
  //Returns:
  // - true if the mobile number is valid, false otherwise
  static bool _validateMobileNumber(String mobileNumber) {
    RegExp mobileNumberExp = RegExp(r"^[0-9]{10}$");
    return mobileNumberExp.hasMatch(mobileNumber);
  }

  //Function: validatePanNumber
  //Description: Validates a pan number
  //Parameters:
  // - panNumber: The pan number to validate
  //Returns:
  // - true if the pan number is valid, false otherwise
  static bool _validatePanNumber(String panNumber) {
    //regex for validating pan number without considering the case
    RegExp panNumberExp = RegExp(r"^[A-Z]{5}[0-9]{4}[A-Z]$");
    return panNumberExp.hasMatch(panNumber);
  }

  //Function: validatePinCode
  //Description: Validates a pin code
  //Parameters:
  // - pinCode: The pin code to validate
  //Returns:
  // - true if the pin code is valid, false otherwise
  static bool _validatePinCode(String pinCode) {
    RegExp pinCodeExp = RegExp(r"^[0-9]{6}$");
    return pinCodeExp.hasMatch(pinCode);
  }

  //Function: validateIFSCCode
  //Description: Validates an IFSCCode for Indian bank accounts
  //Parameters:
  // - ifscCode: The IFSCCode to validate
  //Returns:
  // - true if the IFSCCode is valid, false otherwise
  static bool _validateIFSCCode(String ifscCode) {
    RegExp ifscCodeExp = RegExp(r"^[A-Za-z]{4}[a-zA-Z0-9]{7}$");
    return ifscCodeExp.hasMatch(ifscCode);
  }

  //Function: validateBankAccountNumber
  //Description: Validates a bank account number
  //Parameters:
  // - bankAccountNumber: The bank account number to validate
  //Returns:
  // - true if the bank account number is valid, false otherwise
  static bool _validateBankAccountNumber(String bankAccountNumber) {
    RegExp bankAccountNumberExp = RegExp(r"^[0-9]{9,18}$");
    return bankAccountNumberExp.hasMatch(bankAccountNumber);
  }

  //Function: validateDateOfBirth
  //Description: Validates a date of birth
  //Parameters:
  // - dateOfBirth: The date of birth to validate
  //Returns:
  // - true if the date of birth is valid, false otherwise
  static bool _validateDateOfBirth(String dateOfBirth) {
    RegExp dateOfBirthExp = RegExp(r"^[0-9]{2}[-][0-9]{2}[-][0-9]{4}$");
    return dateOfBirthExp.hasMatch(dateOfBirth);
  }

  static bool _validateAadhaarNumber(String aadhaarNumber) {
    return AadhaarValidator.validate(aadhaarNumber);
  }

  //A function that validates email addresses and returns a nullable string
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return ValidatorStrings.emptyEmailIDField;
    }

    if (!_validateEmail(email)) {
      return ValidatorStrings.invalidEmailIDField;
    }
    return null;
  }

  //A function that validates mobile numbers and returns a nullable string
  static String? validateMobileNumber(String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.isEmpty) {
      return ValidatorStrings.emptyMobileNumberField;
    }

    if (!_validateMobileNumber(mobileNumber)) {
      return ValidatorStrings.invalidMobileNumberField;
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.trim() == "") {
      return ValidatorStrings.emptyOtpField;
    }
    if (value.toString().trim().length != 6) {
      return ValidatorStrings.invalidOtpField;
    }

    return null;
  }

  //A function that validates pan numbers and returns a nullable string
  static String? validatePanNumber(String? panNumber) {
    if (panNumber == null || panNumber.isEmpty) {
      return ValidatorStrings.emptyPanNumberField;
    }

    if (!_validatePanNumber(panNumber)) {
      return ValidatorStrings.invalidPanNumberField;
    }
    return null;
  }

  //A function that validates pin codes and returns a nullable string
  static String? validatePinCode(String? pinCode) {
    if (pinCode == null || pinCode.isEmpty) {
      return ValidatorStrings.emptyPinCodeField;
    }

    if (!_validatePinCode(pinCode)) {
      return ValidatorStrings.invalidPinCodeField;
    }
    return null;
  }

  //A function that validates IFSCCodes and returns a nullable string
  static String? validateIFSCCode(String? ifscCode) {
    if (ifscCode == null || ifscCode.isEmpty) {
      return ValidatorStrings.emptyIFSCCodeField;
    }

    if (!_validateIFSCCode(ifscCode)) {
      return ValidatorStrings.invalidIFSCCodeField;
    }
    return null;
  }

  //A function that validates bank account numbers and returns a nullable string
  static String? validateBankAccountNumber(String? bankAccountNumber) {
    if (bankAccountNumber == null || bankAccountNumber.isEmpty) {
      return ValidatorStrings.emptyBankAccountNumberField;
    }

    if (!_validateBankAccountNumber(bankAccountNumber)) {
      return ValidatorStrings.invalidBankAccountNumberField;
    }
    return null;
  }

  //A function that validates date of birth and returns a nullable string
  static String? validateDateOfBirth(String? dateOfBirth) {
    if (dateOfBirth == null || dateOfBirth.isEmpty) {
      return ValidatorStrings.emptyDateOfBirthField;
    }

    if (!_validateDateOfBirth(dateOfBirth)) {
      return ValidatorStrings.invalidDateOfBirthField;
    }
    return null;
  }

  // A function that takes in Validator String and a value and returns a nullable string
  static String? validateEmptyField(String? validatorString, String? value) {
    if (value == null || value.trim().isEmpty) {
      return validatorString;
    }
    if (value.length < 2) {
      return 'should be more than 1 character';
    }
    return null;
  }

  static String? validateAddressField(String? value) {
    value = value?.trim();
    if (value == null || value.trim().isEmpty) {
      return ValidatorStrings.emptyAddressField;
    }
    if (value.length < 10) {
      return ValidatorStrings.minAddressLength;
    }
    if (value.length > 100) {
      return ValidatorStrings.maxAddressLength;
    }
    return null;
  }

  static String? validateNomineePercentage(String? nomineePercentage) {
    if (nomineePercentage == null || nomineePercentage.isEmpty) {
      return ValidatorStrings.emptyPercentageField;
    }
    if (double.parse(nomineePercentage) > 100 ||
        double.parse(nomineePercentage) <= 0) {
      return ValidatorStrings.invalidPercentageField;
    }
    return null;
  }

  //A function that validates aadhaar numbers and returns a nullable string
  static String? validateAadhaarNumber(String? aadhaarNumber) {
    if (aadhaarNumber == null || aadhaarNumber.isEmpty) {
      return ValidatorStrings.emptyAadhaarNumberField;
    }

    if (!_validateAadhaarNumber(aadhaarNumber)) {
      return ValidatorStrings.invalidAadharNumberField;
    }
    return null;
  }

  //A function that validates driving license numbers and returns a nullable string
  static String? validateDrivingLicenseNumber(String? drivingLicenseNumber) {
    if (drivingLicenseNumber == null || drivingLicenseNumber.isEmpty) {
      return ValidatorStrings.emptyDrivingLicenseNumberField;
    }

    if (!_validateDrivingLicense(drivingLicenseNumber)) {
      return ValidatorStrings.invalidDrivingLicenseNumberField;
    }
    return null;
  }

  //A function that validates passport numbers and returns a nullable string
  static String? validatePassportNumber(String? passportNumber) {
    if (passportNumber == null || passportNumber.isEmpty) {
      return ValidatorStrings.emptyPassportNumberField;
    }

    if (!_validatePassport(passportNumber)) {
      return ValidatorStrings.invalidPassportNumberField;
    }
    return null;
  }

  //A function that validates voter id numbers and returns a nullable string
  static String? validateVoterIDNumber(String? voterIDNumber) {
    if (voterIDNumber == null || voterIDNumber.isEmpty) {
      return ValidatorStrings.emptyVoterIDNumberField;
    }

    if (!_validateVoterId(voterIDNumber)) {
      return ValidatorStrings.invalidVoterIDNumberField;
    }
    return null;
  }

  static String? dobValidator(String value, {bool shouldBeAdult = false}) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy');
    final String formatted = formatter.format(now);
    String str1 = value;
    List<String> str2 = str1.split('-');
    String day = str2.isNotEmpty ? str2[0] : '';
    String month = str2.length > 1 ? str2[1] : '';
    String year = str2.length > 2 ? str2[2] : '';
    if (value.isEmpty) {
      return 'Please enter your date of birth';
    } else if (value.length != 10) {
      return "Please enter valid date";
    } else if (int.parse(day) > 31) {
      return 'Month is invalid';
    } else if (int.parse(month) > 12) {
      return 'Day is invalid';
    } else if ((int.parse(year) > int.parse(formatted))) {
      return 'Year is invalid';
    } else if ((int.parse(year) < 1920)) {
      return 'Year is invalid';
    } else if (shouldBeAdult && (int.parse(formatted) - int.parse(year) < 18)) {
      return 'Age should be greater than 18';
    }
    // if its today's date then its invalid
    else if (int.parse(day) >= now.day &&
        int.parse(month) >= now.month &&
        int.parse(year) >= now.year) {
      return 'Please enter valid date';
    }
    return null;
  }

//   static String? issueExpiryDateValidator(String value,
//       {
//         String? emptyMessage,
//         required bool isIssueDate}) {
//     final DateTime now = DateTime.now();
//     final DateFormat formatter = DateFormat('yyyy');
//     final String formatted = formatter.format(now);
//     String str1 = value;
//     List<String> str2 = str1.split('-');
//     String day = str2.isNotEmpty ? str2[0] : '';
//     String month = str2.length > 1 ? str2[1] : '';
//     String year = str2.length > 2 ? str2[2] : '';
//     if (value.isEmpty) {
//       return emptyMessage ?? "Please enter valid date";
//     } else if (value.length != 10) {
//       return "Please enter valid date";
//     } else if (int.parse(day) > 31) {
//       return 'Month is invalid';
//     } else if (int.parse(month) > 12) {
//       return 'Day is invalid';
//     } else if (int.parse(year) > int.parse(formatted)) {
//       return null;
//   }
// }
}
