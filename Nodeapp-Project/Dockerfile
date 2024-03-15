FROM node
WORKDIR /app
COPY *.json .
RUN npm install
COPY *.js .
COPY *.png .
COPY *.ts .
COPY src/ .
COPY e2e/ .
EXPOSE 3000
CMD [ "npx","nx","server","api" ] 
# RUN npx prisma generate
# RUN npx prisma generate
