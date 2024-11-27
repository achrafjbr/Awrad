import 'package:abu_sandia/controller/repositories/quote_repositories/quote_repository.dart';
import 'package:abu_sandia/controller/services/quote_service/quote_service.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../model/categories_model.dart';
import '../../../model/quote_model.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteInitial());

  List<QuoteModel> newQuotes = [];
  List<QuoteModel> mostSeenQuotes = [];
  List<QuoteModel> quotes = [];

  QuoteRepository quoteRepository = QuoteRepository(
    quote: QuoteService(),
  );

  Future<void> getQuotes({required String document}) async {
    emit(QuoteLoadingState());
    try {
      quotes = await quoteRepository.getQuotes(document: document);
      emit(QuoteSuccessState());
    } catch (error) {
      emit(QuoteErrorState(error: error.toString()));
    }
  }

  Future<void> getMostSeenQuotes() async {
    emit(QuoteLoadingState());
    try {
      mostSeenQuotes = await quoteRepository.getMostSeenQuotes();
      emit(QuoteSuccessState());
    } catch (error) {
      emit(QuoteErrorState(error: error.toString()));
    }
  }

  Future<void> getNewQuotes() async {
    emit(QuoteLoadingState());
    try {
      newQuotes = await quoteRepository.getNewQuotes();
      emit(QuoteSuccessState());
    } catch (error) {
      emit(QuoteErrorState(error: error.toString()));
    }
  }

  bool isLoading = false;

  Future<void> getNextQuotes({
    DocumentSnapshot<Object?>? documentSnapshot,
    required String category,
  }) async {
    isLoading = true;
    emit(QuoteLoadingState());
    try {
      List<QuoteModel> nextQuotes = await quoteRepository.getNextQuotes(
        documentSnapshot: documentSnapshot,
        category: category,
      );
      if (nextQuotes.isNotEmpty) {
        newQuotes.addAll(nextQuotes);
      }
      emit(QuoteSuccessState());
      isLoading = false;
    } catch (error) {
      emit(QuoteErrorState(
        error: error.toString(),
      ));
    }
  }

  Future<void> seeQuote({
    required String category,
    required QuoteModel quoteModel,
  }) async {
    emit(QuoteLoadingState());
    await quoteRepository.seeQuote(
      category: category,
      quoteModel: quoteModel,
    );
    emit(QuoteSuccessState());
  }
}
