import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:t2sema/features/match/data/models/match_model.dart';
import 'package:t2sema/features/match/data/repos/match_repo.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final MatchRepo matchRepo;
  HistoryCubit(this.matchRepo) : super(HistoryInitial());

  void getAllMatches() {
    emit(HistoryLoading());
    print("🕵️‍♂️ CUBIT: Fetching history...");
    try {
      final matches = matchRepo.getAllMatches();
      print("📦 CUBIT: Found ${matches.length} matches in Hive");
      if (matches.isEmpty) {
        emit(HistoryEmpty());
      } else {
        matches.sort((a, b) => b.date.compareTo(a.date));
        emit(HistorySuccess(matches: matches));
      }
    } catch (e) {
      emit(HistoryFailure(errMsg: 'Failed to load history: $e'));
    }
  }

  Future<void> deleteMatch(MatchModel match) async {
    try {
      await matchRepo.deleteMatch(match);
      getAllMatches();
    } catch (e) {
      getAllMatches();
    }
  }

  Future<void> saveMatch(MatchModel match) async {
    print("🕵️‍♂️ CUBIT: Attempting to save match...");
    try {
      await matchRepo.addMatch(match);
      print("✅ CUBIT: Match saved to Hive!");
      getAllMatches();
    } catch (e) {
      print("❌ CUBIT: Save failed: $e");
      emit(HistoryFailure(errMsg: 'Failed to save match: $e'));
    }
  }
}
