-- name: GetMedia :one
SELECT * FROM media
WHERE id = $1;

-- name: ListMedia :many
SELECT * FROM media
WHERE (sqlc.narg('media_type')::text IS NULL OR type = sqlc.narg('media_type'))
ORDER BY id;

-- name: CreateMedia :one
INSERT INTO media (type, title, status, synopsis, release_year, episodes, runtime, track_count, cover_image)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING *;

-- name: UpdateMedia :one
UPDATE media SET
                 type         = COALESCE(sqlc.narg('type'), type),
                 title        = COALESCE(sqlc.narg('title'), title),
                 status       = COALESCE(sqlc.narg('status'), status),
                 synopsis     = COALESCE(sqlc.narg('synopsis'), synopsis),
                 release_year = COALESCE(sqlc.narg('release_year'), release_year),
                 episodes     = COALESCE(sqlc.narg('episodes'), episodes),
                 runtime      = COALESCE(sqlc.narg('runtime'), runtime),
                 track_count  = COALESCE(sqlc.narg('track_count'), track_count),
                 cover_image  = COALESCE(sqlc.narg('cover_image'), cover_image)
WHERE id = sqlc.arg('id')
    RETURNING *;

-- name: DeleteMedia :execrows
DELETE FROM media WHERE id = $1;