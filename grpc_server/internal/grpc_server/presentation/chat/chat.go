package presentation

import (
	"fmt"

	uuid "github.com/satori/go.uuid"

	"github.com/azharprabudi/flutter_grpc_graphql/grpc_server/pkg/api/v1/proto"
)

type ChatPresentation struct {
}

func (cp *ChatPresentation) Send(stream proto.ChatService_SendServer) error {
	prevChatID := ""
	for {
		chat, _ := stream.Recv()
		if chat != nil {
			fmt.Println(chat)
			fmt.Println(prevChatID)

			if prevChatID != chat.Id {
				stream.Send(&proto.Chat{
					Id:      uuid.NewV4().String(),
					Message: chat.Message,
					Name:    chat.Name,
				})
			}

			prevChatID = chat.Id
		}

	}
}

func NewChatPresentation() proto.ChatServiceServer {
	return &ChatPresentation{}
}
