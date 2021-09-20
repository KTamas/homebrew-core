class PaxRunner < Formula
  desc "Tool to provision OSGi bundles"
  homepage "https://ops4j1.jira.com/wiki/spaces/paxrunner/overview"
  url "https://search.maven.org/remotecontent?filepath=org/ops4j/pax/runner/pax-runner-assembly/1.9.0/pax-runner-assembly-1.9.0-jdk15.tar.gz"
  version "1.9.0"
  sha256 "b1ff2039dc1e73b6957653d967d6ee028f9c79d663b9031a6b77a49932352dc1"

  livecheck do
    url "https://search.maven.org/remotecontent?filepath=org/ops4j/pax/runner/pax-runner-assembly/maven-metadata.xml"
    regex(%r{<version>v?(\d+(?:\.\d+)+)</version>}i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "cdaa1633b1cc5310e7e6d5edd558316c794d37869976494d6b1b4d465ce1129d"
  end

  def install
    (bin+"pax-runner").write <<~EOS
      #!/bin/sh
      exec java $JAVA_OPTS -cp  #{libexec}/bin/pax-runner-#{version}.jar org.ops4j.pax.runner.Run "$@"
    EOS

    libexec.install Dir["*"]
  end
end
