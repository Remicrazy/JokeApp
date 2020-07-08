# joke_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
-----------------
### Resume:

L’application sera un book de blague. Elle contiendra des blagues déjà existant grâce à une api (uniquement en anglais) qui seront stockées par la suite dans une DDB Local (pour une utilisation Offline).
Par la suite il sera possible de rajouter/supprimer les blagues existantes.

### Spécification :

Les blagues seront affichées dans une Card par blague et chaque Card sera dans une ListView global.
La Card sera composer donc de la blague plus d’un bouton qui permettra la suppression de la blague.
Une seconde “page” sera quant à elle un Form pour l’ajout d’une blague dans la DDB.

#### L’appel à l’api de base est la suivante :
https://sv443.net/jokeapi/v2/joke/Any

On peut rajouter des filtres parmi les suivants si on ne veut pas de blague liée aux thèmes : *nsfw, religious, political, racist, sexist*

Exemple d’un appel :

    {
        "category": "Programming",
        "type": "twopart"
        "setup": "Why did the functional programming developer get thrown out of school?",
        "delivery": "Because he refused to take classes.",
        "flags": {
            "nsfw": false,
            "religious": false,
            "political": false,
            "racist": false,
            "sexist": false
        },
        "id": 48,
        "error": false
    }

L’api ne nécessite pas d'inscription ni de token.

### Le Challenge :

Le Challenge sera d’utiliser l’un de Widget d’Animation & Motion disponibles dans le catalogue de Flutter.

### L’UI :

Pour l’interface, il restera sur le thème de base de Flutter: Material.