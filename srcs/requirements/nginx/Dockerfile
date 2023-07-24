# Fichier de configuration NGINX personnalisé pour le projet Inception

# Configurer le worker_processes en fonction du nombre de cœurs CPU disponibles
worker_processes 1;

# Inclure les fichiers de configuration pour les sites disponibles
include /etc/nginx/conf.d/*.conf;

# Configurer le bloc events pour les connexions
events {
    worker_connections 1024;
}

# Configurer les logs d'accès
http {
    log_format combined '$remote_addr - $remote_user [$time_local] '
                      '"$request" $status $body_bytes_sent '
                      '"$http_referer" "$http_user_agent"';
    access_log /var/log/nginx/access.log combined;

    # Configurer le virtual host pour le site WordPress
    server {
        listen 80;
        server_name shammouc.42.fr;

        # Redirection HTTP vers HTTPS
        return 301 https://$host$request_uri;
    }

    # Configurer le virtual host pour le site WordPress en HTTPS
    server {
        listen 443 ssl;
        server_name login.42.fr;

        # Chemin des certificats TLS
        ssl_certificate /etc/nginx/ssl/server.crt;
        ssl_certificate_key /etc/nginx/ssl/server.key;

        # Configuration SSL
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers HIGH:!aNULL:!MD5;

        # Emplacement des fichiers du site WordPress
        root /var/www/html/wordpress;
        index index.php;

        location / {
            try_files $uri $uri/ /index.php?$args;
        }

        # Configurer l'exécution de fichiers PHP avec php-fpm
        location ~ \.php$ {
            include fastcgi_params;
            fastcgi_pass wordpress:9000; # wordpress est le nom du service php-fpm dans le docker-compose.yml
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
    }
}
