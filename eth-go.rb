require 'formula'

class EthGo < Formula

  version '0.5.0-rc9'

  homepage 'https://github.com/ethereum/eth-go'
  head 'https://github.com/ethereum/eth-go.git', :branch => 'develop'
  url 'https://github.com/ethereum/eth-go.git', :branch => 'master'

  depends_on 'go' => :build
  depends_on 'mercurial'
  depends_on 'gmp'
  depends_on 'leveldb'
  depends_on 'pkg-config'

  keg_only "No executable"

  def install
    ENV["PKG_CONFIG_PATH"] = "#{HOMEBREW_PREFIX}/opt/qt5/lib/pkgconfig"

    ENV["GOPATH"] = prefix
    ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"

    system "go", "env"
    system "go", "get", "-d", "."
    system "go", "build", "-v", "."

    # lib.install Dir['*']
  end
end