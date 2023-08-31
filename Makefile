SHELL=/bin/bash
api-server/%: ## api-server/${lang}docker-compose up with mysql and api-server 
	docker-compose -f docker-compose/$(shell basename $@).yaml down -v
	docker-compose -f docker-compose/$(shell basename $@).yaml up --build mysql api-server

isuumo/%: ## isuumo/${lang} docker-compose up with mysql and api-server frontend nginx
	docker-compose -f docker-compose/$(shell basename $@).yaml down -v
	docker-compose -f docker-compose/$(shell basename $@).yaml up --build mysql api-server nginx frontend

nginx-refresh:
	sudo rm /var/log/nginx/access.log && sudo systemctl reload nginx

show-nginx-log:
	alp --sum -r -f /var/log/nginx/access.log --aggregates='/api/estate/[0-9]+,/api/chair/[0-9]+,/api/recommended_estate/[0-9]+,/api/chair/buy/[0-9]+,/api/estate/req_doc/[0-9]+'

mysql-refresh:
	now=`date +%Y%m%d-%H%M%S` && sudo mv /var/log/mysql/slow.log /var/log/mysql/slow.log.$now && sudo mysqladmin flush-logs

show-slow-log:
	sudo pt-query-digest /var/log/mysql/slow.log

bn:
	nginx-refresh
	mysql-refresh
	./bench -target-url http://127.0.0.1
