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
    index <span class="highlight">index.php</span> index.html index.htm;

    server_name <span class="highlight">server_domain_name_or_IP</span>;

    location / {
        try_files $uri $uri/ =404;
    }

    <span class="highlight">error_page 404 /404.html;</span>
    <span class="highlight">error_page 500 502 503 504 /50x.html;</span>
    <span class="highlight">location = /50x.html {</span>
        <span class="highlight">root /usr/share/nginx/html;</span>
    <span class="highlight">}</span>

    <span class="highlight">location ~ \.php$ {</span>
        <span class="highlight">try_files $uri =404;</span>
        <span class="highlight">fastcgi_split_path_info ^(.+\.php)(/.+)$;</span>
        <span class="highlight">fastcgi_pass unix:/var/run/php5-fpm.sock;</span>
        <span class="highlight">fastcgi_index index.php;</span>
        <span class="highlight">fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;</span>
        <span class="highlight">include fastcgi_params;</span>
    <span class="highlight">}</span>
}
</pre>
<p><pre>sudo service nginx restart</pre>
