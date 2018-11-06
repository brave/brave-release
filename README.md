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
cd rpm
make
```

Resulting packages will be placed in `brave-release/rpm/output`

##### deb

```
cd deb
make
```

Resulting packages will be placed in `brave-release/deb/output`

# Things likely to need updates

* Certificates. These change, and when these change we'll need to update this package to include new certificates and to revoke old ones.

* New dists. When a new EL, Fedora, Ubuntu, or Debian come about we'll need to build packages for them.
