part of 'quote_cubit.dart';

@immutable
sealed class QuoteState {}

final class QuoteInitial extends QuoteState {}

final class QuoteLoadingState extends QuoteState {}

final class QuoteSuccessState extends QuoteState {}

final class QuoteErrorState extends QuoteState {
  final String error;

  QuoteErrorState({required this.error});
}
