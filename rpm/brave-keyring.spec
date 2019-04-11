Name:		brave-release
Version:	1.0
Release:	1%{?dist}
Summary:	Brave Browser keyring and repository files

License:	MPL-2.0
URL:		https://www.brave.com/
Source0:	http://i.bke.ro/brave-release-source.tar.gz
BuildArch:  noarch

%description
The Brave release setup installs the keyring files necessary for validating
packages. It also installs the yum.repos.d repository for for fetching
the packages.

%prep
%setup -q


%build


%install
mkdir -p %{buildroot}/etc/pki/rpm-gpg
install -m 644 etc/pki/rpm-gpg/RPM-GPG-KEY-brave -t %{buildroot}/etc/pki/rpm-gpg/
install -m 644 etc/pki/rpm-gpg/RPM-GPG-KEY-brave-old -t %{buildroot}/etc/pki/rpm-gpg/

mkdir -p %{buildroot}/etc/yum.repos.d
install -m 644 etc/yum.repos.d/brave.repo -t %{buildroot}/etc/yum.repos.d/


%files
/etc/pki/rpm-gpg/RPM-GPG-KEY-brave
/etc/pki/rpm-gpg/RPM-GPG-KEY-brave-old
/etc/yum.repos.d/brave.repo


%changelog

