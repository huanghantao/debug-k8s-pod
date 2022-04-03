package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "hello\n")
	})

	fmt.Println("listening...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
