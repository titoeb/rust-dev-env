FROM rust:1.55
ARG USER_NAME
ARG USER_EMAIL
# Install cl-tools
RUN apt-get upgrade \
    && apt-get update --yes \
    && apt-get install --yes zsh less curl vim coreutils
# Create and set non-root user.
RUN useradd -ms /bin/bash ${USER_NAME}
USER ${USER_NAME}
# Install Oh-My-ZSH
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
# Configure Git
RUN git config --global user.name "${USER_NAME}" \
    && git config --global user.email "${USER_EMAIL}" \
    && git config --global core.editor "vim"
# Make sure zsh is normal entrypoint.
ENTRYPOINT ["/bin/zsh", "-c"]