module Cypher.MonoAlpha (monoAlphaCipherE,monoAlphaCipherD) where

import Utils.ClearString (clearString)

-- Função para criptografar
monoAlphaCipherE :: [Char] -> String -> String
monoAlphaCipherE key input = map (`substitute` key) (clearString input)
  where
    substitute c key = 
      let alphabet = ['a'..'z']
          index = getIndex c alphabet
      in if index >= 0 then key !! index else c

    getIndex c list = 
      case lookup c (zip list [0..]) of
        Just index -> index
        Nothing -> -1


-- Função para descriptografar
monoAlphaCipherD :: [Char] -> String -> String
monoAlphaCipherD key input = map (`substitute` key) (clearString input)
  where
    substitute c key = 
      let alphabet = ['a'..'z']
          index = getIndex c key
      in if index >= 0 then alphabet !! index else c

    getIndex c list = 
      case lookup c (zip list [0..]) of
        Just index -> index
        Nothing -> -1