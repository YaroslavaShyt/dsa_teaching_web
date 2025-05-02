import 'package:dsa_teaching_web/presentation/initial/users/bloc/users_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/users/bloc/users_state.dart';
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
                          icon: Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                      const UsersText(),
                    ],
                  ),
                  if (state.status == UserStatus.loading)
                    const Center(child: CircularProgressIndicator()),
                  if (state.status == UserStatus.success) ...[
                    UserListTable(users: state.users),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
