# LEMPStack
Ubuntu 14.04
</br>
<h2>1. Install the Nginx Web Server</h2>
<p>sudo apt-get update
<p>sudo apt-get install nginx
<p></br>  
<p>Try one of the lines that you receive in your web browser. It should take you to Nginx's default landing page:
<p>http://server_domain_name_or_IP
  </br>
<h2>2. Install MySQL to Manage Site Data</h2>
<p>sudo apt-get install mysql-server
<p>sudo mysql_install_db
<p>sudo mysql_secure_installation
  </br>
<h2>3. Install PHP for Processing</h2>
<p>sudo apt-get install php5-fpm php5-mysql
<p>sudo nano /etc/php5/fpm/php.ini
<p>search cgi.fix_pathinfo and changes cgi.fix_pathinfo=0
<p>sudo service php5-fpm restart
</br>
<h2>4. Configure Nginx to Use our PHP Processor</h2>
</br>
<p>sudo nano /etc/nginx/sites-available/default
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
<p>sudo service nginx restart
<h2>5. Create a PHP File to Test Configuration</h2>
<p>sudo nano /usr/share/nginx/html/info.php
<p><?php
phpinfo();
?>
</br>
<p>http://server_domain_name_or_IP/info.php
