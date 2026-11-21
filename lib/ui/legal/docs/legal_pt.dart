part of '../legal_content.dart';

const _privacyPt = LegalDoc(
  title: "Política de privacidade",
  effective: "Em vigor desde 21 de novembro de 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "O SyncedList é um app gratuito de listas de compras compartilhadas feito por ovitaliy, disponível para Android, iOS e na web em syncedlist.web.app. Esta política explica quais dados o app trata, por que e com quem eles são compartilhados. Ao usar o SyncedList, você concorda com ela.",
      ],
    ),
    LegalSection(
      heading: "O que coletamos",
      bullets: [
        LegalBullet(
          "Dados da conta.",
          "Se você entrar com Google ou Facebook, recebemos desse provedor seu nome, seu e-mail e sua foto de perfil. Se você continuar sem conta, criamos uma conta anônima com um ID aleatório e sem dados pessoais.",
        ),
        LegalBullet(
          "Suas listas.",
          "Os nomes das listas e seus itens, a ordem deles e se estão marcados, além de quais contas são membros de cada lista.",
        ),
        LegalBullet(
          "Relatórios de falhas.",
          "Quando o app trava ou encontra um erro, ele envia um relatório com informações como o modelo do aparelho, a versão do sistema operacional, a versão do app e o estado do app naquele momento.",
        ),
        LegalBullet(
          "Configurações no seu aparelho.",
          "Seu tema, a ordem dos itens e convites pendentes para listas ficam salvos apenas no seu aparelho.",
        ),
      ],
    ),
    LegalSection(
      heading: "Como usamos",
      paragraphs: [
        "Usamos esses dados apenas para fazer o app funcionar: para você entrar, para guardar suas listas e mantê-las sincronizadas entre seus aparelhos e com as pessoas com quem você as compartilha, e para encontrar e corrigir erros. Não vendemos seus dados, não exibimos anúncios nem os usamos para marketing.",
      ],
    ),
    LegalSection(
      heading: "Quem pode ver",
      bullets: [
        LegalBullet(
          "Pessoas com quem você compartilha uma lista.",
          "Qualquer pessoa que abrir um link de uma lista passa a ser membro e pode vê-la e editá-la. Compartilhe links só com pessoas em quem você confia.",
        ),
        LegalBullet(
          "Prestadores de serviço.",
          "O SyncedList funciona no Google Firebase: Firebase Authentication (login), Cloud Firestore (armazenamento das listas), Firebase Crashlytics (relatórios de falhas) e Firebase Hosting (o site). O login com Google ou Facebook também passa por essas empresas. Cada uma trata os dados segundo a própria política.",
        ),
        LegalBullet("A lei.", "Podemos divulgar dados se a lei exigir."),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Guarda e exclusão dos seus dados",
      paragraphs: [
        "Seus dados são mantidos enquanto você usa o app. Excluir uma lista no app remove você dos membros, e a lista é excluída por completo quando não resta nenhum membro. Para excluir sua conta e todos os dados dela, escreva para o endereço abaixo e faremos isso em até 30 dias.",
      ],
    ),
    LegalSection(
      heading: "Cookies",
      paragraphs: [
        "O site guarda pequenos dados no seu navegador (armazenamento local e, para o login, cookies do Firebase, do Google ou do Facebook) para manter você conectado e lembrar suas configurações. Eles não são usados para rastreamento nem publicidade.",
      ],
    ),
    LegalSection(
      heading: "Segurança",
      paragraphs: [
        "Os dados são enviados por conexões criptografadas e guardados em servidores do Google. Nenhum método de armazenamento ou transmissão é totalmente seguro, por isso não podemos garantir segurança absoluta.",
      ],
    ),
    LegalSection(
      heading: "Crianças",
      paragraphs: [
        "O SyncedList não se destina a crianças menores de 13 anos, e não coletamos intencionalmente dados pessoais delas. Se você acredita que uma criança nos forneceu dados pessoais, entre em contato e vamos excluí-los.",
      ],
    ),
    LegalSection(
      heading: "Mudanças nesta política",
      paragraphs: [
        "Podemos atualizar esta política de tempos em tempos. As mudanças são publicadas nesta página com uma nova data de vigência.",
      ],
    ),
    LegalSection(
      heading: "Contato",
      paragraphs: ["Dúvidas ou solicitações:"],
      links: [_contact],
    ),
  ],
);

const _termsPt = LegalDoc(
  title: "Termos de uso",
  effective: "Em vigor desde 21 de novembro de 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "Estes termos se aplicam quando você usa o SyncedList, um app gratuito de listas de compras compartilhadas feito por ovitaliy, no Android, no iOS ou na web em syncedlist.web.app. Ao usar o app, você concorda com eles. Se não concordar, não use o app.",
      ],
    ),
    LegalSection(
      heading: "Uso do SyncedList",
      paragraphs: [
        "Você pode usar o app com uma conta Google ou Facebook, ou sem conta. Você é responsável pelo que coloca nas suas listas e por manter seu aparelho e suas contas seguros. Não use o app para nada ilegal, para assediar outras pessoas nem para interferir no serviço ou nos dados de outras pessoas.",
      ],
    ),
    LegalSection(
      heading: "Compartilhar listas",
      paragraphs: [
        "Quando você compartilha uma lista, qualquer pessoa que abrir o link passa a ser membro e pode vê-la e alterá-la. Você é responsável por com quem compartilha os links. Os membros podem sair de uma lista a qualquer momento.",
      ],
    ),
    LegalSection(
      heading: "Contas de convidado",
      paragraphs: [
        "Se você usa o app sem conta, suas listas ficam ligadas à sessão de convidado daquele aparelho. Sair, limpar os dados do app ou desinstalá-lo pode tornar impossível recuperá-las. Entre com Google ou Facebook pelo menu da conta para mantê-las.",
      ],
    ),
    LegalSection(
      heading: "Serviços de terceiros",
      paragraphs: [
        "O app depende de serviços com termos próprios. A forma como tratamos seus dados está descrita na Política de privacidade.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "O app",
      paragraphs: [
        "O app, seu nome e seu design pertencem a ovitaliy. Não copie, modifique, revenda ou faça engenharia reversa dele, nem use seu nome ou sua marca de um jeito que sugira uma ligação conosco.",
      ],
    ),
    LegalSection(
      heading: "Disponibilidade e mudanças",
      paragraphs: [
        "O SyncedList é oferecido de graça e \"no estado em que se encontra\". Trabalhamos para mantê-lo funcionando e suas listas sincronizadas, mas não podemos prometer que estará sempre disponível, sem erros ou compatível com seu aparelho. Alguns recursos precisam de internet, e sua operadora pode cobrar pelo uso de dados. Podemos alterar, atualizar ou descontinuar o app a qualquer momento.",
      ],
    ),
    LegalSection(
      heading: "Responsabilidade",
      paragraphs: [
        "Na medida permitida pela lei, ovitaliy não se responsabiliza por perdas ou danos decorrentes do uso ou da impossibilidade de usar o app, incluindo a perda de dados das listas.",
      ],
    ),
    LegalSection(
      heading: "Mudanças nestes termos",
      paragraphs: [
        "Podemos atualizar estes termos de tempos em tempos. As mudanças são publicadas nesta página com uma nova data de vigência, e continuar usando o app significa que você as aceita.",
      ],
    ),
    LegalSection(
      heading: "Contato",
      paragraphs: ["Dúvidas:"],
      links: [_contact],
    ),
  ],
);
