

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


## Packages necessários 
```
cabal install text unicode-transforms
cabal install random
```
