part of 'setup_cubit.dart';

@immutable
sealed class SetupState {}

final class SetupInitial extends SetupState {}

class SettingUp extends SetupState {}

class SetupDone extends SetupState {}
