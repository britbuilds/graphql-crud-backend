-- +goose Up
CREATE TABLE media (
                       id           SERIAL PRIMARY KEY,
                       type         TEXT NOT NULL,
                       title        TEXT NOT NULL,
                       status       TEXT,
                       synopsis     TEXT,
                       release_year INT,
                       episodes     INT,
                       runtime      INT,
                       track_count  INT,
                       cover_image  TEXT
);

-- +goose Down
DROP TABLE media;