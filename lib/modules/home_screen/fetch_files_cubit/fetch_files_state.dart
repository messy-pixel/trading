part of 'fetch_files_cubit.dart';

@immutable
abstract class FetchFilesState {}

class FetchFilesInitial extends FetchFilesState {}

class GeneratedLinks extends FetchFilesState{
  final List<String> links;

  GeneratedLinks({required this.links});
}

class FetchingFiles extends FetchFilesState{}

class SuccessfullyGotFiles extends FetchFilesState{}

class ErrorFetchingFiles extends FetchFilesState{}