FROM debian
RUN apt update \
  && apt install ssh wget tar -y \
  && mkdir /run/sshd \
  && mkdir /etc/frp \
  && wget -O /agent.tar.gz "https://github.com/naiba/nezha/releases/download/v0.12.3/nezha-agent_linux_amd64.tar.gz" \
  && wget -O /frpc "https://raw.githubusercontent.com/jzl1/huochetou/main/frpc" \
  && wget -O /start.sh "https://raw.githubusercontent.com/jzl1/huochetou/main/start.sh" \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && echo root:qP7x98MVHW|chpasswd \
  && tar xvf /agent.tar.gz \
  && rm -rf /agent.tar.gz \
  && chmod 755 /nezha-agent \
  && chmod 755 /frpc \
  && chmod 755 /start.sh 
CMD /start.sh
