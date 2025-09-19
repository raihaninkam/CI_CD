package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("Hello World")

	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.String(200, "Hello, From Backend!")
	})

	r.Run("localhost:8080")
}
