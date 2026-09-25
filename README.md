# Ateliers

Application fil rouge de la formation Ruby on Rails : une plateforme d'inscription à des ateliers à places limitées.

## Installation

Prérequis : Ruby (la version de `.ruby-version`), Node.js (avec npm), SQLite 3, git.

```bash
bin/setup --skip-server
```

`bin/setup` installe les gems et les paquets npm, prépare la base de données et nettoie les fichiers temporaires.

## Lancer l'application

```bash
bin/dev
```

Puis ouvrez http://localhost:3000. `bin/dev` lance le serveur Rails et la compilation du CSS (Bootstrap) en parallèle.

La console Rails :

```bash
bin/rails console
```

## Les branches

Chaque étape de la formation a sa branche, qui contient l'état de l'application **à la fin** de l'étape. `step-00` est le point de départ ; les solutions `step-01` à `step-20` sont publiées au fil de la formation.

```bash
git fetch                                     # récupère les solutions publiées depuis votre dernier fetch
git switch -c mon-travail origin/step-00      # votre branche de travail, créée au step 01
git diff origin/step-07                       # compare votre code avec la solution du step 07
git switch -c rattrapage-07 origin/step-07    # repartez de la solution du step 07 sur une nouvelle branche
bin/rails db:reset                            # recrée la base et rejoue les seeds après un changement de branche
```
