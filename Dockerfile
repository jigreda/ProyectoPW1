FROM debian:latest

# Actualiza los repositorios e instala Apache, Perl, módulos Perl necesarios y nano
RUN apt-get update && \
    apt-get install -y \
        apache2 \
        libapache2-mod-perl2 \
        libdbi-perl \
        libdbd-mysql-perl \
        libdbd-mariadb-perl \
        libcgi-pm-perl \
        nano \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Habilita el módulo CGI de Apache
RUN a2enmod cgi

# Deshabilita configuración predeterminada de serve-cgi-bin para evitar conflictos
RUN a2disconf serve-cgi-bin

# Copia y habilita configuraciones personalizadas de Apache
COPY servername.conf /etc/apache2/conf-available/servername.conf
RUN a2enconf servername

# Habilita el módulo headers de Apache
RUN a2enmod headers

# Configura Apache para reconocer y ejecutar scripts CGI
RUN echo "ScriptAlias /cgi-bin/ /var/www/cgi-bin/" >> /etc/apache2/apache2.conf
RUN echo "<Directory /var/www/cgi-bin>" >> /etc/apache2/apache2.conf
RUN echo "    Options +ExecCGI" >> /etc/apache2/apache2.conf
RUN echo "    AddHandler cgi-script .pl" >> /etc/apache2/apache2.conf
RUN echo "    Require all granted" >> /etc/apache2/apache2.conf
RUN echo "</Directory>" >> /etc/apache2/apache2.conf

# Crea el directorio CGI y copia los archivos
RUN mkdir -p /var/www/cgi-bin
COPY cgi-bin/ /var/www/cgi-bin/
RUN chmod +x /var/www/cgi-bin/*.pl

# Copia los archivos estáticos (HTML, CSS, JS)
COPY index.html /var/www/html/index.html
COPY css/ /var/www/html/css/
COPY js/ /var/www/html/js/

# Expone el puerto 80
EXPOSE 80

# Inicia Apache en primer plano
CMD ["apachectl", "-D", "FOREGROUND"]
