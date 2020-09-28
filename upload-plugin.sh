pluginJarFileName="sample-plugin.jar"

user=admin
pass=P@ssw0rd
serverIp=172.10.0.1
serverPort=8080

url="http:/$serverIp:$serverPort/rest/plugins/1.0/";
token=$(curl -u "$user:$pass" -sI "$url?os_authType=basic" | grep upm-token | cut -d: -f2- | tr -d '[[:space:]]');
curl -u "$user:$pass" -XPOST "$url?token=\$token" -F plugin=@$pluginJarFileName; 
    
