package main

import (
	"fmt"
	"time"

	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest() (string, error) {
	ticker := time.NewTicker(1 * time.Minute)
	defer ticker.Stop()

	start := time.Now()

	go func() {
		for {
			select {
			case t := <-ticker.C:
				term := t.Sub(start)
				fmt.Printf("Term %f[sec]", term.Seconds())
			}
		}
	}()

	<-make(chan bool) // 無限に待つ

	return fmt.Sprintf("3年も一緒に暮らしたのに、猫がまったく懐かなくて悲しい"), nil
}

func main() {
	lambda.Start(HandleRequest)
}
