


## 🔄 Como funciona a criptografia MonoAlpha

A função `monoAlphaCipherE` realiza a **criptografia** de uma string com base em uma **chave** de 26 letras minúsculas e sem repetição, representando o alfabeto embaralhado.

**Exemplo:**

```haskell
monoAlphaCipherE "qwertyuiopasdfghjklzxcvbnm" "Hello"
-- Resultado: "itssg"
```

### O que acontece:

1. A string "Hello" é convertida para "hello".
2. Cada letra é substituída pela correspondente na chave:
   - 'h' → 'i'
   - 'e' → 't'
   - 'l' → 's'
   - 'l' → 's'
   - 'o' → 'g'

---

## 🔓 Como funciona a descriptografia

A função `monoAlphaCipherD` **desfaz** a criptografia, usando a mesma chave:

```haskell
monoAlphaCipherD "qwertyuiopasdfghjklzxcvbnm" "itssg"
-- Resultado: "hello"
```

Cada caractere da mensagem criptografada é localizado na chave, e substituído pelo caractere correspondente do alfabeto original.

---

## 🔡 Como funciona `stringToLower`

A função `stringToLower` garante que **toda a entrada seja tratada em letras minúsculas**, pois a cifra só lida com caracteres minúsculos.

```haskell
stringToLower "HeLLo WoRLD"
-- Resultado: "hello world"
```

Ela percorre a string e:
- Mantém letras já minúsculas.
- Converte letras maiúsculas para minúsculas.
- Deixa os demais caracteres (como espaços e pontuação) inalterados.

Essa conversão é aplicada automaticamente **antes da criptografia ou descriptografia**.

---

## Como funciona `removeAcentos`
- T.pack: Converte uma String Haskell (que é uma lista de caracteres [Char]) em um Data.Text. O tipo Text é mais eficiente para processamento de texto do que String.
- N.normalize N.NFD: Aplica a normalização Unicode na forma NFD (Normalization Form Decomposition). Esse é o ponto crucial:
   - NFD decompõe caracteres acentuados em seus componentes base + diacríticos.
   - Por exemplo, a letra "á" é decomposta em dois caracteres Unicode: "a" (letra base) + "´" (acento agudo).
   - Após essa decomposição, todos os acentos se tornam caracteres separados dentro da faixa Unicode de "combining diacritical marks"(marcas diacríticas combinantes).
- T.unpack: Converte o Text normalizado de volta para uma String Haskell.
- filter (\c -> not (isCombining c)): Filtra a String, mantendo apenas os caracteres que NÃO são marcas diacríticas combinantes.
   - A função isCombining verifica se um caractere está na faixa Unicode de marcas diacríticas (0x300 a 0x36F).
   - Se o caractere for um diacrítico (acento), ele é removido da String final.
   - Se for um caractere normal, ele é mantido.

## Como Lipamos a Partição?
   ´´´
   Primeiro passamos para `removerAcentos` e depois tranformamos em minúsculo com `stringToLower`
   ´´´

---



## 🔄 Como funciona a criptografia PolyAlpha

A função `polyAlphaCipherE` realiza a **criptografia polialfabética** de uma string usando uma **lista de chaves** monoalfabéticas. Cada bloco de texto é criptografado com uma chave diferente, permitindo maior segurança.

**Exemplo:**

```haskell
polyAlphaCipherE ["qwertyuiopasdfghjklzxcvbnm", "mnbvcxzlkjhgfdsapoiuytrewq"] "MensagemMuitoSecreta"
-- Resultado: "exemplo de saída cifrada"
```

### O que acontece:

1. A string é dividida em blocos de até 26 caracteres.
2. Cada bloco é criptografado com uma chave diferente da lista (de forma cíclica).
3. A criptografia de cada bloco é feita com a `monoAlphaCipherE`.

---

## 🔓 Como funciona a descriptografia PolyAlpha

A função `polyAlphaCipherD` desfaz a criptografia, usando a mesma lista de chaves.

```haskell
polyAlphaCipherD ["qwertyuiopasdfghjklzxcvbnm", "mnbvcxzlkjhgfdsapoiuytrewq"] "exemplo de saída cifrada"
-- Resultado: "mensagemmuitosecreta"
```

### O que acontece:

1. A string cifrada é dividida nos mesmos blocos de 26 caracteres.
2. Cada bloco é descriptografado com a mesma chave usada na criptografia, usando `monoAlphaCipherD`.

---

## Funções auxiliares necessárias

- `monoAlphaCipherE` e `monoAlphaCipherD`: realizam a substituição com base em uma chave monoalfabética.
- `splitEvery`: divide a string em blocos de tamanho fixo (neste caso, 26).

```haskell
splitEvery :: Int -> [a] -> [[a]]
splitEvery _ [] = []
splitEvery n xs = take n xs : splitEvery n (drop n xs)
```

---


## Packages necessários 
```
 cabal install --lib text unicode-transforms
 cabal install random
```
