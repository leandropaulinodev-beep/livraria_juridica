# ==== VARIÁVEIS ====
$DB_INSTANCE_ID = "livraria-db"
$DB_USER = "admin"
$DB_PASSWORD = "SenhaForte123"
$DB_NAME = "livraria_juridica"
$AWS_REGION = "us-east-1"
$SEC_GROUP_NAME = "livraria-db-sg"

Write-Host "==== Criando Security Group para o RDS ===="
$SEC_GROUP_ID = aws ec2 create-security-group `
    --group-name $SEC_GROUP_NAME `
    --description "Acesso MySQL para RDS" `
    --region $AWS_REGION `
    --query 'GroupId' --output text

Write-Host "Security Group criado: $SEC_GROUP_ID"

Write-Host "==== Liberando acesso MySQL (porta 3306) ===="
aws ec2 authorize-security-group-ingress `
    --group-id $SEC_GROUP_ID `
    --protocol tcp --port 3306 `
    --cidr 0.0.0.0/0 `
    --region $AWS_REGION

Write-Host "==== Criando instância RDS MySQL ===="
aws rds create-db-instance `
    --db-instance-identifier $DB_INSTANCE_ID `
    --db-instance-class db.t3.micro `
    --engine mysql `
    --allocated-storage 20 `
    --master-username $DB_USER `
    --master-user-password $DB_PASSWORD `
    --db-name $DB_NAME `
    --vpc-security-group-ids $SEC_GROUP_ID `
    --backup-retention-period 7 `
    --publicly-accessible `
    --no-multi-az `
    --region $AWS_REGION

Write-Host "Aguardando o RDS ficar disponível (pode levar alguns minutos)..."
aws rds wait db-instance-available `
    --db-instance-identifier $DB_INSTANCE_ID `
    --region $AWS_REGION

Write-Host "==== Obtendo endpoint do RDS ===="
$DB_ENDPOINT = aws rds describe-db-instances `
    --db-instance-identifier $DB_INSTANCE_ID `
    --region $AWS_REGION `
    --query "DBInstances[0].Endpoint.Address" `
    --output text

Write-Host "Endpoint do banco: $DB_ENDPOINT"

Write-Host "==== Atualizando arquivo .env ===="
(Get-Content ".env") -replace "^DB_HOST=.*", "DB_HOST=$DB_ENDPOINT" |
    ForEach-Object {$_ -replace "^DB_USERNAME=.*", "DB_USERNAME=$DB_USER"} |
    ForEach-Object {$_ -replace "^DB_PASSWORD=.*", "DB_PASSWORD=$DB_PASSWORD"} |
    ForEach-Object {$_ -replace "^DB_PORT=.*", "DB_PORT=3306"} |
    Set-Content ".env"

Write-Host "Banco configurado e .env atualizado com sucesso!"
