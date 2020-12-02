defmodule ElixirHomework.Dialog do
  @moduledoc """
  This module can help to make dialog with user
  """
  @result_file "Info.txt"
  def start do
    info =
      ask(%{}, :name)
      |> ask(:age)
      |> ask(:hobbie)
      |> make_string()

    show(info)
    save_on_disk(info)
  end

  defp make_string(result) do
    Map.keys(result)
    |> Enum.map(fn key -> "Your #{key} is #{result[key]}" end)
    |> Enum.join("\n")
  end

  defp show(result), do: IO.puts(result)

  defp save_on_disk(result, path \\ @result_file), do: File.write(path, result)

  defp ask(state, type) do
    case type do
      :name -> IO.puts("Hello! \nWhat is your name?")
      :age -> IO.puts("How old are you, #{state.name}?")
      :hobbie -> IO.puts("What do you like to do at your free time?")
    end

    IO.read(:line)
    |> String.trim()
    |> save(type, state)
  end

  defp save(value, type, state), do: Map.put_new(state, type, value)
end
