# TODO: comment, document (with spec and examples), refactor
defmodule IntToWords do
  @moduledoc false

  # relevant powers of ten
  @pw_10_1  10
  @pw_10_2  100
  @pw_10_3  1000
  @pw_10_6  1000000
  @pw_10_9  1000000000
  @pw_10_12 10 |> :math.pow(12) |> round()
  @pw_10_15 10 |> :math.pow(15) |> round()
  @pw_10_18 10 |> :math.pow(18) |> round()
  @pw_10_21 10 |> :math.pow(21) |> round()
  @pw_10_24 10 |> :math.pow(24) |> round()
  @pw_10_27 10 |> :math.pow(27) |> round()
  @pw_10_30 10 |> :math.pow(30) |> round()
  @pw_10_33 10 |> :math.pow(33) |> round()
  @pw_10_36 10 |> :math.pow(36) |> round()

  # wikipedia doesn't know how to call numbers outside this range
  @max_number @pw_10_36 - 1
  @min_number 1 - @pw_10_36

  @doc false
  def say(num, {unit_0, unit_1, unit_2} = units)
    when
      is_integer(num) and num >= 0 and num <= @max_number and
      is_binary(unit_0) and is_binary(unit_1) and is_binary(unit_2)
    do

    {:ok, make(num) <> " " <> elem(units, get_form(num))}
  end
  def say(num, {unit_0, unit_1, unit_2} = units)
    when
      is_integer(num) and num >= @min_number and num < 0 and
      is_binary(unit_0) and is_binary(unit_1) and is_binary(unit_2)
    do

    {:ok, "минус " <> make(-num) <> " " <> elem(units, get_form(-num))}
  end

  # 1-2 have two different forms
  defp say_with_sex(1, :male), do: "один"
  defp say_with_sex(1, :female), do: "одна"
  defp say_with_sex(2, :male), do: "два"
  defp say_with_sex(2, :female), do: "две"
  # 0, 3-19
  defp say_num(0), do: "нуль"
  defp say_num(3), do: "три"
  defp say_num(4), do: "четыре"
  defp say_num(5), do: "пять"
  defp say_num(6), do: "шесть"
  defp say_num(7), do: "семь"
  defp say_num(8), do: "восемь"
  defp say_num(9), do: "девять"
  defp say_num(10), do: "десять"
  defp say_num(11), do: "одиннадцать"
  defp say_num(12), do: "двенадцать"
  defp say_num(13), do: "тринадцать"
  defp say_num(14), do: "четырнадцать"
  defp say_num(15), do: "пятнадцать"
  defp say_num(16), do: "шестнадцать"
  defp say_num(17), do: "семнадцать"
  defp say_num(18), do: "восемнадцать"
  defp say_num(19), do: "девятнадцать"
  # tens: 20-90
  defp say_num(20), do: "двадцать"
  defp say_num(30), do: "тридцать"
  defp say_num(40), do: "сорок"
  defp say_num(50), do: "пятьдесят"
  defp say_num(60), do: "шестьдесят"
  defp say_num(70), do: "семьдесят"
  defp say_num(80), do: "восемьдесят"
  defp say_num(90), do: "девяносто"
  # hundreds: 100-900
  defp say_num(100), do: "сто"
  defp say_num(200), do: "двести"
  defp say_num(300), do: "триста"
  defp say_num(400), do: "четыреста"
  defp say_num(500), do: "пятьсот"
  defp say_num(600), do: "шестьсот"
  defp say_num(700), do: "семьсот"
  defp say_num(800), do: "восемьсот"
  defp say_num(900), do: "девятьсот"

  # other units and their forms
  defp say_unit(n, 0) when n < @pw_10_6, do: "тысяча"
  defp say_unit(n, 1) when n < @pw_10_6, do: "тысячи"
  defp say_unit(n, 2) when n < @pw_10_6, do: "тысяч"
  defp say_unit(n, 0) when n < @pw_10_9, do: "миллион"
  defp say_unit(n, 1) when n < @pw_10_9, do: "миллиона"
  defp say_unit(n, 2) when n < @pw_10_9, do: "миллионов"
  defp say_unit(n, 0) when n < @pw_10_12, do: "миллиард"
  defp say_unit(n, 1) when n < @pw_10_12, do: "миллиарда"
  defp say_unit(n, 2) when n < @pw_10_12, do: "миллиардов"
  defp say_unit(n, 0) when n < @pw_10_15, do: "триллион"
  defp say_unit(n, 1) when n < @pw_10_15, do: "триллиона"
  defp say_unit(n, 2) when n < @pw_10_15, do: "триллионов"
  defp say_unit(n, 0) when n < @pw_10_18, do: "квадриллион"
  defp say_unit(n, 1) when n < @pw_10_18, do: "квадриллиона"
  defp say_unit(n, 2) when n < @pw_10_18, do: "квадриллионов"
  defp say_unit(n, 0) when n < @pw_10_21, do: "квинтиллион"
  defp say_unit(n, 1) when n < @pw_10_21, do: "квинтиллиона"
  defp say_unit(n, 2) when n < @pw_10_21, do: "квинтиллионов"
  defp say_unit(n, 0) when n < @pw_10_24, do: "секстиллион"
  defp say_unit(n, 1) when n < @pw_10_24, do: "секстиллиона"
  defp say_unit(n, 2) when n < @pw_10_24, do: "секстиллионов"
  defp say_unit(n, 0) when n < @pw_10_27, do: "септиллион"
  defp say_unit(n, 1) when n < @pw_10_27, do: "септиллиона"
  defp say_unit(n, 2) when n < @pw_10_27, do: "септиллионов"
  defp say_unit(n, 0) when n < @pw_10_30, do: "октиллион"
  defp say_unit(n, 1) when n < @pw_10_30, do: "октиллиона"
  defp say_unit(n, 2) when n < @pw_10_30, do: "октиллионов"
  defp say_unit(n, 0) when n < @pw_10_33, do: "нониллион"
  defp say_unit(n, 1) when n < @pw_10_33, do: "нониллиона"
  defp say_unit(n, 2) when n < @pw_10_33, do: "нониллионов"
  defp say_unit(n, 0) when n < @pw_10_36, do: "дециллион"
  defp say_unit(n, 1) when n < @pw_10_36, do: "дециллиона"
  defp say_unit(n, 2) when n < @pw_10_36, do: "дециллионов"

  defp make_under_1000(num, divisor, sex) do
    left = num |> div(divisor) |> Kernel.*(divisor)
    right = rem(num, divisor)

    if right == 0 do
      say_num(left)
    else
      say_num(left) <> " " <> make(right, sex)
    end
  end

  defp make(num, sex \\ :male)
  defp make(1, sex), do: say_with_sex(1, sex)
  defp make(2, sex), do: say_with_sex(2, sex)
  defp make(num, _) when num < 20, do: say_num(num)
  defp make(num, sex) when num < 100, do: make_under_1000(num, 10, sex)
  defp make(num, sex) when num < 1000, do: make_under_1000(num, 100, sex)
  defp make(num, _) do
    {left, right} = split(num)
    sex = if num < 1000000, do: get_sex(left), else: :male
    left = make(left, sex) <> " " <> say_unit(num, get_form(left))
    if right == 0, do: left, else: left <> " " <> make(right)
  end

  # TODO: make this look better
  defp get_form(num) do
    case rem(num, 10) do
      1 ->
        tens = rem(num, 100)
        if tens > 10 && tens < 20, do: 2, else: 0
      n when n >= 2 and n < 5 ->
        tens = rem(num, 100)
        if tens > 10 && tens < 20, do: 2, else: 1
      _ -> 2
    end
  end

  # TODO: make this look better
  defp get_sex(num) do
    case rem(num, 10) do
      n when n == 1 or n == 2 ->
        tens = rem(num, 100)
        if tens > 10 && tens < 20, do: :male, else: :female
      _ -> :male
    end
  end

  defp split(n) when n < @pw_10_2,  do: {div(n, @pw_10_1 ), rem(n, @pw_10_1 )}
  defp split(n) when n < @pw_10_3,  do: {div(n, @pw_10_2 ), rem(n, @pw_10_2 )}
  defp split(n) when n < @pw_10_6,  do: {div(n, @pw_10_3 ), rem(n, @pw_10_3 )}
  defp split(n) when n < @pw_10_9,  do: {div(n, @pw_10_6 ), rem(n, @pw_10_6 )}
  defp split(n) when n < @pw_10_12, do: {div(n, @pw_10_9 ), rem(n, @pw_10_9 )}
  defp split(n) when n < @pw_10_15, do: {div(n, @pw_10_12), rem(n, @pw_10_12)}
  defp split(n) when n < @pw_10_18, do: {div(n, @pw_10_15), rem(n, @pw_10_15)}
  defp split(n) when n < @pw_10_21, do: {div(n, @pw_10_18), rem(n, @pw_10_18)}
  defp split(n) when n < @pw_10_24, do: {div(n, @pw_10_21), rem(n, @pw_10_21)}
  defp split(n) when n < @pw_10_27, do: {div(n, @pw_10_24), rem(n, @pw_10_24)}
  defp split(n) when n < @pw_10_30, do: {div(n, @pw_10_27), rem(n, @pw_10_27)}
  defp split(n) when n < @pw_10_33, do: {div(n, @pw_10_30), rem(n, @pw_10_30)}
  defp split(n) when n < @pw_10_36, do: {div(n, @pw_10_33), rem(n, @pw_10_33)}

end
