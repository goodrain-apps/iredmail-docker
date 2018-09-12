
docker build --no-cache -t goodrainapps/iredmail:0.9.8 mysql

docker run --privileged -p 80:80 -p 443:443 \
           -e "DOMAIN=install.dog" -e "HOSTNAME=mail" \
           -e "SOGO_WORKERS=2" \
           -e "IREDAPD_PLUGINS=['reject_null_sender', 'throttle', 'amavisd_wblist', 'sql_alias_access_policy']" \
           -e "TIMEZONE=Asia/Shanghai" \
           -e "POSTMASTER_PASSWORD={PLAIN}password" \
           -e "MYSQL_ROOT_PASSWORD=password" \
           -v /tmp/vmail:/var/vmail \
           -v /tmp/clamav:/var/lib/clamav \
           -v /tmp/mysql:/var/lib/mysql \
           --name=iredmail goodrainapps/iredmail:0.9.8
