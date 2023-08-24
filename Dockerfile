# 建立一个新的镜像文件，配置模板：新建立的镜像是以centos为基础模板
# 因为jdk必须运行在操作系统之上
FROM java:11

# 维护者
MAINTAINER author <huzjworkinng@163.com>

# 创建一个新目录来存储jdk文件
RUN mkdir /root/app

WORKDIR /root/app/

# VOLUME 指定了临时文件目录为/tmp1
# 其效果是在主机 /var/lib/docker 目录下创建了一个临时文件，并链接到容器的/tmp
VOLUME /tmp1

#将jdk压缩文件复制到镜像中，它将自动解压缩tar文件
COPY ./target/rancher-web-0.0.1-SNAPSHOT.jar /root/app/rancher-web-0.0.1-SNAPSHOT.jar

# 用于配置 Java 虚拟机的选项，如初始堆大小、最大堆大小和随机数生成器，可通过 docker run -e "JAVA_OPTS=" 进行覆盖
ENV JAVA_OPTS="-Xms512m -Xmx1024m -Djava.security.egd=file:/dev/./urandom"
## 应用参数
ENV ARGS=""

# 定义容器启动后执行的命令,启动后端项目
CMD java ${JAVA_OPTS} -jar rancher-web-0.0.1-SNAPSHOT.jar $ARGS

# 声明要监听的端口
EXPOSE 11911


