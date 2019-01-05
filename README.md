# LEMPStack
Ubuntu 14.04
</br>
<h2>1. Install the Nginx Web Server</h2>
<pre>sudo apt-get update
sudo apt-get install nginx</pre>
Test webserver pada browser
<p><pre>http://server_domain_name_or_IP</pre>
<h2>2. Install MySQL to Manage Site Data</h2>
<pre>sudo apt-get install mysql-server
sudo mysql_install_db
sudo mysql_secure_installation</pre>
<h2>3. Install PHP for Processing</h2>
<pre>sudo apt-get install php5-fpm php5-mysql
sudo nano /etc/php5/fpm/php.ini</pre>
Cari text cgi.fix_pathinfo dan rubah menjadi cgi.fix_pathinfo=0
<p><pre>sudo service php5-fpm restart</pre>
<h2>4. Configure Nginx to Use our PHP Processor</h2>
<pre>sudo nano /etc/nginx/sites-available/default</pre>
<pre>
server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /usr/share/nginx/html;
    index index.php index.html index.htm;

    server_name server_domain_name_or_IP;

    location / {
        try_files $uri $uri/ =404;
    }

    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
</pre>
<p><pre>sudo service nginx restart</pre>
