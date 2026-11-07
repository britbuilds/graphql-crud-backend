# Runs goose migrations against the database.
# Usage: ./migrate.ps1 up | down | status | create add_something sql
$db = if ($env:DATABASE_URL) { $env:DATABASE_URL } else { "postgres://postgres:dev@localhost:5432/appdb" }
go tool goose -s -dir db/migrations postgres $db @args
