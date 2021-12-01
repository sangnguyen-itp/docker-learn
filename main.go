package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"os"
)

func init() {
	godotenv.Load()
}

func main()  {
	r := gin.Default()

	r.GET("/ping", func(context *gin.Context) {
		context.JSON(200, gin.H{
			"msg": fmt.Sprintf("pong - %s", os.Getenv("WELCOME")),
		})
	})

	r.Run(fmt.Sprintf(":%s", os.Getenv("SERVICE_PORT")))
}
