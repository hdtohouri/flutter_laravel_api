import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_api/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_laravel_api/utils/constants/app_colors.dart';

class Register_screen extends StatefulWidget {
  const Register_screen({super.key});

  @override
  State<Register_screen> createState() => _Register_screenState();
}

class _Register_screenState extends State<Register_screen> {

  bool _isobcur1 = false; 
  bool _isobcur2 = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 45,
                    color: CustomColor.bleuColor,
                  ),
                  Spacer(),
                  Icon(
                    Icons.mode_night_outlined,
                    size: 40,
                    color: CustomColor.bleuColor,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              Text(
                "Se Connecter",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: CustomColor.bleuColor,
                ),
              ),
              Text(
                "Veuillez vous connecter pour continuer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Nom Utilisateur',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                onChanged: (value) =>
                    context.read<AuthenticationBloc>().add(Namechanged(value)),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Saisir Votre nom",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Adresse Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                onChanged: (value) =>
                    context.read<AuthenticationBloc>().add(Emailchanged(value)),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Saisir Votre email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Mot de passe',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                onChanged: (value) => context
                    .read<AuthenticationBloc>()
                    .add(Passwordchanged(value)),
                keyboardType: TextInputType.name,
                obscureText: !_isobcur1,
                decoration: InputDecoration(
                  hintText: "Saisir Votre mot de passe",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white60,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _isobcur1
                       ? Icons.remove_red_eye_outlined :
                      Icons.visibility_off_sharp,
                      color: CustomColor.bleuColor,
                      size: 40,
                    ),
                    onTap: () {
                      setState(() {
                        _isobcur1 = !_isobcur1; // Change la visibilité du mot de passe
                      });
                    },
                  ), //
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Confirmer Mot de passe',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                onChanged: (value) => context
                    .read<AuthenticationBloc>()
                    .add(PasswordConfirmchanged(value)),
                keyboardType: TextInputType.name,
                obscureText: !_isobcur2,
                decoration: InputDecoration(
                  hintText: "Saisir Confirmer votre mot de passe",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white60,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _isobcur2
                       ? Icons.remove_red_eye_outlined :
                      Icons.visibility_off_sharp,
                      color: CustomColor.bleuColor,
                      size: 40,
                    ),
                    onTap: () {
                      setState(() {
                        _isobcur2 = !_isobcur2; // Change la visibilité du mot de passe
                      });
                    },
                  ),//
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                child: ElevatedButton(
                  
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(FormSubmit());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 125, vertical: 15),
                    backgroundColor: CustomColor.bleuColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "S'INSCRIRE",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  text: "J'ai déjà un compte ?", // Le texte principal
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          " Se Connecter", // Une partie du texte supplémentaire
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: CustomColor
                            .bleuColor, // Couleur différente pour cette partie
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
