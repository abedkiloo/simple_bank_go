postgres:
	@if [ ! "$$(docker ps -aq -f name=postgres_local)" ]; then \
    		docker run --name postgres_local -p 5433:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=simple_bank_secret -d postgres:latest; \
	else \
    		docker start postgres_local; \
	fi

createdb:
	 docker exec -it postgres_local createdb --username=admin --owner=admin simple_bank

dropdb:
	 docker exec -it postgres_local dropdb --username=admin  simple_bank
migrate_db_initial:
	migrate -path db/migration -database "postgres://admin:simple_bank_secret@localhost:5433/simple_bank?sslmode=disable" --verbose up
migrate_db_down_initial:
	migrate -path db/migration -database "postgres://admin:simple_bank_secret@localhost:5433/simple_bank?sslmode=disable" --verbose down
sqlc:
	sqlc generate
.PHONY: postgres createdb dropdb
