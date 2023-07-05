require "language/node"

class Superface < Formula
  desc "Let AI connect the APIs for you"
  homepage "https://github.com/superfaceai/cli"
  url "https://registry.npmjs.org/@superfaceai/cli/-/cli-4.0.0-beta.0.tgz"
  sha256 "ed1ff23e4b33c4825f1189822740f7a11c662e33c17121292e055f6e46269c9a"
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
