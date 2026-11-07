# Regenerates Go code after you change db/queries.sql, db/migrations or graph/schema.graphqls.
docker run --rm -v "${PWD}:/src" -w /src sqlc/sqlc generate
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
go tool gqlgen generate
