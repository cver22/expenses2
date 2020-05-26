import 'package:equatable/equatable.dart';
import 'package:expenses/models/entry/entry.dart';

abstract class EntriesState extends Equatable {
  const EntriesState();

  @override
  List<Object> get props => [];
}

class EntriesLoading extends EntriesState {}

class EntriesLoaded extends EntriesState {
  final List<Entry> entries;

  const EntriesLoaded([this.entries = const []]);

  @override
  List<Object> get props => [entries];

  @override
  String toString() => 'EntriesLoadedSuccess { entries: $entries }';
}

class EntriesLoadFailure extends EntriesState {}