import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PromoView extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();
  PromoView({super.key});

  @override
  Widget build(BuildContext context) {
    iniciarAudioFrangoParrudo();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cê é LOCO cachoeira! '),
          backgroundColor: Colors.red, // Cor do AppBar
        ),
        body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(221, 238, 255, 0),
              Color.fromARGB(82, 255, 0, 0)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Você encontrou o Easter Egg 🎃👻!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 6.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'lib/images/promo_image.png', // Substitua pela imagem de promoção
              height: 200,
            ),
            const Text(
              'Hamburguer: Frango Parrudo Empanado, Molho Barbecue\nLanche parrudo 🍔200g',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Como recompensa, você ganhou um lanche de brinde na compra!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 123, 58, 226),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Text.rich(
                TextSpan(
                  text: 'DELIRIOS DO DESERTO!\n\n',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Cupom promocional:  \n', // Texto da promoção com cor diferente
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green, // Cor específica para "PROMO2024"
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(                     
                      text:
                          'LANCHE2024\n', // Texto da promoção com cor diferente
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.red, // Cor específica para "PROMO2024"
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Necessário uma compra de outro item qualquer do cardápio. Solicite junto ao carrinho no pedido e irá ganhar 1 lanche extra!',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Ação do botão (voltar ao menu, aplicar o cupom, etc.)
                Navigator.pop(context); // Fecha a tela de promoção
                Navigator.pushNamed(context, 'login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Voltar ao Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> iniciarAudioFrangoParrudo() async {
    // audioPlayer = AudioPlayer();
    try {
      // Carrega o áudio de um URL absoluto para teste
      await audioPlayer.setSourceUrl('lib/audios/chicken-noise.mp3');

      // Define o volume para 50%
      await audioPlayer.setVolume(0.3);

      // Define o modo de liberação para repetir o áudio em loop
      //audioPlayer.setReleaseMode(ReleaseMode.loop);

      // Inicia a reprodução
      await audioPlayer.resume();
    } catch (error) {
      debugPrint('Erro ao carregar áudio: $error');
      // Adicione um fallback ou uma mensagem de erro amigável ao usuário
    }
  }
}