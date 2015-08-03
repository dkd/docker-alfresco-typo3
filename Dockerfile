FROM java:7
MAINTAINER Johannes Goslar

RUN wget -O alfresco.bin \
http://dl.alfresco.com/release/community/5.0.d-build-00002/alfresco-community-5.0.d-installer-linux-x64.bin \
&& chmod +x alfresco.bin \
&& ./alfresco.bin \
--mode text \
--installer-language en \
--baseunixservice_install_as_service 1 \
--alfresco_admin_password AlfrescoAdmin \
&& rm ./alfresco.bin

ADD ./typo3-model-context.xml /opt/alfresco-5.0.d/tomcat/shared/classes/alfresco/extension/
ADD ./typo3Model.xml /opt/alfresco-5.0.d/tomcat/shared/classes/alfresco/extension/

EXPOSE 80
EXPOSE 21
EXPOSE 139
EXPOSE 445
EXPOSE 7070
EXPOSE 8009
EXPOSE 8080
EXPOSE 8443

CMD service alfresco start && sleep 10 && tail -F /opt/alfresco-5.0.d/alfresco.log && tail -F /var/log/pgsql 
