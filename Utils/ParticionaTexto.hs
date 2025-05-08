module Utils.ParticionaTexto (splitEvery) where

splitEvery :: Int -> [a] -> [[a]]
splitEvery _ [] = []
splitEvery n xs = take n xs : splitEvery n (drop n xs)

-- se tiver menos que 26, ele retorna todo