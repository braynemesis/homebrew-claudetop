class Claudetop < Formula
  desc "Htop-style monitor for Claude Code agents and subagent swarms"
  homepage "https://github.com/braynemesis/claudetop"
  url "https://github.com/braynemesis/claudetop/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "5ea4f8eb1af1477e14a56cf507c94b40f57281cbdc052f2f6bd3d6aafa6a2ae7"
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
    assert_match "claudetop 0.1.1", shell_output("#{bin}/claudetop --version")
    (testpath/"claude").mkpath
    assert_equal "[]\n", shell_output("CLAUDETOP_CLAUDE_DIR=#{testpath/"claude"} #{bin}/claudetop --json")
  end
end
