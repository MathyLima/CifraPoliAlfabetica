module Utils.ClearString (clearString) where

import Data.Char (ord, Char)
import qualified Data.Text as T
import qualified Data.Text.Normalize as N (NormalizationMode(NFD), normalize)

-- Verifica se o char é minusculo
isLower :: Char -> Bool
isLower c = c >= 'a' && c <='z'


-- Converte para minusculo
toLower :: Char -> Char
toLower c = toEnum (fromEnum c + 32)

-- Funcao que utiliza das auxiliares para converter
ensureLowerCase :: Char->Char
ensureLowerCase c
    | isLower c = c
    | c >= 'A' && c <= 'Z' = toLower c
    | otherwise = c


-- Convertendo toda a string
stringToLower :: [Char] -> [Char]
stringToLower [] = []
stringToLower (x:xs) = ensureLowerCase x : stringToLower xs


-- Remove acentos usando normalização Unicode
-- Esta função decompõe caracteres acentuados e remove os diacríticos
removeAcentos :: [Char] -> [Char]
removeAcentos =
    filter (\c -> not (isCombining c)) . T.unpack . N.normalize N.NFD . T.pack
  where
    isCombining c = let oc = ord c in oc >= 0x300 && oc <= 0x036F


-- Remove acentos e converte para minúsculas
clearString :: [Char] -> [Char]
clearString =  stringToLower . removeAcentos
