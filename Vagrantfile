machines = {
  :master => { :ip => "100", :mem => "1024", :cpu => "1" },
  :node01 => { :ip => "101", :mem => "512",  :cpu => "1" },
  :node02 => { :ip => "102", :mem => "512",  :cpu => "1" },
  :node03 => { :ip => "103", :mem => "512",  :cpu => "1" }
}

Vagrant.configure("2") do |config|

  config.vm.box = "roboxes/ubuntu2204"
  machines.each do |name, conf|
    config.vm.define name do |machine|
      machine.vm.hostname = name
      machine.vm.network "private_network", :ip => "10.10.10.#{conf[:ip]}"
      machine.vm.provider "hyperv" do |hv|
        hv.name = name
        hv.memory = conf[:mem]
        hv.cpus = conf[:cpu]
      end

      machine.vm.provision "shell", :path => "install_docker.sh"

      if name == :master
        machine.vm.provision "shell", :path => "master_setup.sh"
      else
        machine.vm.provision "shell", :path => "worker_setup.sh"
      end

    end
  end
end