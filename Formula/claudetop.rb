class Claudetop < Formula
  desc "Htop-style monitor for Claude Code agents and subagent swarms"
  homepage "https://github.com/braynemesis/claudetop"
  url "https://github.com/braynemesis/claudetop/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "e6b8ec0e02b2a8f399bcc5d51862b96f186c2c779af099d1321ee1192d9050ec"
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

  test do
    assert_match "claudetop 0.1.2", shell_output("#{bin}/claudetop --version")
    (testpath/"claude").mkpath
    assert_equal "[]\n", shell_output("CLAUDETOP_CLAUDE_DIR=#{testpath/"claude"} #{bin}/claudetop --json")
  end
end
