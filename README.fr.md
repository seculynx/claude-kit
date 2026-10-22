# SecuLynx pour Claude

Lancez le **diagnostic cybersécurité gratuit de SecuLynx** depuis Claude et
recevez deux rapports PDF à la fin de la conversation.

*English version: [README.md](README.md)*

## Ce que ça fait

Claude vous accompagne dans le même diagnostic que
[seculynx.com/fr/diagnostic](https://seculynx.com/fr/diagnostic/) :

1. **Un scan passif de votre domaine** : DNS, authentification email (SPF, DKIM,
   DMARC), TLS, en-têtes de sécurité web, fichiers exposés, identifiants
   divulgués, domaines sosies, réputation. Uniquement des informations
   publiques, ce que n'importe qui peut voir depuis Internet. Aucune intrusion,
   aucun scan de ports, aucune tentative de connexion.
2. **Six courts scénarios métier** (un téléphone perdu, une fausse facture, un
   rançongiciel...) rattachés aux quatre piliers du Lynx Security Framework :
   Comprendre, Protéger, Détecter, Réagir.
3. **Deux rapports à télécharger** :
   - un **rapport de direction** (4 à 5 pages), transmissible à un conseil
     d'administration ou à un investisseur, sans jargon ;
   - un **rapport technique** pour votre équipe IT ou votre prestataire, avec
     chaque contrôle, sa preuve et sa recommandation.

Les rapports sont produits par SecuLynx avec le même moteur que le site : ils
sont identiques à ceux que vous obtiendriez en ligne.

## Installation

### Claude.ai et Claude Desktop (tous les plans, y compris Free)

1. Ouvrez **Customize > Connectors**, cliquez sur **+ Add**, puis **Add custom connector**.
2. Nom : `SecuLynx`. URL : `https://diagnostic.seculynx.com/mcp/`
3. Authentification : **No sign in**. Cliquez sur **Add**.
4. Dans une conversation, activez-le avec **+ > Connectors**, puis demandez :
   *« Lance le diagnostic SecuLynx sur le domaine de mon entreprise. »*

Pour le parcours guidé, importez aussi le skill (il faut avoir activé
**Settings > Capabilities > Code execution and file creation**) : téléchargez
[`seculynx-diagnostic-skill.zip`](https://github.com/seculynx/claude-kit/releases/latest),
puis **Customize > Skills > + > Create skill > Upload a skill**.

Sur les plans Team et Enterprise, un propriétaire ajoute le connecteur une fois
dans **Organization settings > Connectors** (**Add > Custom > Web**), puis les
membres cliquent sur **Connect** dans **Customize > Connectors**.

### Claude Code

```
/plugin marketplace add seculynx/claude-kit
/plugin install seculynx@seculynx
/reload-plugins
```

Lancez ensuite `/seculynx:diagnostic`, ou demandez simplement un diagnostic de
sécurité. Mise à jour : `/plugin marketplace update seculynx`.

## Ce qu'il vous faut

- le **domaine** à analyser : celui de votre propre organisation, le même que
  celui de votre email (`jane@acme.fr` peut analyser `acme.fr` ou
  `shop.acme.fr`). Pour le domaine d'un client,
  [contactez-nous](https://seculynx.com/fr/contact/) ;
- votre **email professionnel** (les messageries gratuites ne sont pas
  acceptées). SecuLynx y envoie un code à 6 chiffres : aucune analyse ne
  démarre avant que vous l'ayez saisi dans Claude. Un expert SecuLynx pourra
  vous contacter au sujet des résultats. Voir la
  [politique de confidentialité](https://seculynx.com/fr/privacy/) ;
- environ cinq minutes.

Limites : quelques diagnostics par email et par domaine et par jour. Les liens
et les fichiers des rapports sont supprimés après 30 jours.

## Contenu du dépôt

| Chemin | Rôle |
| --- | --- |
| `.claude-plugin/plugin.json` | Manifeste du plugin |
| `.claude-plugin/marketplace.json` | Rend le dépôt installable avec `/plugin marketplace add` |
| `.mcp.json` | Connecte Claude au serveur de diagnostic SecuLynx |
| `skills/diagnostic/SKILL.md` | Comment Claude conduit le diagnostic, étape par étape |

Aucun code ne s'exécute sur votre machine : le plugin indique seulement à
Claude où se trouve le serveur SecuLynx et comment mener le diagnostic.

## À propos de SecuLynx

SecuLynx aide les PME, ETI et scale-ups à maîtriser leur risque cyber avec des
experts seniors, en lien avec votre équipe IT ou votre prestataire.
[seculynx.com](https://seculynx.com) · [Contact](https://seculynx.com/fr/contact/)

## Licence

MIT, voir [LICENSE](LICENSE). Le service de diagnostic est opéré par SecuLynx
et soumis à ses [conditions](https://seculynx.com/fr/legal/).
