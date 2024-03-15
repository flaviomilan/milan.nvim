defmodule ComplexHello do
  def hello do
    IO.puts("Enter your name: ")
    name = IO.gets("") |> String.trim()
    IO.puts("Hello, #{name}! Welcome to the complex Elixir program.")
  end
end

ComplexHello.hello()

