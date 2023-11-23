import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      // Formulário de dados
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // email
          CustomTextField(
            icon: Icons.email,
            label: 'E-mail',
            initialValue: appData.user.email,
            readOnly: true,
          ),

          // nome
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
            initialValue: appData.user.name,
            readOnly: true,
          ),

          // celular
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
            initialValue: appData.user.phone,
            readOnly: true,
          ),

          // cpf
          CustomTextField(
            icon: Icons.email,
            label: 'CPF',
            isSecret: true,
            initialValue: appData.user.cpf,
            readOnly: true,
          ),

          // alterar senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                updatePassword();
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: const BorderSide(
                  color: Colors.green,
                ),
              ),
              child: const Text('Atualizar Senha'),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Atualização de Senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // senha atual
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha Atual',
                        isSecret: true,
                      ),

                      // nova senha
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Nova Senha',
                        isSecret: true,
                      ),

                      // confirmar nova senha
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Confirmar Nova Senha',
                        isSecret: true,
                      ),

                      // botao atualizar
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Atualizar'),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
