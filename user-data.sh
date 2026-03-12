#!/bin/bash
apt update -y
apt install apache2 -y

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Terraform Deployment</title>
<style>
body { background:#0f172a; color:white; font-family:Arial; text-align:center; padding-top:120px; }
h1 { color:#38bdf8; }
.container { background:#1e293b; padding:40px; border-radius:10px; width:60%; margin:auto; }
</style>
</head>
<body>
<div class="container">
<h1>🚀 Terraform Deployment Successful</h1>
<p>Environment: $(hostname)</p>
<p>Provisioned using Terraform + GitHub Actions</p>
</div>
</body>
</html>
EOF

systemctl start apache2
systemctl enable apache2