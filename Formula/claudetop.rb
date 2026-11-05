class Claudetop < Formula
  desc "Htop-style monitor for Claude Code agents and subagent swarms"
  homepage "https://github.com/braynemesis/claudetop"
  url "https://github.com/braynemesis/claudetop/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "4acbc8c9e635882d5a962850477476089bb4f9fe1f0350eabc08f320e5481fac"
  license "MIT"

  depends_on "python@3.14"

  def install
    libexec.install "claudetop.py"
    python = formula_opt_bin("python@3.14")/"python3.14"
    (bin/"claudetop").write <<~SH
      #!/bin/bash
      exec "#{python}" "#{libexec}/claudetop.py" "$@"
    SH
    chmod 0755, bin/"claudetop"
  end

  def caveats
    <<~EOS
      Para abrir o monitor:

        claudetop

      Atalhos:
        ?  ajuda            /  filtrar
        1  precisa de mim    s  ordenar
        o  abrir sessão      l  logs
        x  parar job         q  sair

      Lê apenas ~/.claude (sem rede) e guarda preferências em ~/.cache/claudetop.
      Snapshot sem TUI: claudetop --once   |   JSON: claudetop --json
      Docs: https://github.com/braynemesis/claudetop
    EOS
  end

  test do
    assert_match "claudetop 0.2.1", shell_output("#{bin}/claudetop --version")
    (testpath/"claude").mkpath
    assert_equal "[]\n", shell_output("CLAUDETOP_CLAUDE_DIR=#{testpath/"claude"} #{bin}/claudetop --json")
  end
end
