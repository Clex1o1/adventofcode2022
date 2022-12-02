input = File.read!('input')

elvesPackages = String.split(input, "\n\n")
  |> Enum.map(&String.split(&1, "\n"))


elvesPackages = Enum.map(elvesPackages, fn(elvesPackage) ->
  Enum.reduce(elvesPackage, 0, fn(package, acc) ->
    # to interger
    package = String.to_integer(package)
    package + acc

  end)
end)
IO.inspect(elvesPackages)


# get maximum of packages
max = Enum.max(elvesPackages)

IO.puts("Maximum of packages: #{max}")



# get max 3 packages
max3 = Enum.sort(elvesPackages,:desc)
  |> Enum.take(3)

totalMax3 = Enum.sum(max3)

IO.puts("Total of max 3 packages: #{totalMax3}")
