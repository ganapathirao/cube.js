FROM rustembedded/cross:x86_64-unknown-linux-musl

RUN apt-get update && \
    apt-get install -y curl pkg-config wget llvm clang libclang-dev

RUN wget https://www.openssl.org/source/openssl-1.1.1i.tar.gz -O - | tar -xz &&\
    cd openssl-1.1.1i && \
    ./config --prefix=/openssl --openssldir=/openssl/lib && \
    make -j $(nproc) && \
    make install && cd .. && rm -rf openssl-1.1.1i

ENV OPENSSL_DIR=/openssl \
    OPENSSL_INCLUDE_DIR=/openssl/include \
    OPENSSL_LIB_DIR=/openssl/lib

ENV PATH="/cargo/bin:$PATH"
