# Utilisez une image de base Alpine Linux pour réduire la taille de l'image
FROM mariadb:latest

# Copiez le fichier de configuration personnalisé pour MariaDB dans le container
COPY ./srcs/mariadb/conf/my.cnf /etc/mysql/my.cnf

# Exposez le port 3306 pour le trafic de la base de données
EXPOSE 3306

# Démarrez le service MariaDB lors du lancement du container
CMD ["mysqld"]
