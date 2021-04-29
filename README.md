##    Installation des Prérequis : 
    - Os Linux, Debian 10
    - Java
    - Client Rcon
    - php 7.2
    
Pour L'OS vous pouvez, soit installer Debian sur une machine virtuelle, soit configurez un ordinateur avec ce dernier.

##    Installation des Prérequis : 
    - Os Linux, Debian 10
    - Java
    - Client Rcon
    - Serveur Apache
    - php 7.2
    
Pour L'OS vous pouvez, soit installer Debian sur une machine virtuelle, soit configurez un ordinateur avec ce dernier.

Pour installer Java, ouvrez une invite de commande et tapez : 
```sudo apt update -y```
puis
```sudo apt install default-jre```

Pour Le client Rcon, rendez vous sur ce git : https://github.com/Tiiffi/mcrcon
Récupérez le repository et suivez les instructions du README.md pour l'installation.

Enfin pour php, ouvrez une invite de commande et tapez : 
```sudo apt update -y```
puis
```sudo apt install php7.4```

Rédemarez le système, et vous devriez avoir tous les prérequis pour le projet.

Vous pouvez vérifier les prérequis avec les commandes suivantes : 
 * man mcrcon
 * man php
 * man java

## Installation du Projet :

###    Fichiers :
Pour poursuivre l'installation du projet vous devez transférer le dossier principal de git vers votre machine Linux. Peut importe l'emplacement de celui-ci tant que vous ne modifiez pas l'arborescence en interne au dossier. Ensuite veuillez activer les permissions d'exécution de tous les fichiers contenu dans celui-ci. Pour cela tapez les commandes suivantes : 

```
sudo chmod +x start.sh
sudo chmod +x stop.sh
sudo chmod +x reset.sh
sudo chmod +x backup.sh
sudo chmod +x send.sh
sudo chmod +x properties.sh
sudo chmod +x restart.sh
sudo chmod +x delete.sh
sudo chmod +x rconlist.sh
sudo chmod +x servport.sh
sudo chmod +x install.sh
```

###    Réseau : 

Pour faire fonctionner le projet vous devez réalier un forwarding de port sur votre routeur Wi-Fi. Pour cela rendez vous sur l'interface de configuration de votre routeur. L'accès peut être différent suivant le type de routeur. Renseignez vous sur le site de votre opérateur réseau.
Voici donc tous les forwarding de ports à mettre en place : 
* Un premier en TCP/UDP vers le port 25565 pour le serveur Minecraft.
* Un second en TCP/UDP vers le port 25575 pour le service Rcon.
* Un troisième (si vous le souhaitez) en SSH vers le port 22 pour un accès SSH à distance.

### Services :
Enfin il faut configurer crontab pour pouvoir faire des backups. Pour cela rendez vous dans le fichier suivant :
```/etc/crontab```
Vous devez ajouter la ligne suivante juste avant le # en fin de fichier mais en remplaçant '¤' par la direction de fichier dans laquelle vous avez coller le fichier de git : 
``0  0  */1  * * *       ¤/ProjetSi/backup.sh``

### Web : 
Pour configurer votre interface web, rendez vous dans l'emplacement où votre dossier php se situe et tapez la commande suivante :
```php -S localhost:port ```
Enfin il faut modifier "port" par les ports présents dans le fichier "index.php" lorsque vous lancez un serveur. Pensez aussi à modifer les ports dans "index.php" si vous créez un nouveau serveur ou en modifier les ports.

Enfin, si vous le souhaitez vous pouvez héberger le serveur web via un service tel qu'Apache pour rendre l'interface accessible depuis un navigateur (pensez à faire un forwarding sur votre routeur).