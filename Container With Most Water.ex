defmodule Solution do
  @spec max_area(height :: [integer]) :: integer
  def max_area(height) do
    left = 0
    right = length(height) - 1

    height
    |> List.to_tuple()
    |> solve(left, right, 0)
  end

  def solve(_, l, r, ans) when l == r, do: ans
  def solve(height, l, r, ans) do
    lh = elem(height, l)
    rh = elem(height, r)

    ans = max(min(lh, rh) * (r - l), ans)
    cond do
      lh >= rh -> solve(height, l, r - 1, ans)
      lh < rh -> solve(height, l + 1, r, ans)
    end
  end
end
