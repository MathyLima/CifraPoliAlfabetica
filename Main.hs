
import System.IO (hFlush, stdout)
import Utils.RandomKey (generateKeys)
import Cypher.PolyAlpha (polyAlphaCipherE, polyAlphaCipherD)

-- Função auxiliar para ler entrada com prompt
prompt :: String -> IO String
prompt text = do
  putStr text
  hFlush stdout
  getLine

-- Menu principal
main :: IO ()
main = do
  putStrLn "=== Cifra Polialfabética ==="
  putStrLn "1. Criptografar"
  putStrLn "2. Descriptografar"
  opcao <- prompt "Escolha uma opção (1 ou 2): "

  case opcao of
    "1" -> do
        nStr <- prompt "Quantas chaves deseja gerar? "
        let n = read nStr :: Int
        keys <- generateKeys n
        putStrLn "\nChaves geradas:"

        mapM_ print keys

        putStrLn "\nChaves geradas (copie e use exatamente assim na descriptografia):"
        putStrLn (unwords keys)
        msg <- prompt "\nDigite a mensagem a ser criptografada: "
        let result = polyAlphaCipherE keys msg
        putStrLn "\nMensagem criptografada:"
        putStrLn result

    "2" -> do
        keysStr <- prompt "Digite as chaves usadas, separadas por espaço: "
        let keys = words keysStr
        msg <- prompt "\nDigite a mensagem criptografada: "
        let result = polyAlphaCipherD keys msg
        putStrLn "\nMensagem descriptografada:"
        putStrLn result

    _ -> putStrLn "Opção inválida. Encerrando."