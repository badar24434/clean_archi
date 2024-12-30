import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pokemon_provider.dart';
import '../../business/entities/pokemon_entity.dart';

class PokemonImageWidget extends StatelessWidget {
  const PokemonImageWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<PokemonProvider>(
        builder: (context, provider, _) {
          if (provider.pokemon != null) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.orange,
                image: DecorationImage(
                  image: NetworkImage(
                    provider.pokemon!.sprites.other.officialArtwork.frontDefault,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              child: child,
            );
          } else {
            // Show placeholder when no Pokemon is loaded
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.orange,
                image: const DecorationImage(
                  image: AssetImage('assets/images/mapp.png'),
                ),
              ),
              child: child,
            );
          }
        },
      ),
    );
  }
}
