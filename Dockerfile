FROM ubuntu:14.10

ADD http://download.processing.org/processing-3.0b5-linux64.tgz /
RUN tar xf /processing-3.0b5-linux64.tgz -C /root/

RUN apt-get update ; \
    apt-get install -y libxext6 libxrender1 libxtst6 libxi6 libXxf86vm1

# Disable the fork on the Java process, so that Docker keeps hooked up to it and doesn't shutdown immediately
RUN cp /root/processing-3.0b5/processing /root/processing-3.0b5/processing.BAK
RUN sed -i 's#java -splash:lib/about.jpg -Djna.nosys=true -Xmx256m processing.app.Base "$SKETCH" &#java -splash:lib/about.jpg -Djna.nosys=true -Xmx256m processing.app.Base "$SKETCH"#g' /root/processing-3.0b5/processing

VOLUME ["/root/sketchbook"]
ENV DISPLAY :0
ENTRYPOINT ["/root/processing-3.0b5/processing"]
