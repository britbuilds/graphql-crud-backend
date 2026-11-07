# Loads example rows from db/seed.sql into the database.
Get-Content db/seed.sql | docker compose exec -T db psql -U postgres -d appdb
