part of '../legal_content.dart';

const _privacyFr = LegalDoc(
  title: "Politique de confidentialité",
  effective: "En vigueur depuis le 21 novembre 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedList est une application gratuite de listes de courses partagées créée par ovitaliy, disponible sur Android, iOS et sur le web à l'adresse syncedlist.web.app. Cette politique explique quelles données l'application traite, pourquoi et avec qui elles sont partagées. En utilisant SyncedList, vous l'acceptez.",
      ],
    ),
    LegalSection(
      heading: "Ce que nous collectons",
      bullets: [
        LegalBullet(
          "Données du compte.",
          "Si vous vous connectez avec Google ou Facebook, nous recevons de ce fournisseur votre nom, votre adresse e-mail et votre photo de profil. Si vous continuez sans compte, nous créons un compte anonyme avec un identifiant aléatoire et aucune donnée personnelle.",
        ),
        LegalBullet(
          "Vos listes.",
          "Les noms des listes et leurs articles, leur ordre et s'ils sont cochés, ainsi que les comptes membres de chaque liste.",
        ),
        LegalBullet(
          "Rapports de plantage.",
          "Lorsque l'application plante ou rencontre une erreur, elle envoie un rapport contenant notamment le modèle de l'appareil, la version du système d'exploitation, la version de l'application et son état à ce moment-là.",
        ),
        LegalBullet(
          "Réglages sur votre appareil.",
          "Votre thème, l'ordre de tri des articles et les invitations à des listes en attente sont enregistrés uniquement sur votre appareil.",
        ),
      ],
    ),
    LegalSection(
      heading: "Comment nous les utilisons",
      paragraphs: [
        "Nous utilisons ces données uniquement pour faire fonctionner l'application : pour vous connecter, pour enregistrer vos listes et les garder synchronisées entre vos appareils et avec les personnes avec qui vous les partagez, et pour trouver et corriger les bugs. Nous ne vendons pas vos données, n'affichons pas de publicité et ne les utilisons pas à des fins marketing.",
      ],
    ),
    LegalSection(
      heading: "Qui peut les voir",
      bullets: [
        LegalBullet(
          "Les personnes avec qui vous partagez une liste.",
          "Toute personne qui ouvre le lien de partage d'une liste en devient membre et peut la consulter et la modifier. Ne partagez les liens qu'avec des personnes de confiance.",
        ),
        LegalBullet(
          "Les prestataires.",
          "SyncedList fonctionne avec Google Firebase : Firebase Authentication (connexion), Cloud Firestore (stockage des listes), Firebase Crashlytics (rapports de plantage) et Firebase Hosting (le site web). La connexion avec Google ou Facebook passe aussi par ces entreprises. Chacune traite les données selon sa propre politique.",
        ),
        LegalBullet(
          "La loi.",
          "Nous pouvons divulguer des données si la loi l'exige.",
        ),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Conservation et suppression de vos données",
      paragraphs: [
        "Vos données sont conservées tant que vous utilisez l'application. Supprimer une liste dans l'application vous en retire, et la liste est entièrement supprimée lorsqu'il ne reste plus aucun membre. Pour faire supprimer votre compte et toutes ses données, écrivez-nous à l'adresse ci-dessous et nous le ferons sous 30 jours.",
      ],
    ),
    LegalSection(
      heading: "Cookies",
      paragraphs: [
        "Le site enregistre de petites données dans votre navigateur (stockage local et, pour la connexion, cookies déposés par Firebase, Google ou Facebook) afin de vous garder connecté et de mémoriser vos réglages. Ils ne servent ni au suivi ni à la publicité.",
      ],
    ),
    LegalSection(
      heading: "Sécurité",
      paragraphs: [
        "Les données sont transmises par des connexions chiffrées et stockées sur les serveurs de Google. Aucune méthode de stockage ou de transmission n'est totalement sûre ; nous ne pouvons donc pas garantir une sécurité absolue.",
      ],
    ),
    LegalSection(
      heading: "Enfants",
      paragraphs: [
        "SyncedList ne s'adresse pas aux enfants de moins de 13 ans, et nous ne collectons pas sciemment leurs données personnelles. Si vous pensez qu'un enfant nous a transmis des données personnelles, contactez-nous et nous les supprimerons.",
      ],
    ),
    LegalSection(
      heading: "Modifications de cette politique",
      paragraphs: [
        "Nous pouvons mettre à jour cette politique de temps à autre. Les modifications sont publiées sur cette page avec une nouvelle date d'entrée en vigueur.",
      ],
    ),
    LegalSection(
      heading: "Contact",
      paragraphs: ["Questions ou demandes :"],
      links: [_contact],
    ),
  ],
);

const _termsFr = LegalDoc(
  title: "Conditions d'utilisation",
  effective: "En vigueur depuis le 21 novembre 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "Ces conditions s'appliquent lorsque vous utilisez SyncedList, une application gratuite de listes de courses partagées créée par ovitaliy, sur Android, iOS ou sur le web à l'adresse syncedlist.web.app. En utilisant l'application, vous les acceptez. Si vous n'êtes pas d'accord, n'utilisez pas l'application.",
      ],
    ),
    LegalSection(
      heading: "Utiliser SyncedList",
      paragraphs: [
        "Vous pouvez utiliser l'application avec un compte Google ou Facebook, ou sans compte. Vous êtes responsable du contenu de vos listes et de la sécurité de votre appareil et de vos comptes. N'utilisez pas l'application à des fins illégales, pour harceler d'autres personnes ou pour perturber le service ou les données d'autrui.",
      ],
    ),
    LegalSection(
      heading: "Partager des listes",
      paragraphs: [
        "Lorsque vous partagez une liste, toute personne qui ouvre le lien en devient membre et peut la consulter et la modifier. Vous êtes responsable des personnes avec qui vous partagez les liens. Les membres peuvent quitter une liste à tout moment.",
      ],
    ),
    LegalSection(
      heading: "Comptes invités",
      paragraphs: [
        "Si vous utilisez l'application sans compte, vos listes sont liées à la session invité de cet appareil. Vous déconnecter, effacer les données de l'application ou la désinstaller peut les rendre irrécupérables. Connectez-vous avec Google ou Facebook depuis le menu du compte pour les conserver.",
      ],
    ),
    LegalSection(
      heading: "Services tiers",
      paragraphs: [
        "L'application s'appuie sur des services soumis à leurs propres conditions. La façon dont nous traitons vos données est décrite dans la Politique de confidentialité.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "L'application",
      paragraphs: [
        "L'application, son nom et son design appartiennent à ovitaliy. Ne la copiez pas, ne la modifiez pas, ne la revendez pas et ne la décompilez pas, et n'utilisez pas son nom ou son image d'une manière qui suggère un lien avec nous.",
      ],
    ),
    LegalSection(
      heading: "Disponibilité et modifications",
      paragraphs: [
        "SyncedList est fourni gratuitement et « en l'état ». Nous faisons en sorte qu'il fonctionne et que vos listes restent synchronisées, mais nous ne pouvons pas promettre qu'il sera toujours disponible, sans erreur ou compatible avec votre appareil. Certaines fonctions nécessitent une connexion internet, et votre opérateur peut facturer les données. Nous pouvons modifier, mettre à jour ou arrêter l'application à tout moment.",
      ],
    ),
    LegalSection(
      heading: "Responsabilité",
      paragraphs: [
        "Dans les limites permises par la loi, ovitaliy n'est pas responsable des pertes ou dommages résultant de l'utilisation ou de l'impossibilité d'utiliser l'application, y compris la perte des données des listes.",
      ],
    ),
    LegalSection(
      heading: "Modifications de ces conditions",
      paragraphs: [
        "Nous pouvons mettre à jour ces conditions de temps à autre. Les modifications sont publiées sur cette page avec une nouvelle date d'entrée en vigueur, et continuer à utiliser l'application signifie que vous les acceptez.",
      ],
    ),
    LegalSection(
      heading: "Contact",
      paragraphs: ["Questions :"],
      links: [_contact],
    ),
  ],
);
