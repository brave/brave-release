Name:       brave-keyring
Version:    1.8
Release:    1
Summary:    Brave Browser keyring and repository files

License:    MPL-2.0
URL:        https://www.brave.com/
Source0:    ./brave-keyring-source.tar.gz
BuildArch:  noarch

Requires:   at

%description
The Brave keyring setup installs the keyring files necessary for validating
packages. In the future it will install the yum.repos.d repository for for
fetching the packages.

%prep
%setup -q


%build


%install
mkdir -p %{buildroot}/etc/pki/rpm-gpg
mkdir -p %{buildroot}/etc/cron.daily
mkdir -p %{buildroot}/usr/lib/sysctl.d/
install -m 644 etc/pki/rpm-gpg/RPM-GPG-KEY-brave -t %{buildroot}/etc/pki/rpm-gpg/
install -m 755 etc/cron.daily/brave-key-updater -t %{buildroot}/etc/cron.daily/
install -m 644 usr/lib/sysctl.d/50-brave.conf -t %{buildroot}/usr/lib/sysctl.d/

mkdir -p %{buildroot}/etc/yum.repos.d


%files
/etc/pki/rpm-gpg/RPM-GPG-KEY-brave
/etc/cron.daily/brave-key-updater
/usr/lib/sysctl.d/50-brave.conf

%post
service atd start
echo "sh /etc/cron.daily/brave-key-updater" | at now + 2 minute > /dev/null 2>&1

%changelog

