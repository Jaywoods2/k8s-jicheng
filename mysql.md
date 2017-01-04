### mysql数据库部署

1. 编写`mysql.yaml`
```
kind: Namespace
apiVersion: v1
metadata:
    name: db
---

kind: Deployment
apiVersion: extensions/v1beta1
metadata:
  name: mysql57
  namespace: db
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: mysql57
    spec:
      containers:
      - name: mysql57
        image: registry.saas.hand-china.com/tools/mysql:5.7.12
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 3306
          name: mysql57
        volumeMounts:
        - name: mysql-home
          mountPath: /var/lib/mysql
        - name: mysql-conf
          mountPath: /etc/mysql/conf.d
        env:
         - name: MYSQL_ROOT_PASSWORD
           value: "12345"
      volumes:
         - name: mysql-home
           hostPath:
            path: /var/lib/mysql
         - name: mysql-conf
           hostPath:
            path: /etc/mysql/conf.d


---
kind: Service
apiVersion: v1
metadata:
  labels:
    app: mysql57
  name: mysql57
  namespace: db
spec:
  type: ClusterIP
  ports:
  - port: 3306
    protocol: TCP
  selector:
    app: mysql57
```

2. 创建
```
# 使用kubectl create -f FILENAME命令
$ kubectl create -f mysql.yaml
```

3. 连接
```
# 使用集群ip
$ kubectl get svc mysql57 -n db
# 使用dns连接
mysql57.db.svc.cluster.local
```

4. 配置(可选)

比如修改mysql不区分大小写设置,进入mysql主机映射目录,然后新建.cnf后缀的文件,比如ext.cnf:
```
# ext.cnf
[mysqld]
lower_case_table_names=1
character_set_server=utf8
max_connections=500
```
然后保存，重启mysql服务即可。