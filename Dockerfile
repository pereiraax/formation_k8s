from node:10

copy . /TPS/

# RUN npm install -g md-fileserver
RUN  npm install -g marvo 

EXPOSE 9000

# RUN mdstart | xargs echo & 

# RUN pkill mdstart 

CMD marvo serve /TPS 
