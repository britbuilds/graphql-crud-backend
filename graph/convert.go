package graph

import (
	"fmt"
	"strconv"

	"github.com/jackc/pgx/v5/pgtype"

	"graphql-crud-backend/graph/model"
	"graphql-crud-backend/internal/db"
)

func toGQLMedia(m db.Media) *model.Media {
	return &model.Media{
		ID:          strconv.Itoa(int(m.ID)),
		Type:        model.MediaType(m.Type),
		Title:       m.Title,
		Status:      textPtr(m.Status),
		Synopsis:    textPtr(m.Synopsis),
		ReleaseYear: intPtr(m.ReleaseYear),
		Episodes:    intPtr(m.Episodes),
		Runtime:     intPtr(m.Runtime),
		TrackCount:  intPtr(m.TrackCount),
		CoverImage:  textPtr(m.CoverImage),
	}
}

func textPtr(t pgtype.Text) *string {
	if !t.Valid {
		return nil
	}
	return &t.String
}

func intPtr(i pgtype.Int4) *int32 {
	if !i.Valid {
		return nil
	}
	return &i.Int32
}

func toText(s *string) pgtype.Text {
	if s == nil {
		return pgtype.Text{}
	}
	return pgtype.Text{String: *s, Valid: true}
}

func toInt4(i *int32) pgtype.Int4 {
	if i == nil {
		return pgtype.Int4{}
	}
	return pgtype.Int4{Int32: *i, Valid: true}
}

func parseID(id string) (int32, error) {
	n, err := strconv.ParseInt(id, 10, 32)
	if err != nil {
		return 0, fmt.Errorf("invalid id: %s", id)
	}
	return int32(n), nil
}
