#/bin/bash

# 初始化
img_name="mysql-8.0:v1.0"
img_name="mysql-5.7.27:v1.0"
con_name=db-wechat
root_pwd=1@2019aj-k

# MySQL镜像构建
function buildImg(){
	build="docker build -t $img_name ${PWD}/build/"
	if $build
	then
		echo '镜像构建成功'
	else
		echo '镜像构建失败'
	fi
}

# MySQL容器创建
function creCon(){
	cre_con="docker run -d --name $con_name --privileged -e MYSQL_ROOT_PASSWORD=$root_pwd  $img_name"
	if $cre_con
	then
		echo "MySQL容器创建成功"
	else
		echo "MySQL容器创建失败"
	fi
}

if buildImg
then
	creCon
fi

# mysql镜像的mysql配置文件路径
# !includedir /etc/mysql/conf.d/
# !includedir /etc/mysql/mysql.conf.d/
# 服务器端配置文件 /etc/mysql/mysql.conf.d/mysqld.cnf
# 客户端配置文件 /etc/mysql/conf.d/mysql.cnf

# MySQL加密连接设置
# 生成加密连接配置文件
# docker exec -it db-wechat sh -c ' mysql_ssl_rsa_setup'
# docker exec -it db-wechat sh -c 'chmod 600 /etc/mysql/conf.d/mysql.cnf'
# mysql配置生效
# docker container cp ./build/custom.cnf db-wechat:/etc/mysql/conf.d/mysql.cnf
# docker container cp ./build/server.cnf db-wechat:/etc/mysql/mysql.conf.d/mysqld.cnf
# docker exec -it db-wechat sh -c 'chmod 600 /etc/mysql/conf.d/mysql.cnf && chmod 600 /etc/mysql/mysql.conf.d/mysqld.cnf '
# 检测当前会话是否使用了加密连接
# docker exec -it db-wechat sh -c 'mysql -u root'
# SHOW SESSION STATUS LIKE 'Ssl_cipher';
# 加密连接结果，即字段Ssl_cipher的值为： DHE-RSA-AES128-GCM-SHA256或类似值，则说明加密连接成功
# +---------------+---------------------------+
# | Variable_name | Value |
# +---------------+---------------------------+
# | Ssl_cipher | DHE-RSA-AES128-GCM-SHA256 |
# +---------------+---------------------------+


# 常用操作
# docker exec -it db-wechat sh -c 'ls -Fl /etc/mysql'
# docker exec -it db-wechat sh -c 'ls -Fl /var/lib/mysql'
# docker exec -it db-wechat sh -c 'ls -F /etc/mysql/conf.d/mysql.cnf'
# docker exec -it db-wechat sh -c 'cat /etc/mysql/conf.d/mysql.cnf'
# docker container cp db-wechat:/etc/mysql/conf.d/mysql.cnf .
# docker container cp ./mysql.cnf db-wechat:/etc/mysql/conf.d/mysql.cnf



