FROM ubuntu:resolute-20261024.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl git libatomic1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER ubuntu
WORKDIR /home/ubuntu

RUN curl https://mise.run | sh
COPY --chown=ubuntu:ubuntu dotfiles /home/ubuntu/.dotfiles/dotfiles
COPY --chown=ubuntu:ubuntu bootstrap.sh mise.toml /home/ubuntu/.dotfiles/

RUN /home/ubuntu/.dotfiles/bootstrap.sh --force && \
    /home/ubuntu/.local/bin/mise install

CMD [ "/bin/bash", "-l" ]
