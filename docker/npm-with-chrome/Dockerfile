FROM .bash.d/npm

RUN apt-get update && apt-get install -y xvfb
RUN apt-get update && apt-get install -y chromium
ENV CHROME_BIN=/usr/bin/chromium

ENV DISPLAY=:99
ADD xvfb_exec /usr/local/bin
