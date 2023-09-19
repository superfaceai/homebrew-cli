require "language/node"

class Superface < Formula
  desc "Let AI connect the APIs for you"
  homepage "https://github.com/superfaceai/cli"
  url "https://github.com/superfaceai/cli/releases/download/v4.1.1/superfaceai-cli-v4.1.1.tgz"
  sha256 "71e7f24036772b379c2dcfaaafa3c689a8195905a641161a88d0e2acfbb9654a"
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
