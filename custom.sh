#!/usr/bin/env sh

github() {
    git config --global diff.tool "vimdiff"
    git config --global user.name "Wang Yujian"
    git config --global user.email "simpleelegant@163.com"
    git config --global http.proxy "http://username:password@proxy.example.com"
    git config --global --bool http.sslVerify false
    git config --global --int http.postBuffer 524288000
}

cgo() {
    export CGO_LDFLAGS="-L/path/"
}

help() {
    printf "
a          config git for github.com
b          export CGO_LDFLAGS

choose: "
}

ok() {
    printf "Done.\n"
}

help
read label

case "${label}" in
    a)
        github && ok
        ;;
    b)
        cgo && ok
        ;;
    c)
        printf "Nothing to do.\n"
esac

