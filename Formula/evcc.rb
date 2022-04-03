# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.89"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.89/evcc_0.89_macOS_all.tar.gz"
    sha256 "c029fe2f160eac194c3c9724029a407dcfb093999072c80a6eb3a28fcbf964a0"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.89/evcc_0.89_linux_amd64.tar.gz"
      sha256 "2f7e21d46c91fb069c239a0daf7ff930ced9689e153f6d62f69cbc29ac01bda4"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.89/evcc_0.89_linux_armv6.tar.gz"
      sha256 "fcfa37121cd4b1805e0ba8ee967e1e3318af513755eb53c6de660e3f3d965048"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.89/evcc_0.89_linux_arm64.tar.gz"
      sha256 "f287be3ba28a2b6b5fb24faafc6aba72f556cd56dd32c00346b61be28ee3fc5d"

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
