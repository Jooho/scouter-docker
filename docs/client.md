# Scouter Client

Download Scouter Client
-----------------------

URL: https://github.com/scouter-project/scouter/releases

Ex)
~~~
wget https://github.com/scouter-project/scouter/releases/download/v1.7.3.1/scouter.client.product-linux.gtk.x86_64.tar.gz
gzip -d scouter.client.product-linux.gtk.x86_64.tar.gz
tar xvf  scouter.client.product-linux.gtk.x86_64.tar
~~~

Pure Docker
-----------
```
cd scouter.client
./scouter
```

OpenShift
---------
```
oc port-forward -p $(oc get pod|grep scouter-server|awk '{print $1}') 6100:6100

cd scouter.client
./scouter
```
