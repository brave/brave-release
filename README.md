# Brave-release

This repository contains files that will build the packages that we use to
enable our distribution on Linux platforms.

### Dependencies

1. To build RPMs you'll need the 'mock' package installed, as well as 'rpm-sign' if you plan on signing packages: `dnf install mock rpm-sign` on fedora, `mock rpmsign` on debian/ubuntu

2. To build debs you'll need the 'debhelper' and 'build-essential' packages installed: `apt install debhelper build-essential` on ubuntu/debian, `dpkg` on fedora.

### Instructions

##### RPM
Build the RPM. Note this will take a while the first time as it needs to create each dist's chroot:
```
$ cd rpm
$ make
```

Resulting packages will be placed in `brave-release/rpm/output`

##### deb

```
$ cd deb
$ make
```
##### deb (ARM)
```
$ cd deb
$ make deb-build-arm
```

Resulting packages will be placed in `brave-release/deb/output`

### Things likely to need updates

* Certificates. These change, and when these change we'll need to update this package to include new certificates and to revoke old ones.

* New dists. When a new EL, Fedora, Ubuntu, or Debian come about we'll need to build packages for them.

### Usage and testing

##### RPM

```
$ sudo rpm --import file.asc
$ sudo dnf install rpm/output/brave-release-1.0-1.fc29.x86_64.rpm
$ sudo dnf config-manager --set-enabled brave-release # (or brave-beta or brave-nightly)
$ sudo dnf install brave-browser
```

##### deb

```
$ cat deb/brave.asc | sudo apt-key add - # TODO: put real key here
$ sudo dpkg -i deb/output/brave-release-xenial.deb
$ sudo sed -i 's/Enabled: false/Enabled: true/' /etc/apt/sources.list.d/brave-release.sources
$ sudo apt-get update && sudo apt-get install brave-browser
```


### Improvements

* We should decide how we'll handle certificates. Should local copies live in here, or should we fetch them from somewhere known beforehand?
