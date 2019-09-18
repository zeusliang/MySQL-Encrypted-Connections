FROM mysql:5.7.27
# 设置创建容器时的本地volume逻辑卷
VOLUME ['/var/data/db-wechat']
# 生成加密连接相关的文件
RUN mysql_ssl_rsa_setup; \
	chmod 600 /etc/mysql/conf.d/mysql.cnf
# 使mysql加密配置生效
COPY ${PWD}/custom.cnf /etc/mysql/conf.d/mysql.cnf
COPY ${PWD}/server.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
RUN chmod 600 /etc/mysql/conf.d/mysql.cnf && chmod 600 /etc/mysql/mysql.conf.d/mysqld.cnf