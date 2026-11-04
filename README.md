# homebrew-claudetop

Tap do [claudetop](https://github.com/braynemesis/claudetop) — monitor estilo `htop` para agentes do Claude Code.

```bash
brew tap braynemesis/claudetop
brew trust braynemesis/claudetop   # Homebrew 7+
brew install claudetop
```

Depois: `brew upgrade claudetop`.

Comando único, sem `tap`/`trust`: `brew install braynemesis/claudetop/claudetop`.

Atualizar:

```bash
brew upgrade claudetop
```

A fórmula instala o CLI isolado no prefixo do Homebrew e usa `python@3.14`.
