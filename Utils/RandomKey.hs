module Utils.RandomKey (generateKey, generateKeys) where

-- Importa a função randomRIO, usada para gerar um número aleatório dentro de um intervalo (ex: índice aleatório)
import System.Random (randomRIO)

-- Importa replicateM, que permite repetir uma ação IO várias vezes (ex: gerar várias chaves)
import Control.Monad (replicateM)

-- Alfabeto base
alphabet :: String
alphabet = ['a'..'z']

-- Embaralha uma string com base no algoritmo de Fisher-Yates (versão recursiva)
shuffle :: String -> IO String
shuffle [] = return []
shuffle xs = do
    i <- randomRIO (0, length xs - 1)
    let (left, (a:right)) = splitAt i xs
    rest <- shuffle (left ++ right)
    return (a : rest)

-- Gera uma chave aleatória (permutação do alfabeto)
generateKey :: IO String
generateKey = shuffle alphabet

-- Gera N chaves aleatórias
generateKeys :: Int -> IO [String]
generateKeys n = replicateM n generateKey
