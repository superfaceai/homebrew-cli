require "language/node"

class Superface < Formula
  desc "Let AI connect the APIs for you"
  homepage "https://github.com/superfaceai/cli"
  url "https://github.com/superfaceai/cli/releases/download/v4.1.0/superfaceai-cli-v4.1.0.tgz"
  sha256 "0cf5153cf5166a3d1e959806f4282170ee1dd777017e561413ec053be152d789"
  license "MIT"

  depends_on "node@18"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]

    deuniversalize_machos
  end

  def caveats
    "
    Thanks for checking out Superface.ai!
    
    For help, run: superface --help
    Documentation: https://sfc.is/docs
    Questions or feedback: https://sfc.is/discussions
    "
  end

  test do
    # CLI functionalities are dependent on authentication,
    # so we're simply testing the CLI runs
    assert shell_output("#{bin}/superface help").strip.include?("COMMANDS"), "Help should contain COMMANDS section"

    # TODO: We could possibly test `execute` command
  end
end
