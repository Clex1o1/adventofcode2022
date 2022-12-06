input = File.read!("./lib/day4/input")

input = Parse.parse(input)

flatInput =
  Enum.map(input, fn x ->
    String.split(x, ",")
    |> Enum.map(fn section ->
      String.split(section, "-")
      |> Enum.map(fn startEnd ->
        String.to_integer(startEnd)
      end)
    end)
    |> Enum.reduce(fn section2, section1 ->
      (Enum.at(section1, 0) in Enum.at(section2, 0)..Enum.at(section2, 1) &&
         Enum.at(section1, 1) in Enum.at(section2, 0)..Enum.at(section2, 1)) ||
        (Enum.at(section2, 0) in Enum.at(section1, 0)..Enum.at(section1, 1) &&
           Enum.at(section2, 1) in Enum.at(section1, 0)..Enum.at(section1, 1))
    end)
  end)

result =
  Enum.filter(flatInput, fn item ->
    item
  end)

IO.puts("Result: #{Enum.count(result)}")

## Part 2

flatInput =
  Enum.map(input, fn x ->
    String.split(x, ",")
    |> Enum.map(fn section ->
      String.split(section, "-")
      |> Enum.map(fn startEnd ->
        String.to_integer(startEnd)
      end)
    end)
    |> Enum.reduce(fn section2, section1 ->
      Enum.at(section1, 0) in Enum.at(section2, 0)..Enum.at(section2, 1) ||
        Enum.at(section1, 1) in Enum.at(section2, 0)..Enum.at(section2, 1) ||
        (Enum.at(section2, 0) in Enum.at(section1, 0)..Enum.at(section1, 1) ||
           Enum.at(section2, 1) in Enum.at(section1, 0)..Enum.at(section1, 1))
    end)
  end)

result =
  Enum.filter(flatInput, fn item ->
    item
  end)

IO.puts("Result: #{Enum.count(result)}")
