echo "Criando as imagens...."

docker build -t vivianipedroso/projeto-app:1.0 app/.

echo "Realizando o push das imagens"

docker push vivianipedroso/projeto-app:1.0

echo "Criando servicos no cluster Kubernetes..."

kubectl apply -f ./nodeport.yml

echo "Criando os deployments..."

kubectl apply -f mysql-deployment.yml --record
kubectl apply -f app-deployment.yml --record