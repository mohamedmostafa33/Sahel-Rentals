import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../storage/language_storage.dart';

// Events
abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LoadLanguageEvent extends LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final String languageCode;

  const ChangeLanguageEvent(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}

// States
abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object> get props => [locale];
}

// BLoC
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageStorage _languageStorage;

  LanguageBloc(this._languageStorage) : super(LanguageInitial()) {
    on<LoadLanguageEvent>(_onLoadLanguage);
    on<ChangeLanguageEvent>(_onChangeLanguage);
  }

  void _onLoadLanguage(LoadLanguageEvent event, Emitter<LanguageState> emit) {
    final languageCode = _languageStorage.getLanguage();
    final locale = _getLocaleFromCode(languageCode);
    emit(LanguageLoaded(locale));
  }

  void _onChangeLanguage(ChangeLanguageEvent event, Emitter<LanguageState> emit) {
    _languageStorage.setLanguage(event.languageCode);
    final locale = _getLocaleFromCode(event.languageCode);
    emit(LanguageLoaded(locale));
  }

  Locale _getLocaleFromCode(String languageCode) {
    switch (languageCode) {
      case 'en':
        return const Locale('en', 'US');
      case 'ar':
      default:
        return const Locale('ar', 'EG');
    }
  }
}
