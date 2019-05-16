PWD = $(shell pwd)

all: install run

update:
	docker run --rm -v "$(PWD):/app" composer:1.7.2 composer update
	docker run --rm -v "$(PWD):/app" composer:1.7.2 composer install

install:
	docker run --rm -v "$(PWD):/app" composer:1.7.2 composer install

run:
	docker-compose up

build:
	docker build -t bookshelf:dev .

test: install
	docker run --rm -v "$(PWD):/app" composer:1.7.2 vendor/bin/phpunit test

clean:
	docker-compose down
	docker run --rm -v "$(PWD):/app" composer:1.7.2 rm -rf vendor
