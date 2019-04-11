Name:       brave-keyring
Version:    1.1
Release:    1%{?dist}
Summary:    Brave Browser keyring and repository files

License:    MPL-2.0
URL:        https://www.brave.com/
Source0:    https://i.bke.ro/brave-keyring-source.tar.gz
BuildArch:  noarch

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
install -m 644 etc/pki/rpm-gpg/RPM-GPG-KEY-brave -t %{buildroot}/etc/pki/rpm-gpg/
install -m 644 etc/cron.daily/brave-key-updater -t %{buildroot}/etc/cron.daily/
#install -m 644 etc/pki/rpm-gpg/RPM-GPG-KEY-brave-nightly -t %{buildroot}/etc/pki/rpm-gpg/

mkdir -p %{buildroot}/etc/yum.repos.d
#install -m 644 etc/yum.repos.d/brave-browser-release.repo -t %{buildroot}/etc/yum.repos.d/


%files
/etc/pki/rpm-gpg/RPM-GPG-KEY-brave
#/etc/pki/rpm-gpg/RPM-GPG-KEY-brave-nightly
#/etc/yum.repos.d/brave-browser-release.repo
/etc/cron.daily/brave-key-updater

%post
#if [ -f /etc/yum.repos.d/brave-browser-rpm-release.s3.brave.com*.repo ]; then
#    echo "Disabling old repo file: /etc/yum.repos.d/brave-browser-rpm-release.s3.brave.com*.repo"
#    sed -i 's/^enabled.*/enabled=0/g' /etc/yum.repos.d/brave-browser-rpm-release.s3.brave.com*.repo
#fi

source /etc/os-release
if [[ "$NAME" =~ "CentOS" || "$NAME" =~ "Red Hat Enterprise Linux" ]]; then
    echo "RPM signing with subkeys not supported in el7, please manually verify. For more details see https://github.com/brave/devops/issues/743"
fi
    service atd start
    echo "sh /etc/cron.daily/brave-key-updater" | at now + 2 minute > /dev/null 2>&1

%changelog

