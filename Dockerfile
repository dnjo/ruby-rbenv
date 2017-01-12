FROM buildpack-deps:jessie

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    cd ~/.rbenv && src/configure && make -C src && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN apt-get update && \
    apt-get install -y openjdk-7-jre-headless && \
    apt-get clean
