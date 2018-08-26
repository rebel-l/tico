# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "Ubuntu1804"
    config.vm.box_url = "https://www.dropbox.com/s/lq0a011b8xhddpg/ubuntu1804lts5212.box?dl=1"
    config.ssh.insert_key = false

    config.hostmanager.enabled				= true
    config.hostmanager.manage_host			= true
    config.hostmanager.manage_guest			= true
    config.hostmanager.ignore_private_ip	= false
    config.hostmanager.include_offline		= true

    config.vm.define "Tico" do |node|
        node.vm.provider "virtualbox" do |vb|
            vb.name = "Tico"
        end
        node.vm.network :private_network, ip: "192.168.56.200"
        node.vm.hostname = 'tico.dev'
        node.hostmanager.aliases = 'www.tico.dev images.tico.dev assets.tico.dev'

        node.vm.provision "chef_solo" do |chef|
            chef.cookbooks_path = "./vendor/rebel-l/sisa/cookbooks"
            chef.roles_path = "./vendor/rebel-l/sisa/roles"
            chef.environments_path = "./vendor/rebel-l/sisa/environments"
            chef.data_bags_path = "./vendor/rebel-l/sisa/data_bags"
            chef.environment = "development"
            chef.add_role "WebServer"
            chef.add_recipe "Php::composer"
            chef.add_recipe "NodeJs"
            chef.add_recipe "Java"
            chef.add_recipe "Fop"
            chef.add_recipe "Cups"

            chef.json = {
                'NodeJs' => {
                    'bower' => true,
                    'gulp'  => true
                },
                'Php'   => {
                    'default'   => {
                        'version'   => '5.6'
                    }
                },
                'projects' => [
                    {
                        'name'			=> 'tico',
                        'type'			=> 'php-simple',
                        'server_name'	=> 'tico.dev',
                        'root'			=> '/vagrant/public',
                        'index'			=> 'index.php'
                    }
                ]
            }
        end
    end
end
