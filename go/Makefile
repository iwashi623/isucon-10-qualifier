SHELL=/bin/bash
.PHONY: build
build:
	go build -o isuumo main.go

.PHONY: bn
bn:
	make nginx-log-refresh
	make mysql-log-refresh
	/home/isucon/isuumo/bench/bench -target-url http://127.0.0.1

.PHONY: nginx-refresh
nginx-refresh:
	sudo rm /var/log/nginx/access.log && sudo systemctl reload nginx

.PHONY: mysql-log-refresh
mysql-log-refresh:
	now=`date +%Y%m%d-%H%M%S` && sudo mv /var/log/mysql/slow.log /var/log/mysql/slow.log.$now && sudo mysqladmin flush-logs

.PHONY: show-nginx-log
show-nginx-log:
	alp --sum -r -f /var/log/nginx/access.log --aggregates='/api/estate/[0-9]+,/api/chair/[0-9]+,/api/recommended_estate/[0-9]+,/api/chair/buy/[0-9]+,/api/estate/req_doc/[0-9]+'

.PHONY: show-slow-log
show-slow-log:
	sudo pt-query-digest /var/log/mysql/slow.log
