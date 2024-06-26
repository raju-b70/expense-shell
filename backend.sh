source.common.sh
mysql_root_password=$1cd
print_task_heading () {

}
echo Disable default Nodejs Version Module

dnf module disable nodejs -y

dnf module enable nodejs:20 -y

dnf install nodejs -y
echo install nodejs
useradd expense
cp backend.service /etc/systemd/system/backend.service
rm -rf /app
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
cd /app
unzip /tmp/backend.zip
cd /app
npm install



systemctl daemon-reload
systemctl enable backend
systemctl start backend
dnf install mysql -y
mysql -h 3.92.227.1 -uroot -p$(mysql_root_password) < /app/schema/backend.sql