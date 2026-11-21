part of '../legal_content.dart';

const _privacyIt = LegalDoc(
  title: "Informativa sulla privacy",
  effective: "In vigore dal 21 novembre 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedList è un'app gratuita per liste della spesa condivise creata da ovitaliy, disponibile su Android, iOS e sul web all'indirizzo syncedlist.web.app. Questa informativa spiega quali dati tratta l'app, perché e con chi vengono condivisi. Usando SyncedList, la accetti.",
      ],
    ),
    LegalSection(
      heading: "Quali dati raccogliamo",
      bullets: [
        LegalBullet(
          "Dati dell'account.",
          "Se accedi con Google o Facebook, riceviamo da quel fornitore il tuo nome, il tuo indirizzo email e la tua foto del profilo. Se continui senza account, creiamo un account anonimo con un ID casuale e nessun dato personale.",
        ),
        LegalBullet(
          "Le tue liste.",
          "I nomi delle liste e gli articoli, il loro ordine e se sono spuntati, e quali account sono membri di ciascuna lista.",
        ),
        LegalBullet(
          "Segnalazioni di arresti anomali.",
          "Quando l'app si arresta o incontra un errore, invia una segnalazione con informazioni come il modello del dispositivo, la versione del sistema operativo, la versione dell'app e il suo stato in quel momento.",
        ),
        LegalBullet(
          "Impostazioni sul dispositivo.",
          "Il tema, l'ordinamento degli articoli e gli inviti alle liste in sospeso sono salvati solo sul tuo dispositivo.",
        ),
      ],
    ),
    LegalSection(
      heading: "Come li usiamo",
      paragraphs: [
        "Usiamo questi dati solo per far funzionare l'app: per farti accedere, per salvare le tue liste e mantenerle sincronizzate tra i tuoi dispositivi e con le persone con cui le condividi, e per trovare e correggere i bug. Non vendiamo i tuoi dati, non mostriamo pubblicità e non li usiamo per il marketing.",
      ],
    ),
    LegalSection(
      heading: "Chi può vederli",
      bullets: [
        LegalBullet(
          "Le persone con cui condividi una lista.",
          "Chiunque apra il link di condivisione di una lista ne diventa membro e può vederla e modificarla. Condividi i link solo con persone di cui ti fidi.",
        ),
        LegalBullet(
          "Fornitori di servizi.",
          "SyncedList funziona su Google Firebase: Firebase Authentication (accesso), Cloud Firestore (archiviazione delle liste), Firebase Crashlytics (segnalazioni di arresti anomali) e Firebase Hosting (il sito web). Anche l'accesso con Google o Facebook passa attraverso queste aziende. Ognuna tratta i dati secondo la propria informativa.",
        ),
        LegalBullet(
          "La legge.",
          "Possiamo comunicare i dati se la legge lo richiede.",
        ),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Conservazione e cancellazione dei dati",
      paragraphs: [
        "I tuoi dati vengono conservati finché usi l'app. Eliminare una lista nell'app ti rimuove dai suoi membri, e la lista viene eliminata del tutto quando non rimangono membri. Per far eliminare il tuo account e tutti i suoi dati, scrivici all'indirizzo qui sotto e lo faremo entro 30 giorni.",
      ],
    ),
    LegalSection(
      heading: "Cookie",
      paragraphs: [
        "Il sito salva piccole quantità di dati nel tuo browser (local storage e, per l'accesso, cookie di Firebase, Google o Facebook) per mantenerti connesso e ricordare le tue impostazioni. Non vengono usati per il tracciamento o la pubblicità.",
      ],
    ),
    LegalSection(
      heading: "Sicurezza",
      paragraphs: [
        "I dati vengono trasmessi tramite connessioni crittografate e archiviati sui server di Google. Nessun metodo di archiviazione o trasmissione è completamente sicuro, quindi non possiamo garantire una sicurezza assoluta.",
      ],
    ),
    LegalSection(
      heading: "Minori",
      paragraphs: [
        "SyncedList non è rivolto ai minori di 13 anni e non raccogliamo consapevolmente i loro dati personali. Se ritieni che un minore ci abbia fornito dati personali, contattaci e li elimineremo.",
      ],
    ),
    LegalSection(
      heading: "Modifiche a questa informativa",
      paragraphs: [
        "Potremmo aggiornare questa informativa di tanto in tanto. Le modifiche vengono pubblicate su questa pagina con una nuova data di entrata in vigore.",
      ],
    ),
    LegalSection(
      heading: "Contatti",
      paragraphs: ["Domande o richieste:"],
      links: [_contact],
    ),
  ],
);

const _termsIt = LegalDoc(
  title: "Condizioni d'uso",
  effective: "In vigore dal 21 novembre 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "Queste condizioni si applicano quando usi SyncedList, un'app gratuita per liste della spesa condivise creata da ovitaliy, su Android, iOS o sul web all'indirizzo syncedlist.web.app. Usando l'app, le accetti. Se non sei d'accordo, non usare l'app.",
      ],
    ),
    LegalSection(
      heading: "Usare SyncedList",
      paragraphs: [
        "Puoi usare l'app con un account Google o Facebook, oppure senza account. Sei responsabile di ciò che inserisci nelle tue liste e della sicurezza del tuo dispositivo e dei tuoi account. Non usare l'app per scopi illegali, per molestare altre persone o per interferire con il servizio o con i dati altrui.",
      ],
    ),
    LegalSection(
      heading: "Condividere le liste",
      paragraphs: [
        "Quando condividi una lista, chiunque apra il link ne diventa membro e può vederla e modificarla. Sei responsabile di con chi condividi i link. I membri possono lasciare una lista in qualsiasi momento.",
      ],
    ),
    LegalSection(
      heading: "Account ospite",
      paragraphs: [
        "Se usi l'app senza account, le tue liste sono legate alla sessione ospite di quel dispositivo. Uscire, cancellare i dati dell'app o disinstallarla può renderle irrecuperabili. Accedi con Google o Facebook dal menu dell'account per conservarle.",
      ],
    ),
    LegalSection(
      heading: "Servizi di terze parti",
      paragraphs: [
        "L'app si basa su servizi con condizioni proprie. Il modo in cui trattiamo i tuoi dati è descritto nell'Informativa sulla privacy.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "L'app",
      paragraphs: [
        "L'app, il suo nome e il suo design appartengono a ovitaliy. Non copiarla, modificarla, rivenderla o decompilarla, e non usarne il nome o il marchio in modo da suggerire un legame con noi.",
      ],
    ),
    LegalSection(
      heading: "Disponibilità e modifiche",
      paragraphs: [
        "SyncedList è fornito gratuitamente e «così com'è». Ci impegniamo a mantenerlo funzionante e le tue liste sincronizzate, ma non possiamo promettere che sarà sempre disponibile, privo di errori o compatibile con il tuo dispositivo. Alcune funzioni richiedono una connessione a internet e il tuo operatore potrebbe addebitare il traffico dati. Possiamo modificare, aggiornare o interrompere l'app in qualsiasi momento.",
      ],
    ),
    LegalSection(
      heading: "Responsabilità",
      paragraphs: [
        "Nei limiti consentiti dalla legge, ovitaliy non è responsabile di perdite o danni derivanti dall'uso o dall'impossibilità di usare l'app, inclusa la perdita dei dati delle liste.",
      ],
    ),
    LegalSection(
      heading: "Modifiche a queste condizioni",
      paragraphs: [
        "Potremmo aggiornare queste condizioni di tanto in tanto. Le modifiche vengono pubblicate su questa pagina con una nuova data di entrata in vigore, e continuare a usare l'app significa accettarle.",
      ],
    ),
    LegalSection(
      heading: "Contatti",
      paragraphs: ["Domande:"],
      links: [_contact],
    ),
  ],
);
