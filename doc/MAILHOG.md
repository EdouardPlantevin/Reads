# MailHog

MailHog est un outil de test d'email open source destiné principalement aux développeurs. Il va vous permettre de tester l'envoi et la réception des emails de votre application web.

MailHog va vous proposer de créer un faux serveur SMTP puis intercepter vos emails lorsque vous connecterez votre application à ce serveur SMTP.

Pour visualiser les emails que MailHog à intercepté il suffit de ce rendre sur `http://localhost:8025/#`.

## Configurer MailHog
Dans le fichier `.env.local` ajouter la ligne suivante :
```
MAILER_DSN="smtp://:@mailhog:1025?verify_peer=false"
```
