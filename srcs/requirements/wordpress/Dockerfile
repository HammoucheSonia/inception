# Utilisez une image de base Alpine Linux avec PHP-FPM pour réduire la taille de l'image
FROM wordpress:php7.4-fpm-alpine

# Installez les extensions PHP nécessaires pour WordPress (exemple : pdo, pdo_mysql, gd, etc.)
RUN docker-php-ext-install pdo pdo_mysql gd

# Copiez les fichiers du site WordPress dans le container
COPY ./srcs/wordpress /var/www/html/wordpress

# Définir les permissions pour les fichiers et dossiers du site WordPress
RUN chown -R www-data:www-data /var/www/html/wordpress

# Exposez le port 9000 pour PHP-FPM
EXPOSE 9000

# Démarrez le service php-fpm lors du lancement du container
CMD ["php-fpm"]
