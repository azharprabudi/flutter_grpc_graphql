package presentation

import (
	"io"

	uuid "github.com/satori/go.uuid"

	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/pkg/api/v1/proto"
)

type ChatPresentation struct {
}

func (cp *ChatPresentation) Send(stream proto.ChatService_SendServer) error {
	for {
		chat, err := stream.Recv()
		if err == io.EOF || err != nil {
			return err
		}

		stream.Send(&proto.Chat{
			Id:      uuid.NewV4().String(),
			Message: chat.Message,
			Name:    chat.Name,
		})
	}
}

func NewChatPresentation() proto.ChatServiceServer {
	return &ChatPresentation{}
}
