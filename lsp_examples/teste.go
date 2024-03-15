package main

import (
    "fmt"
    "os"
    "bufio"
)

func main() {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter your name: ")
    name, _ := reader.ReadString('\n')
    fmt.Printf("Hello, %s! Welcome to the complex Go program.\n", name)
}

