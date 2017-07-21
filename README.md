# workshop-o-matic
A basic [Vagrant](http://vagrantup.com) box to facilitate working with Ansible and Serverspec in a workshop setting, 
freely borrows from [Vagrant-DSpace](https://github.com/dspace/vagrant-dspace)

* Installs, via shell scripts, Ansible and ServerSpec, with a few configuration nicieties thrown in (mostly borrowed
from [Vagrant-DSpace](https://github.com/dspace/vagrant-dspace).
* Copies the workshop files for [our OR2017 workshop](https://github.com/AnsibleWorkshops-R-Us/OR2017). These can easily be
replaced with other workshop content.

## Requirements

* [Virtualization support must be enabled](http://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/), if you have a BIOS-based computer (aka a PC).
* [Vagrant](http://vagrantup.com/) version 1.8.3 or above.
* [VirtualBox](https://www.virtualbox.org/)

## Getting Started

1. Install all the required software (see above). Linux users take note: the versions of Vagrant and Virtualbox in your 
distribution's package manager are probably not current enough. Download and manually install the most recent version 
from [Vagrant](http://vagrantup.com) and [VirtualBox](https://www.virtualbox.org/). It will be OK. Both of these projects 
move quickly, and the distro managers have a hard time keeping up.
2. Clone a copy of 'workshop-o-matic' to your local computer (via Git)
   * `git clone git@github.com:AnsibleWorkshops-R-Us/workshop-o-matic.git`
   * If you don't have Git installed locally, you should be able to simply download the [latest 'workshop-o-matic' from GitHub (as a ZIP)](https://github.com/AnsibleWorkshops-R-Us/workshop-o-matic/archive/master.zip)
4. `cd [workshop-o-matic]/`
5. `vagrant up`
   * Wait for ~5 minutes while Vagrant finishes provisioning the box
   * Don't worry, it will finish soon.
6. Once complete, run `vagrant ssh` and you're ready to [follow along with one of our workshops](https://github.com/AnsibleWorkshops-R-Us). Or possibly [other workshops, as well](https://github.com/samvera/hydra/wiki/Dive-into-Hydra).

## Vagrant Plugin Recommendations

The following Vagrant plugins are not required, but they do make using Vagrant and the wokshop-o-matic more enjoyable.

* [Vagrant-VBGuest](https://github.com/dotless-de/vagrant-vbguest) - *Highly Recommended for VirtualBox* as it keeps VirtualBox Guest Additions up to date
  * `vagrant plugin install vagrant-vbguest`
* [Vagrant-Cachier](https://github.com/fgrehm/vagrant-cachier) - Caches packages between VMs.
* [Landrush](https://github.com/vagrant-landrush/landrush) - Mostly useful for web development work with Vagrant, however 
we're using it to configure usage of [Google Public DNS](https://developers.google.com/speed/public-dns/), to
give this VM a slight speed boost.
* [Vagrant-VBox-Snapshot](https://github.com/dergachev/vagrant-vbox-snapshot/) - Might come in handy for making snapshots of
your work in progress, though you probably ought to be using Git for that.
* [Vagrant-Notify](https://github.com/fgrehm/vagrant-notify) - Just plain handy, if you're rebuilding VMs a lot.

## License

[Apache 2.0](https://opensource.org/licenses/Apache-2.0)
