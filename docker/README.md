# docker共享配置文件

### 数据库
#### 容器启动时导入数据库
在项目根目录中运行以下命令
```bash
docker-compose up -d
docker ps -a
docker exec -it hairdress_mysqldb_1 /bin/bash
```

在容器中，运行命令
```bash
mysql -uroot -proot -B hairdress < /opt/sql/hairdress.sql
```

#### 关闭容器时导出数据库
在容器中，运行
```bash
mysqldump -uroot -proot -B hairdress > /opt/sql/hairdress.sql
``` 