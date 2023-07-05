require "language/node"

class Superface < Formula
  desc "Let AI connect the APIs for you"
  homepage "https://github.com/superfaceai/cli"
  url "https://registry.npmjs.org/@superfaceai/cli/-/cli-4.0.0-beta.3.tgz"
  sha256 "cc4bc588153cb7dba39e44aee11c76a2c4214f865aa911e565d7b4ec6e0407ee"
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
