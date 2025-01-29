class AppStrings {
  const AppStrings._();

  static const String completeKycMessage =
      "Hey, you have not completed your KYC,As per the government regulations, you cannot invest without completing the KYC.Click below to continue from where you left off. ";

  static const String kycUnderReviewMessage =
      "Hey,Congrats on successfully completing your KYC onboarding. We are currently reviewing your application & well get back with an update in next 2 - 3 days";

  static const String kycApprovedMessage =
      "Hey, Congratulations!! Your KYC applications has been successfully verified. Check out our most popular funds below";

  static const String kycRejectedMessage =
      "Hey, Your KYC has been rejected, click below to know what could be the reason for the rejection";

  static const String digitalGoldDisclaimerText =
      "Neosurge is deposit accepting Non-Banking Financial Institution and has a platform purely for the convenience of its Customers to display/communicate offers extended by Augmont to Neosurge's Customers. Neosurge is not selling/rendering any of these products/services. Neosurge does not act as express or implied agent of the Augmont/the owners of the products vis-a-vis the Customers.Neosurge is neither guaranteeing nor giving any warranty nor making any representation with respect to the offers made by the Augmont. The products/services are being offered solely by Augmont and Neosurge is not responsible for sale/quality/features of the products/services under the offer. Neosurge is neither endorsing Augmont or any product/service of the Augmont. Neosurge is not undertaking the business of on-line retail trading or shopping by hosting the offers on its platform. If the Customer proceeds from here, he/she will be redirected to the Augmont's Website. Any Information on the Augmont's Website (or the section thereof to which the Customer will be directed) whether about the Augmont or the products/services being offered have not been verified by Neosurge. Neosurge shall not be liable or responsible for any such information. Neosurge will not bear any obligation or liability if a Customer purchases/avails of a product/services under an offer. If the Customer chooses to avail of the purchase/avail of a product/services, Neosurge will neither be a party to nor in any manner concemed with such purchase/availment nor be liable or responsible for any act or omission of the Augmont or the Customer. All products/services related queries/complaints will be addressed by Augmont only";
}

class ValidatorStrings {
  const ValidatorStrings._();

  //TextField Validator Strings
  static String? invalidFullNameField = 'Please enter a valid full name';
  static const String emptyEmailIDField = 'Please enter your email address';
  static const String invalidEmailIDField =
      'Please enter a valid email address';

  static const String emptyFullNameField = 'Please enter your full name';
  static const String emptyAddressField = 'Please enter your address';
  static const String minAddressLength =
      'Address should contain minimum of 10 characters';
  static const String maxAddressLength =
      'Address should contain maximum of 100 characters';

  static const String emptyEmailOTPField =
      'Please enter the OTP sent to your email';
  static const String emptyMobileOTPField =
      'Please enter the OTP sent to your mobile';
  static const String invalidOTPEntered = 'Invalid OTP entered';

  static const String emptyMobileNumberField =
      'Please enter your mobile number';
  static const String invalidMobileNumberField =
      'Please enter a valid mobile number';

  static const String emptyPanNumberField = 'Please enter your PAN number';
  static const String invalidPanNumberField = 'Please enter a valid PAN number';

  static const String emptyPinCodeField = 'Please enter your pin code';
  static const String invalidPinCodeField = 'Please enter a valid pin code';

  static const String emptyIFSCCodeField = 'Please enter your IFSCCode';
  static const String invalidIFSCCodeField = 'Please enter a valid IFSCCode';

  static const String emptyAccountHolderNameField =
      'Please enter account holder\'s name';

  static const String emptyBankAccountNumberField =
      'Please enter your Bank Account Number';
  static const String invalidBankAccountNumberField =
      'Please enter a valid Bank Account Number';

  static const String emptyDateOfBirthField = 'Please enter your Date of Birth';
  static const String invalidDateOfBirthField =
      'Please enter a valid Date of Birth';

  static const String emptyAadhaarNumberField =
      'Please enter your Aadhar Number';
  static const String invalidAadharNumberField =
      'Please enter a valid Aadhar Number';

  static const String emptyOtpField = "Enter valid OTP";
  static const String invalidOtpField = "The OTP must be 6 digits";

  //Driving License Validator Strings
  static const String emptyDrivingLicenseNumberField =
      'Please enter your Driving License Number';
  static const String invalidDrivingLicenseNumberField =
      'Please enter a valid Driving License Number';

  //Passport Validator Strings
  static const String emptyPassportNumberField =
      'Please enter your Passport Number';
  static const String invalidPassportNumberField =
      'Please enter a valid Passport Number';

  //Voter ID Validator Strings
  static const String emptyVoterIDNumberField =
      'Please enter your Voter ID Number';
  static const String invalidVoterIDNumberField =
      'Please enter a valid Voter ID Number';

  static const String emptyFathersNameField =
      'Please enter your Father\'s Name';
  static const String emptyMothersNameField =
      'Please enter your Mother\'s Name';

  //Nominee Validator Strings
  static const String emptyNomineeFullNameField =
      'Please enter your Nominee\'s Full Name';
  static const String emptyRelationToNomineeField =
      'Please enter your relation to your nominee';
  static const String emptyNomineeDateOfBirthField =
      'Please enter your Nominee\'s Date of Birth';
  static const String emptyNomineeGuardianNameField =
      'Please enter your Nominee\'s Guardian Name';
  static const String emptyNomineeGuardianRelationField =
      'Please enter your Nominee\'s Guardian Relation';

  static const String emptyCityField = 'Please enter your city';
  static const String emptyStateField = 'Please enter your state';
  static const String emptyAddressLine1Field =
      'Please enter your address line 1';
  static const String emptyAddressLine2Field =
      'Please enter your address line 2';

  static const String emptyPercentageField =
      'Please enter allocation percentage';
  static const String invalidPercentageField =
      'Please enter a valid percentage';

  //DropDown Validator Strings
  static const String emptyMaritalStatus = 'Please select your marital status';
  static const String emptyOccupationType = 'Please select your occupation';
  static const String emptyAnnualIncome = 'Please select your annual income';
  static const String emptySourceOfIncome =
      'Please select your source of income';
  static const String emptyCountryOfBirth =
      'Please select your country of birth';
  static const String emptyCountryOfTaxResidency =
      'Please select your country of tax residency';
  static const String emptyAddressProofType =
      'Please select your address proof type';
  static const String emptyAccountType = 'Please select your account type';
  static const String emptyTaxIdentificationType =
      'Please enter your tax identification type';
  static const String emptyTaxIdentificationNumber =
      'Please enter your tax identification number';
  static const String emptyAddressProofNumber =
      'Please enter your address proof number';
  static const String emptyStateDropDown = 'Please select your state';
  static const String emptyCityDropDown = 'Please select your city';

  static const String emptyIssueDate = 'Please enter your issue date';
  static const String emptyExpiryDate = 'Please enter your expiry date';

  static const String emptyQueryCategory = "Please select you Query Category";
}

class HiveBoxStrings {
  static const String tokenBox = 'NeIzDMJyLWJsFJlx';
  static const String user = 'user';
  static const String themeBox = 'themeBox';
}
