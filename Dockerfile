FROM debian:jessie

LABEL maintainer="simpleelegant@163.com"

# use Aliyun's Debian mirror
RUN printf "\
deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib\n\
deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib\
" > /etc/apt/sources.list

RUN apt-get update  && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            g++ \
            gcc \
            git \
            libc6-dev \
            make \
            mercurial \
            openssl \
            pkg-config \
            vim \
            wget \
        && rm -rf /var/lib/apt/lists/*

ENV HOME /root

COPY custom.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/custom.sh

# Go
RUN curl -fsSL "https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz" \
        -o golang.tar.gz \
        && tar -C /usr/local -xzf golang.tar.gz \
        && rm golang.tar.gz
ENV GOROOT /usr/local/go
ENV GOPATH $HOME/gopath
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

# Vim
RUN curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
COPY .vimrc $HOME/
RUN vim -c PlugInstall -c qall!
RUN vim -c GoInstallBinaries -c qall!
RUN printf "colorscheme OceanicNext" >> $HOME/.vimrc
ENV TERM xterm-256color

WORKDIR $HOME
