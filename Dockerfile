# Use a imagem oficial do Node.js como base
FROM node:14-alpine

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo package.json e o arquivo package-lock.json (ou yarn.lock se você estiver usando Yarn) para o diretório de trabalho
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie todos os arquivos do diretório atual para o diretório de trabalho no contêiner
COPY . .

# Construa o aplicativo React
RUN npm run build

# Expõe a porta 3000 para o ambiente externo, onde a aplicação será executada
EXPOSE 3000

# Comando para iniciar o servidor quando o contêiner for iniciado
CMD ["npm", "start"]
