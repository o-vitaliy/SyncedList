part of '../legal_content.dart';

const _privacyEs = LegalDoc(
  title: "Política de privacidad",
  effective: "Vigente desde el 21 de noviembre de 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedList es una app gratuita de listas de la compra compartidas creada por ovitaliy, disponible en Android, iOS y en la web en syncedlist.web.app. Esta política explica qué datos maneja la app, para qué y con quién se comparten. Al usar SyncedList, la aceptas.",
      ],
    ),
    LegalSection(
      heading: "Qué datos recogemos",
      bullets: [
        LegalBullet(
          "Datos de la cuenta.",
          "Si inicias sesión con Google o Facebook, recibimos de ese proveedor tu nombre, tu correo electrónico y tu foto de perfil. Si continúas sin cuenta, creamos una cuenta anónima con un ID aleatorio y sin datos personales.",
        ),
        LegalBullet(
          "Tus listas.",
          "Los nombres de las listas y sus productos, su orden y si están marcados, y qué cuentas son miembros de cada lista.",
        ),
        LegalBullet(
          "Informes de errores.",
          "Cuando la app se cierra inesperadamente o encuentra un error, envía un informe con datos como el modelo del dispositivo, la versión del sistema operativo, la versión de la app y su estado en ese momento.",
        ),
        LegalBullet(
          "Ajustes en tu dispositivo.",
          "Tu tema, el orden de los productos y las invitaciones pendientes a listas se guardan solo en tu dispositivo.",
        ),
      ],
    ),
    LegalSection(
      heading: "Cómo los usamos",
      paragraphs: [
        "Usamos estos datos solo para que la app funcione: para iniciar tu sesión, guardar tus listas y mantenerlas sincronizadas entre tus dispositivos y con las personas con las que las compartes, y para encontrar y corregir errores. No vendemos tus datos, no mostramos anuncios ni los usamos para marketing.",
      ],
    ),
    LegalSection(
      heading: "Quién puede verlos",
      bullets: [
        LegalBullet(
          "Las personas con las que compartes una lista.",
          "Cualquiera que abra un enlace de una lista pasa a ser miembro y puede verla y editarla. Comparte enlaces solo con personas de confianza.",
        ),
        LegalBullet(
          "Proveedores de servicios.",
          "SyncedList funciona con Google Firebase: Firebase Authentication (inicio de sesión), Cloud Firestore (almacenamiento de listas), Firebase Crashlytics (informes de errores) y Firebase Hosting (el sitio web). El inicio de sesión con Google o Facebook también pasa por esas empresas. Cada una trata los datos según su propia política.",
        ),
        LegalBullet("La ley.", "Podemos revelar datos si la ley nos lo exige."),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Conservación y eliminación de tus datos",
      paragraphs: [
        "Tus datos se conservan mientras uses la app. Al eliminar una lista en la app dejas de ser miembro, y la lista se elimina por completo cuando no quedan miembros. Para eliminar tu cuenta y todos sus datos, escríbenos a la dirección de abajo y lo haremos en un plazo de 30 días.",
      ],
    ),
    LegalSection(
      heading: "Cookies",
      paragraphs: [
        "El sitio web guarda pequeños datos en tu navegador (almacenamiento local y, para el inicio de sesión, cookies de Firebase, Google o Facebook) para mantener tu sesión y recordar tus ajustes. No se usan para seguimiento ni publicidad.",
      ],
    ),
    LegalSection(
      heading: "Seguridad",
      paragraphs: [
        "Los datos se envían mediante conexiones cifradas y se guardan en servidores de Google. Ningún método de almacenamiento o transmisión es totalmente seguro, por lo que no podemos garantizar una seguridad absoluta.",
      ],
    ),
    LegalSection(
      heading: "Menores",
      paragraphs: [
        "SyncedList no está dirigido a menores de 13 años y no recogemos a sabiendas sus datos personales. Si crees que un menor nos ha facilitado datos personales, contáctanos y los eliminaremos.",
      ],
    ),
    LegalSection(
      heading: "Cambios en esta política",
      paragraphs: [
        "Podemos actualizar esta política de vez en cuando. Los cambios se publican en esta página con una nueva fecha de entrada en vigor.",
      ],
    ),
    LegalSection(
      heading: "Contacto",
      paragraphs: ["Preguntas o solicitudes:"],
      links: [_contact],
    ),
  ],
);

const _termsEs = LegalDoc(
  title: "Condiciones de uso",
  effective: "Vigentes desde el 21 de noviembre de 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "Estas condiciones se aplican cuando usas SyncedList, una app gratuita de listas de la compra compartidas creada por ovitaliy, en Android, iOS o en la web en syncedlist.web.app. Al usar la app, las aceptas. Si no estás de acuerdo, no uses la app.",
      ],
    ),
    LegalSection(
      heading: "Uso de SyncedList",
      paragraphs: [
        "Puedes usar la app con una cuenta de Google o Facebook, o sin cuenta. Eres responsable de lo que pones en tus listas y de mantener seguros tu dispositivo y tus cuentas. No uses la app para nada ilegal, para acosar a otras personas ni para interferir con el servicio o con los datos de otros.",
      ],
    ),
    LegalSection(
      heading: "Compartir listas",
      paragraphs: [
        "Cuando compartes una lista, cualquiera que abra el enlace pasa a ser miembro y puede verla y modificarla. Eres responsable de con quién compartes los enlaces. Los miembros pueden salir de una lista en cualquier momento.",
      ],
    ),
    LegalSection(
      heading: "Cuentas de invitado",
      paragraphs: [
        "Si usas la app sin cuenta, tus listas están vinculadas a la sesión de invitado de ese dispositivo. Cerrar sesión, borrar los datos de la app o desinstalarla puede hacer que no se puedan recuperar. Inicia sesión con Google o Facebook desde el menú de la cuenta para conservarlas.",
      ],
    ),
    LegalSection(
      heading: "Servicios de terceros",
      paragraphs: [
        "La app depende de servicios con sus propias condiciones. Cómo tratamos tus datos se explica en la Política de privacidad.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "La app",
      paragraphs: [
        "La app, su nombre y su diseño pertenecen a ovitaliy. No la copies, modifiques, revendas ni descompiles, ni uses su nombre o su marca de forma que sugiera una relación con nosotros.",
      ],
    ),
    LegalSection(
      heading: "Disponibilidad y cambios",
      paragraphs: [
        "SyncedList se ofrece gratis y «tal cual». Trabajamos para que funcione y tus listas estén sincronizadas, pero no podemos prometer que esté siempre disponible, sin errores o que sea compatible con tu dispositivo. Algunas funciones necesitan conexión a internet y tu operador puede cobrarte por los datos. Podemos cambiar, actualizar o retirar la app en cualquier momento.",
      ],
    ),
    LegalSection(
      heading: "Responsabilidad",
      paragraphs: [
        "En la medida en que la ley lo permita, ovitaliy no es responsable de ninguna pérdida o daño derivado del uso o la imposibilidad de usar la app, incluida la pérdida de datos de las listas.",
      ],
    ),
    LegalSection(
      heading: "Cambios en estas condiciones",
      paragraphs: [
        "Podemos actualizar estas condiciones de vez en cuando. Los cambios se publican en esta página con una nueva fecha de entrada en vigor, y seguir usando la app significa que los aceptas.",
      ],
    ),
    LegalSection(
      heading: "Contacto",
      paragraphs: ["Preguntas:"],
      links: [_contact],
    ),
  ],
);
