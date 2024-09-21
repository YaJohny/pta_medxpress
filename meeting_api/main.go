package main

import (
	"context"
	"os"
	"time"

	"github.com/gofiber/fiber/v3"
	"github.com/google/uuid"

	"github.com/livekit/protocol/auth"
	"github.com/livekit/protocol/livekit"
	lksdk "github.com/livekit/server-sdk-go/v2"
)

var host = "https://my.livekit.host"
var roomClient = lksdk.NewRoomServiceClient(host, os.Getenv("LIVEKIT_API_KEY"), os.Getenv("LIVEKIT_API_SECRET"))

func CreateRoom(c fiber.Ctx) error {
	room_name := uuid.New().String()

	room, err := roomClient.CreateRoom(context.Background(), &livekit.CreateRoomRequest{
		Name:            room_name,
		EmptyTimeout:    10 * 60, // 10 minutes
		MaxParticipants: 2,
	})
	if err != nil {
		return c.Status(500).JSON(
			fiber.Map{
				"error": err.Error(),
			},
		)
	}

	return c.Status(200).JSON(
		fiber.Map{
			"room_id":  room_name,
			"room_sid": room.Sid,
		},
	)
}

func getJoinToken(apiKey, apiSecret, room, identity, name string) (string, error) {
	at := auth.NewAccessToken(apiKey, apiSecret)
	grant := &auth.VideoGrant{
		RoomJoin: true,
		Room:     room,
	}
	at.AddGrant(grant).
		SetIdentity(identity).
		SetName(name).
		SetValidFor(time.Hour)

	return at.ToJWT()
}

func GenerateToken(c fiber.Ctx) error {
	api_key := os.Getenv("LIVEKIT_API_KEY")
	api_secret := os.Getenv("LIVEKIT_API_SECRET")
	room := c.Query("room_id")
	identity := c.Query("identity")
	name := c.Query("name")
	token, err := getJoinToken(api_key, api_secret, room, identity, name)
	if err != nil {
		return c.Status(500).JSON(
			fiber.Map{
				"error": err.Error(),
			},
		)
	}
	return c.Status(200).JSON(
		fiber.Map{
			"token":    token,
			"room_id":  room,
			"identity": identity,
		},
	)
}

func StopRoom(c fiber.Ctx) error {
	room_id := c.Query("room_id")
	_, err := roomClient.DeleteRoom(context.Background(), &livekit.DeleteRoomRequest{
		Room: room_id,
	})
	if err != nil {
		return c.Status(500).JSON(
			fiber.Map{
				"error": err.Error(),
			},
		)
	}
	return c.Status(200).JSON(
		fiber.Map{
			"room_id": room_id,
		},
	)

}

func load_envs() {

}

// func GenerateToken( c)

func main() {
	load_envs()
	app := fiber.App{}

	// rotues

	// app.Get("/", CreateRoom)
	app.Get("/room/token", GenerateToken)
	app.Post("/room", CreateRoom)
	app.Delete("/room", StopRoom)

	// stop
	// get token

	app.Listen(":9292")

}
