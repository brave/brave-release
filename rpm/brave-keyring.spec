Name:       brave-keyring
Version:    1.14
Release:    1
Summary:    Brave Browser keyring and repository files

License:    MPL-2.0
URL:        https://www.brave.com/
Source0:    ./brave-keyring-source.tar.gz
BuildArch:  noarch

%description
The Brave keyring setup installs the keyring files necessary for validating
packages.

%prep
%setup -q

%install
mkdir -p %{buildroot}/etc/pki/rpm-gpg
mkdir -p %{buildroot}%{_libexecdir}
mkdir -p %{buildroot}/usr/lib/sysctl.d/
install -m 644 etc/pki/rpm-gpg/RPM-GPG-KEY-brave -t %{buildroot}/etc/pki/rpm-gpg/
install -m 644 etc/pki/rpm-gpg/RPM-GPG-KEY-brave-beta -t %{buildroot}/etc/pki/rpm-gpg/
install -m 644 etc/pki/rpm-gpg/RPM-GPG-KEY-brave-nightly -t %{buildroot}/etc/pki/rpm-gpg/
install -m 755 bin/brave-key-updater -t %{buildroot}%{_libexecdir}/
install -m 644 usr/lib/sysctl.d/53-brave.conf -t %{buildroot}/usr/lib/sysctl.d/
mkdir -p %{buildroot}/etc/yum.repos.d


%files
/etc/pki/rpm-gpg/RPM-GPG-KEY-brave
/etc/pki/rpm-gpg/RPM-GPG-KEY-brave-beta
/etc/pki/rpm-gpg/RPM-GPG-KEY-brave-nightly
%{_libexecdir}/brave-key-updater
/usr/lib/sysctl.d/53-brave.conf

%post
timeout 10m sh -c "while ! sh %{_libexecdir}/brave-key-updater >/dev/null 2>&1; do sleep 2; done" &

%changelog
* Thu Jul 4 2023 Brave Software <support@brave.com> - 1.14-1
- Refrain from utilizing the 'at' command
