# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.88"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.88/evcc_0.88_macOS_all.tar.gz"
    sha256 "af6093051375c8c907f6ce6b022027eecc2c8c09c35b6322249fbb8904ce6b9c"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.88/evcc_0.88_linux_armv6.tar.gz"
      sha256 "b6a63a9cc11e6777ef58dda7208f26f3988568ed1daa4737cef763f3974b897c"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.88/evcc_0.88_linux_arm64.tar.gz"
      sha256 "7e455ae63ef1dd3903edda45204d4c8f7045098b1fa3672e52a2124f23fb31af"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.88/evcc_0.88_linux_amd64.tar.gz"
      sha256 "334718bb34fac4a81ea818366fd3e244db8dcd612d34621fa99283a417e16f27"

      def install
        bin.install "evcc"
      end
    end
  end

  plist_options :startup => false

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>Program</key>
    <string>#{bin}/evcc</string>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>#{var}/log/evcc.log</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/evcc.log</string>
  </dict>
</plist>

  EOS
  end

  test do
    system "#{bin}/evcc --version"
  end
end
