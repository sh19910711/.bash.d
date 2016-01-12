FROM .bash.d/bundle

# Install PhantomJS 1.9.8
RUN apt-get update && apt-get install -y build-essential chrpath libssl-dev libxft-dev
ENV PHANTOMJS="phantomjs-1.9.8-linux-x86_64"
WORKDIR /tmp
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOMJS.tar.bz2
RUN tar xjf $PHANTOMJS.tar.bz2
RUN mv $PHANTOMJS /usr/local/share
RUN ln -sf /usr/local/share/$PHANTOMJS/bin/phantomjs /usr/local/bin
