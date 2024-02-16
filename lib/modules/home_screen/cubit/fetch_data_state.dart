part of 'fetch_data_cubit.dart';

@immutable
abstract class FetchDataState {}

class FetchDataInitialState extends FetchDataState {}

/// State that links are being generated to download the files.
class GeneratingLinksState extends FetchDataState {}

/// State that links are successfully generated.
class LinksGeneratedState extends FetchDataState {}

/// State that downloading the files from generated links.
class DownloadingFilesState extends FetchDataState {}

/// State the files are successfully downloaded.
class FilesDownLoadedState extends FetchDataState {}

/// State that retrieving the data from files.
class RetrievingFilesDataState extends FetchDataState {}

/// State the data retrieved successfully from files.
class RetrievedFilesDataState extends FetchDataState {}

/// Sata that files data begin saved in the local database.
class SavingDataLocally extends FetchDataState {}

/// State that data successfully saved in the local database.
class SavedDataLocally extends FetchDataState {}

/// State that retrieving the data from local database.
class RetrievingLocalDataState extends FetchDataState {}

/// State the data retrieved successfully from local database.
class RetrievedLocalDataState extends FetchDataState {}

/// State to give the final data to the frontend.
class FinalDataState extends FetchDataState {
  final List<FinalDataModel> finalDataSet;

  FinalDataState({required this.finalDataSet});
}

/// State that calculations are begin done on the data
/// retrieving from the files.
class MakingCalculations extends FetchDataState {}

/// State that required calculations are made.
class MadeCalculations extends FetchDataState {
  final List<FinalDataModel> resultDataSet;

  MadeCalculations({required this.resultDataSet});
}

/// State the Loading the data.
class LoadingData extends FetchDataState {}
