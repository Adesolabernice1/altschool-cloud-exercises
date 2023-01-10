#!/bin/bash
apt update -y
apt install nginx -y
systemctl start nginx
systemctl restart nginx

export META_INST_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
export META_INST_TYPE=`curl http://169.254.169.254/latest/meta-data/instance-type`
export META_INST_AZ=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone`
export META_INST_PRIVATE_IP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
export META_INST_LOCAL_HOSTNAME=`curl http://169.254.169.254/latest/meta-data/local-hostname`

index='index.html'
cd /var/www/html
echo "<!DOCTYPE html>" >> ${index}
echo "<html lang="en">" >> ${index}
echo "<head>" >> ${index}
echo "    <meta charset="UTF-8">" >> ${index}
echo "    <meta name="viewport" content="width=device-width, initial-scale=1.0">" >> ${index}
echo "    <style>" >> ${index}
echo "        @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');" >> ${index}
echo "        html {" >> ${index}
echo "            position: relative;" >> ${index}
echo "            overflow-x: hidden !important;" >> ${index}
echo "        }" >> ${index}
echo "        * {" >> ${index}
echo "            box-sizing: border-box;" >> ${index}
echo "        }" >> ${index}
echo "        body {" >> ${index}
echo "            font-family: 'Open Sans', sans-serif;" >> ${index}
echo "            color: #324e63;" >> ${index}
echo "        }" >> ${index}
echo "        .wrapper {" >> ${index}
echo "            width: 100%;" >> ${index}
echo "            width: 100%;" >> ${index}
echo "            height: auto;" >> ${index}
echo "            min-height: 90vh;" >> ${index}
echo "            padding: 50px 20px;" >> ${index}
echo "            padding-top: 100px;" >> ${index}
echo "            display: flex;" >> ${index}
echo "        }" >> ${index}
echo "        .instance-card__cnt {" >> ${index}
echo "            margin-top: 35px;" >> ${index}
echo "            text-align: center;" >> ${index}
echo "            padding: 0 20px;" >> ${index}
echo "            padding-bottom: 40px;" >> ${index}
echo "            transition: all .3s;" >> ${index}
echo "        }" >> ${index}
echo "        .instance-card-inf__item {" >> ${index}
echo "            padding: 10px 35px;" >> ${index}
echo "            min-width: 150px;" >> ${index}
echo "        }" >> ${index}
echo "        .instance-card-inf__txt {" >> ${index}
echo "            font-weight: 500;" >> ${index}
echo "            margin-top: 7px;" >> ${index}
echo "        }" >> ${index}
echo "    </style>" >> ${index}
echo "    <title>stateless-app</title>" >> ${index}
echo "</head>" >> ${index}
echo "<body>" >> ${index}
echo "    <div class="wrapper">" >> ${index}
echo "        <div class="instance-card">" >> ${index}
echo "            <div class="instance-card__cnt">" >> ${index}
echo "                <div class="instance-card__name">Instance $META_INST_ID is running!</div>" >> ${index}
echo "                <div class="instance-card-inf">" >> ${index}

echo "                    <div class="instance-card-inf__item">" >> ${index}
echo "                        <div class="instance-card-inf__txt">Local Hostname</div>" >> ${index}
echo "                        <div class="instance-card-inf__title">" $META_INST_LOCAL_HOSTNAME "</div>" >> ${index}
echo "                    </div>" >> ${index}

echo "                </div>" >> ${index}
echo "            </div>" >> ${index}
echo "        </div>" >> ${index}
echo "</body>" >> ${index}
echo "</html>" >> ${index}
systemctl restart nginx