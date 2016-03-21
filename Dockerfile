FROM java:7
MAINTAINER Johannes Goslar

ADD ./install_opts install_opts
RUN wget -O alfresco.bin http://dl.alfresco.com/release/community/5.0.d-build-00002/alfresco-community-5.0.d-installer-linux-x64.bin \
&& chmod +x alfresco.bin \
&& ./alfresco.bin --optionfile install_opts \
&& rm ./alfresco.bin

EXPOSE 80 21 139 445 7070 8009 8080 8443

CMD service alfresco start && sleep 300 && tail -F /opt/alfresco-5.0.d/alfresco.log && tail -F /opt/alfresco-5.0.d/share.log && tail -F /var/log/pgsql.log

# ADD ./typo3-model-context.xml /opt/alfresco-5.0.d/tomcat/shared/classes/alfresco/extension/
# ADD ./typo3Model.xml /opt/alfresco-5.0.d/tomcat/shared/classes/alfresco/extension/

ADD ./alfresco-global.properties /opt/alfresco-5.0.d/tomcat/shared/classes/alfresco-global.properties
