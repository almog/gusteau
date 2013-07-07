require './spec/spec_helper.rb'

describe Gusteau::SSHConfig do
  let(:nodes) { Gusteau::Config.new("./spec/config/gusteau.yml").nodes }
  subject { Gusteau::SSHConfig.new(nodes) }

  let(:config) do
    <<-eos
# BEGIN GUSTEAU NODES

Host development-playground
  HostName 192.168.100.21
  Port 22
  User root

Host production-db
  HostName db.myapp.com
  Port 22
  User billy

Host production-www
  HostName www.myapp.com
  Port 22
  User billy

Host staging-www
  HostName staging.myapp.com
  Port 22
  User root

# END GUSTEAU NODES
    eos
  end

  it "should generate a valid SSH config" do
    subject.to_s.must_equal config
  end
end