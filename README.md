# Kafka Service

First step to be able to use the lenses dashboard, is to register for a license, using lenses.io website.
``
https://lenses.io/start/
``

Download your license file and copy it to the `etc` folder. 

To check the lenses dashboard, use the following: 
``
http://localhost:9991
`` 

username and password is: `admin` you can still change this under `lenses/environment` from `docker-compose.yml`.

To run the service 
```
make run
```

To stop the service 
```
make stop
```

## Kafka Server Properties
Configuration can be found under `conf` folder, you can change it, or add new.

Some sample configurations:
```json
log.dirs=/bitnami/kafka/data
offsets.topic.replication.factor=1
num.partitions=1
zookeeper.connect=zookeeper:2181
```

## Dployment
Check the `helm` folder and update what you need. 

Minimum changes needed for your deployment:

```json
ingress:
    enabled: true
    host: YOUR_HOST
```  
```json
tls:
    enabled: true
    secretName: YOUR_NAME
``` 
```json
licenseUrl: "YOUR LENSES LICENSE LINK"
```

Make sure to change the username and password, and add yours:
```json
env:
    LENSES_SECURITY_USER: admin
    LENSES_SECURITY_PASSWORD: admin
```