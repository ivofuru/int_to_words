defmodule IntToWordsTest do
  use ExUnit.Case, async: true
  doctest IntToWords

  test "0" do
    assert {
      :ok, "ноль рублей"
    } == IntToWords.say(0, {"рубль", "рубля", "рублей"})
  end

  test "1" do
    assert {
      :ok, "один рубль"
    } == IntToWords.say(1, {"рубль", "рубля", "рублей"})
  end

  test "3" do
    assert {
      :ok, "три рубля"
    } == IntToWords.say(3, {"рубль", "рубля", "рублей"})
  end

  test "5" do
    assert {
      :ok, "пять рублей"
    } == IntToWords.say(5, {"рубль", "рубля", "рублей"})
  end

  test "-1" do
    assert {
      :ok, "минус один рубль"
    } == IntToWords.say(-1, {"рубль", "рубля", "рублей"})
  end

  test "-3" do
    assert {
      :ok, "минус три рубля"
    } == IntToWords.say(-3, {"рубль", "рубля", "рублей"})
  end

  test "10" do
    assert {
      :ok, "десять рублей"
    } == IntToWords.say(10, {"рубль", "рубля", "рублей"})
  end

  test "19" do
    assert {
      :ok, "девятнадцать рублей"
    } == IntToWords.say(19, {"рубль", "рубля", "рублей"})
  end

  test "20" do
    assert {
      :ok, "двадцать рублей"
    } == IntToWords.say(20, {"рубль", "рубля", "рублей"})
  end

  test "21" do
    assert {
      :ok, "двадцать один рубль"
    } == IntToWords.say(21, {"рубль", "рубля", "рублей"})
  end

  test "39" do
    assert {
      :ok, "тридцать девять рублей"
    } == IntToWords.say(39, {"рубль", "рубля", "рублей"})
  end

  test "94" do
    assert {
      :ok, "девяносто четыре рубля"
    } == IntToWords.say(94, {"рубль", "рубля", "рублей"})
  end

  test "100" do
    assert {
      :ok, "сто рублей"
    } == IntToWords.say(100, {"рубль", "рубля", "рублей"})
  end

  test "201" do
    assert {
      :ok, "двести один рубль"
    } == IntToWords.say(201, {"рубль", "рубля", "рублей"})
  end

  test "314" do
    assert {
      :ok, "триста четырнадцать рублей"
    } == IntToWords.say(314, {"рубль", "рубля", "рублей"})
  end

  test "523" do
    assert {
      :ok, "пятьсот двадцать три рубля"
    } == IntToWords.say(523, {"рубль", "рубля", "рублей"})
  end

  test "1000" do
    assert {
      :ok, "одна тысяча рублей"
    } == IntToWords.say(1000, {"рубль", "рубля", "рублей"})
  end

  test "1001" do
    assert {
      :ok, "одна тысяча один рубль"
    } == IntToWords.say(1001, {"рубль", "рубля", "рублей"})
  end

  test "2123" do
    assert {
      :ok, "две тысячи сто двадцать три рубля"
    } == IntToWords.say(2123, {"рубль", "рубля", "рублей"})
  end

  test "3919" do
    assert {
      :ok, "три тысячи девятьсот девятнадцать рублей"
    } == IntToWords.say(3919, {"рубль", "рубля", "рублей"})
  end

  test "13100" do
    assert {
      :ok, "тринадцать тысяч сто рублей"
    } == IntToWords.say(13100, {"рубль", "рубля", "рублей"})
  end

  test "28030" do
    assert {
      :ok, "двадцать восемь тысяч тридцать рублей"
    } == IntToWords.say(28030, {"рубль", "рубля", "рублей"})
  end

  test "102350" do
    assert {
      :ok, "сто две тысячи триста пятьдесят рублей"
    } == IntToWords.say(102350, {"рубль", "рубля", "рублей"})
  end

  test "501802" do
    assert {
      :ok, "пятьсот одна тысяча восемьсот два рубля"
    } == IntToWords.say(501802, {"рубль", "рубля", "рублей"})
  end

  test "999921" do
    assert {
      :ok, "девятьсот девяносто девять тысяч девятьсот двадцать один рубль"
    } == IntToWords.say(999921, {"рубль", "рубля", "рублей"})
  end

  test "2000000" do
    assert {
      :ok, "два миллиона рублей"
    } == IntToWords.say(2000000, {"рубль", "рубля", "рублей"})
  end

  test "1121532" do
    assert {
      :ok, "один миллион сто двадцать одна тысяча пятьсот тридцать два рубля"
    } == IntToWords.say(1121532, {"рубль", "рубля", "рублей"})
  end

  test "-999102351121" do
    assert {
      :ok, "минус девятьсот девяносто девять миллиардов сто два миллиона " <>
        "триста пятьдесят одна тысяча сто двадцать один рубль"
    } == IntToWords.say(-999102351121, {"рубль", "рубля", "рублей"})
  end

  test "21000051122" do
    assert {
      :ok, "двадцать один миллиард пятьдесят одна тысяча сто двадцать два рубля"
    } == IntToWords.say(21000051122, {"рубль", "рубля", "рублей"})
  end

end
