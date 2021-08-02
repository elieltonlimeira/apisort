defmodule Apisort.Challenge.ApiSort do
  use Ecto.Schema
  import Ecto.Changeset

  schema "apisorts" do
    field :list, {:array, :float}

    timestamps()
  end

  @doc false
  def changeset(api_sort, attrs) do
    api_sort
    |> cast(attrs, [:list])
    |> validate_required([:list])
  end
end

defmodule GetNumbers do

  def get_numbers(i \\ 1, l \\ []) do
    case HTTPoison.get("#{"http://challenge.dienekes.com.br/api/numbers?page="}#{i}") do
      {:ok, %HTTPoison.Response{body: pre}} ->
      pre
      |> Jason.decode!()
      |> Map.get("numbers")
      |> get_list(l, i)
    end
  end

  defp get_list(map, l, i) when is_list(map) do
    if map == [] do
      sort_numbers(l)
    else
      list = l ++ map
      i2 = i+1
      get_numbers(i2, list)
    end
  end
  defp get_list(_map, l, i) do
    i2 = i+1
    get_numbers(i2, l)
  end

   def sort_numbers([_] = list), do: list

   def sort_numbers(list) do
     len = length(list)
     {a, b} = Enum.split(list, div(len, 2))
     a = sort_numbers(a)
     b = sort_numbers(b)
     merge(a, b, [])
   end

   defp merge([], b, acc), do: Enum.reverse(acc) ++ b
   defp merge(a, [], acc), do: Enum.reverse(acc) ++ a

   defp merge([a_head | a_tail] = a, [b_head | b_tail] = b, acc) do
     if a_head <= b_head do
       merge(a_tail, b, [a_head | acc])
     else
       merge(a, b_tail, [b_head | acc])
     end
   end
 end
