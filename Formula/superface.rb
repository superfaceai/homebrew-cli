require "language/node"

class Superface < Formula
  desc "Let AI connect the APIs for you"
  homepage "https://github.com/superfaceai/cli"
  url "https://github.com/superfaceai/cli/releases/download/v4.0.0-beta.14/superfaceai-cli-v4.0.0-beta.14.tgz"
  sha256 "fd591d533fffe8fd4884eb09e69a6c07d918df69eadbe87671a4de6f29baa66e"
  license "MIT"

  depends_on "node@18" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]

    deuniversalize_machos
  end

  test do
    # CLI functionalities are dependent on authentication,
    # so we're simply testing the CLI runs
    assert shell_output("#{bin}/superface help").strip.include?("COMMANDS"), "Help should contain COMMANDS section"

    # TODO: We could possibly test `execute` command
  end
end
