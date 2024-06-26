upstream hello {
    server pyApp:8000;
}

server {
    listen 80;
    location / {
        proxy_pass http://hello;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_redirect off;
    }
    rewrite "/static/\d+/(.*)" /static/$1 last;
    location /static/ {
        alias /var/www/app/static/;
    }
    location /media/ {
        alias /var/www/app/media/;
    }
}