module Cypher.PolyAlpha (polyAlphaCipherE,polyAlphaCipherD) where

import Cypher.MonoAlpha (monoAlphaCipherE,monoAlphaCipherD)
import Utils.SplitText (splitEvery)


-- Função de criptografia polialfabética
polyAlphaCipherE :: [[Char]] -> String -> String
polyAlphaCipherE keys text =
  let blocks = splitEvery 26 text
      encryptedBlocks = zipWith monoAlphaCipherE (cycle keys) blocks
  in concat encryptedBlocks

-- Função de descriptografia polialfabética
polyAlphaCipherD :: [[Char]] -> String -> String
polyAlphaCipherD keys ciphered =
  let blocks = splitEvery 26 ciphered
      decryptedBlocks = zipWith monoAlphaCipherD (cycle keys) blocks
  in concat decryptedBlocks