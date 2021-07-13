##
## Build
##

#indica la version de go que usara docker y 
#hereda de la imgen oficial de go sus recursos
FROM golang:1.16-alpine

#indica a Docker que use este directorio como 
#destino predeterminado para todos los comandos posteriores
WORKDIR /docker-go

#el COPY toma dos parámetros. El primer parámetro le dice a 
#Docker qué archivo le gustaría copiar en la imagen.
#El segundo parámetro le dice a Docker dónde desea que se copie ese archivo.
#copia tanto el go.mod como el .sum de la imagen
COPY go.mod .
COPY go.sum .
RUN go mod download  

#copia nuestro código fuente en la imagen todos 
#los archivos con la terminacion .go
COPY *.go .

#compilar nuestra aplicación
RUN go build -o /docker-go-example

EXPOSE 8080

CMD [ "/docker-go-example" ]

##
## Deploy
##

##multistage -> https://docs.docker.com/develop/develop-images/multistage-build/
