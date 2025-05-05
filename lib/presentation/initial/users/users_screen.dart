import 'package:dsa_teaching_web/presentation/initial/users/bloc/users_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/users/bloc/users_state.dart';
import 'package:dsa_teaching_web/presentation/initial/users/widgets/user_learning_info.dart';
import 'package:dsa_teaching_web/presentation/initial/users/widgets/user_list_item.dart';
import 'package:dsa_teaching_web/presentation/initial/users/widgets/users_text.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({
    required this.cubit,
    super.key,
  });

  final UsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20.0),
        child: SingleChildScrollView(
          child: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    spacing: 50,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MainContainer(
                        padding: const EdgeInsetsDirectional.all(4),
                        content: IconButton(
                          onPressed: cubit.onBackPressed,
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      const UsersText(),
                    ],
                  ),
                  if (state.status == UserStatus.loading)
                    const Center(child: CircularProgressIndicator()),
                  if (state.status == UserStatus.success) ...[
                    if (MediaQuery.sizeOf(context).width < 1500)
                      _buildColumn(context, state)
                    else
                      _buildRow(context, state),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(BuildContext context, UsersState state) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserListTable(
            users: state.users,
            onUserSelected: cubit.onUserSelected,
            selectedId: state.selectedUserId,
          ),
          if (state.screenStatus == ScreenStatus.seeUserInfo) ...[
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            UserLearningInfoWidget(
              lessons: state.userLearnedLessons,
              onClosePressed: cubit.onClosePressed,
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, UsersState state) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserListTable(
            users: state.users,
            onUserSelected: cubit.onUserSelected,
            selectedId: state.selectedUserId,
          ),
          if (state.screenStatus == ScreenStatus.seeUserInfo) ...[
            Container(
              width: 4,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            UserLearningInfoWidget(
              lessons: state.userLearnedLessons,
              onClosePressed: cubit.onClosePressed,
            ),
          ]
        ],
      ),
    );
  }
}
