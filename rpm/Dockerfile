FROM fedora:30

RUN dnf install -y make mock wget
#RUN bash -c "for dist in epel-8-x86_64 fedora-29-x86_64 fedora-30-x86_64; do mock --isolation=simple -r \$dist --init; done" # Enable this when we can build with --privileged/--cap-add=SYS_ADMIN

RUN useradd build
RUN gpasswd -a build mock

#RUN mkdir -p /brave-keyring/output

VOLUME /brave-release
WORKDIR /brave-release
USER build

ENTRYPOINT [ "make", "build" ]
