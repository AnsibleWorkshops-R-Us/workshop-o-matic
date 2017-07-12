# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

    # define this box so Vagrant doesn't call it "default"
    config.vm.define "workshop-o-matic"

    # disable the key insertion, because the insecure key is good enough for a workshop box
    config.ssh.insert_key = false

    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    config.vm.box = "boxcutter/ubuntu1604"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network "private_network", ip: "192.168.33.23"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    # Customize the amount of memory on the VM:
       vb.memory = "1024"
     end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
    # such as FTP and Heroku are also available. See the documentation at
    # https://docs.vagrantup.com/v2/push/atlas.html for more information.
    # config.push.define "atlas" do |push|
    #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
    # end

    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.
    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL

    # BEGIN Landrush (https://github.com/phinze/landrush) configuration
    # This section will only be triggered if you have installed "landrush"
    #     vagrant plugin install landrush
    if Vagrant.has_plugin?('landrush')
        config.landrush.enable
        config.landrush.tld = 'vagrant.dev'

        # let's use the Google free DNS
        config.landrush.upstream '8.8.8.8'
        config.landrush.guest_redirect_dns = false
    end
    # END Landrush configuration

    #------------------------------
    # Caching Settings (if enabled)
    #------------------------------
    # BEGIN Vagrant-Cachier (https://github.com/fgrehm/vagrant-cachier) configuration
    # This section will only be triggered if you have installed "vagrant-cachier"
    #     vagrant plugin install vagrant-cachier
    if Vagrant.has_plugin?('vagrant-cachier')
       # Use a vagrant-cachier cache if one is detected
       config.cache.auto_detect = true

       # set vagrant-cachier scope to :box, so other projects that share the
       # vagrant box will be able to used the same cached files
       config.cache.scope = :box

       # and lets specifically use the apt cache (note, this is a Debian-ism)
       config.cache.enable :apt

       # # use the generic cache bucket for Maven
       # config.cache.enable :generic, {
       #       "maven" => { cache_dir: "/home/vagrant/.m2/repository" },
       # }
       #
       # # set the permissions for .m2 so we can use Maven properly
       # config.vm.provision :shell, :name => "set Maven .m2 permissions", :inline => "chown vagrant:vagrant /home/vagrant/.m2"
    end
    # END Vagrant-Cachier configuration




    #------------------------
    # Provisioning Scripts
    #    These scripts run in the order in which they appear, and setup the virtual machine (VM) for us.
    #------------------------

    # Shell script to set up swap space for this VM

    # If a customized version of this script exists in the config folder, use that instead
    if File.exists?("config/increase-swap.sh")
        config.vm.provision :shell, :name => "creating a swap file", :inline => "echo '   > > > running local increase-swap.sh to ensure enough memory is available, via a swap file.'"
        config.vm.provision :shell, :name => "creating a swap file with a local increase-swap.sh script", :path => "config/increase-swap.sh"
    else
        config.vm.provision :shell, :name => "creating a swap file", :inline => "echo '   > > > running default increase-swap.sh scripte to ensure enough memory is available, via a swap file.'"
        config.vm.provision :shell, :name => "creating a swap file with the default increase-swap.sh script", :path => "increase-swap.sh"
    end


    # Shell script to set apt sources.list to something appropriate (close to you, and actually up)
    # via apt-spy2 (https://github.com/lagged/apt-spy2)

    # If a customized version of this script exists in the config folder, use that instead
    if File.exists?("config/apt-spy-2-bootstrap.sh")
        config.vm.provision :shell, :name => "apt-spy-2, locating a nearby mirror", :inline => "echo '   > > > running local apt-spy2 to locate a nearby mirror (for quicker installs). Do not worry if it shows an error, it will be OK, there is a fallback.'"
        config.vm.provision :shell, :name => "apt-spy-2, running custom apt-spy-2-bootstrap", :path => "config/apt-spy-2-bootstrap.sh"
    else
        config.vm.provision :shell, :name => "apt-spy2, locating a nearby mirror", :inline => "echo '   > > > running default apt-spy2 to locate a nearby mirror (for quicker installs). Do not worry if it shows an error, it will be OK, there is a fallback.'"
        config.vm.provision :shell, :name => "apt-spy2, running default apt-spy-2-bootstrap", :path => "apt-spy-2-bootstrap.sh"
    end

    # Shell script to finish provisioning this VM (run last, it's the last word)
    # If a customized version of this script exists in the config folder, use that instead
    if File.exists?("config/bootstrap.sh")
        config.vm.provision :shell, :name => "bootsrap", :inline => "echo '   > > > running local bootstrap.sh to finish provisioning this VM.'"
        config.vm.provision :shell, :name => "running the local bootstrap script", :path => "config/bootstrap.sh"
    else
        config.vm.provision :shell, :name => "bootstrap", :inline => "echo '   > > > running default bootstrap.sh to finish provisioning this VM.'"
        config.vm.provision :shell, :name => "running the default bootstrap script", :path => "bootstrap.sh"
    end

    # Message to display to user after 'vagrant up' completes
    config.vm.post_up_message = "Setup of 'workshop-o-matic' is now COMPLETE!\nYou can SSH into the new VM via 'vagrant ssh'"

end
