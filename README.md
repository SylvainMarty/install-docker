# install-docker-for-ubuntu
Scripts d'installation de Docker et de docker-compose pour Ubuntu.

## Utilisation

### `Docker`

Le script propose l'installation de Docker pour Ubuntu Trusty (14.04) ou Xenial (16.04) :

```sh
sudo ./docker.sh [trusty|xenial]
```

Si aucune version n'est spécifiée en paramètre, l'OS par défaut est Ubuntu Xenial.

### `docker-compose`

Exécutez simplement le script en tant que sudoer :

```sh
sudo ./docker-compose.sh
```

### Compatibilité

Ces deux scripts on été plusieurs fois testés sur des système Ubuntu Trusty et Xenial. Pourtant, il se peut qu'ils ne fonctionnent pas en fonction de la version de votre kernel.

Merci de consulter les spécifications de Docker dans le cas où ces scripts ne fonctionnerait pas.

### Contribution

N'hésitez pas à proposer des pull requests afin de contribuer à l'amélioration de ces scripts d'installation et à augmenter leur support sur d'autres distributions.

**Enjoy!**
