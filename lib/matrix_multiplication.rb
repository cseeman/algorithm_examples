# Taken as an example from https://replit.com/@rlmoser/MatrixMultiplication#main.rb
# All credit to the original author: Rachel Moser
class MatrixMuliplication
  def multiply(first, second)
    a = first[0][0]
    b = first [0][1]
    c = first[1][0]
    d = first[1][1]
    e = second[0][0]
    f = second [0][1]
    g = second[1][0]
    h = second[1][1]
    p1 = a * (f - h)
    p2 = (a + b) * h
    p3 = (c + d) * e
    p4 = d * (g - e)
    p5 = (a + d) * (e + h)
    p6 = (b - d) * (g + h)
    p7 = (a - c) * (e + f)
    [
      [p5 + p4 - p2 + p6, p1 + p2],
      [p3 + p4, p1 + p5 - p3 - p7]
    ]
  end
end
