postgres:
	@if [ ! "$$(docker ps -aq -f name=postgres_local)" ]; then \
    		docker run --name postgres_local -p 5433:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=simple_bank_secret -d postgres:latest; \
	else \
    		docker start postgres_local; \
	fi

createdb:
	 docker exec -it postgres_local createdb --username=admin --owner=admin simple_bank

dropdb:
	 docker exec -it postgres_local dropdb --username=admin --owner=admin simple_bank

.PHONY: postgres createdb dropdb
