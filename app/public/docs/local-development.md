# Environnement local PepseeActus

## Pourquoi un clone DB complet est obligatoire

PepseeActus s'appuie fortement sur ACF pour :

- les groupes de champs ;
- les valeurs de champs sur les contenus ;
- les relations entre artistes, musiques, albums et riddims ;
- certaines options de configuration.

Le thème ne versionne pas actuellement les groupes ACF en `acf-json`, donc un export ACF seul ne suffit pas. Pour avoir un front local fidèle, il faut importer un dump SQL complet de la base.

## Mise en place locale recommandée

1. Copier `local.php.example` vers `local.php`.
2. Adapter les credentials et l'URL locale dans `local.php`.
3. Vérifier que `wp-content/uploads` est bien présent localement.
4. Importer un dump SQL complet, puis faire un search-replace des URLs.
5. Lancer la compilation SCSS du thème.

## Import DB rapide

Commande prévue :

```bash
./scripts/local/import-db.sh /chemin/vers/dump.sql https://pepseeactus.com http://pepseeactus.local
```

Le script :

- crée la base locale si besoin ;
- importe le dump SQL ;
- remplace les URLs prod par l'URL locale ;
- remet à jour `home` et `siteurl`.

## Si ACF ne remonte pas en local

Vérifier dans l'admin WordPress locale :

- que les groupes ACF sont visibles ;
- qu'une fiche `artist` affiche bien ses champs ;
- qu'une page `music` conserve ses relations vers artistes / albums / riddims ;
- que les permaliens ont été régénérés une fois.

## Build front

Depuis le thème :

```bash
cd wp-content/themes/pepseeactus
npm install
npm run build:css
```

Puis lancer le watcher si besoin :

```bash
npm run watch:css
```
