import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/core/utils/service_locator.dart';
import 'package:t2sema/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:t2sema/features/history/presentation/views/widgets/match_history_list_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HistoryCubit>()..getAllMatches(),
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text('Matches History', style: AppStyles.textStyleMedium24),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: BlocBuilder<HistoryCubit, HistoryState>(
                    builder: (context, state) {
                      if (state is HistorySuccess) {
                        return MatchHistoryListView(matches: state.matches);
                      } else if (state is HistoryFailure) {
                        return Center(child: Text(state.errMsg));
                      } else if (state is HistoryEmpty) {
                        return const Center(
                          child: Text('No matches played yet!'),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
