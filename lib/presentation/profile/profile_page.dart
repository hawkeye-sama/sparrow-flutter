import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow/core/widgets/custom_filled_button.dart';
import 'package:sparrow/presentation/authentication/cubits/auth_cubit.dart';
import 'package:sparrow/presentation/main/cubit/page_cubit.dart';
import 'package:sparrow/presentation/widgets/empty_page.dart';

class ProfilePage extends EmptyPage {
  static const routeName = '/profile';

  ProfilePage({super.key})
      : super(
          icon: Icons.person_outlined,
          title: 'Profile',
          childBuilder: (context) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/women/79.jpg',
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Jane Doe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        leading: Icon(
                          Icons.email_outlined,
                          color: Colors.grey[700],
                        ),
                        title: Text(
                          'janedoe@gmail.com',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone_outlined,
                          color: Colors.grey[700],
                        ),
                        title: Text(
                          '+1 (555) 123-4567',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Phone',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey[700],
                        ),
                        title: Text(
                          '123 Main St',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Address',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CustomFilledButton(
                  text: "Log out",
                  onPressed: () {
                    context.read<AuthCubit>().logOut();
                    context.read<PageCubit>().updateIndex(0);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
}
