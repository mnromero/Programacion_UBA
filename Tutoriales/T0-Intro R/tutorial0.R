# --------------------------- BIG DATA -----------------------------------#
# -------------------------- TUTORIAL 1 ----------------------------------#
####  James, Witten, Hastie y Tibshirani(2013) Chap. 2 Lab: Introduction to R #

# Directorio
dir()  #Nos muestra los archivos que hay en el directorio que configuramos
setwd("/Users/mnromero/Dropbox/COURSES/2024 - S2 - Primavera - Big Data (UBA)/Clase practica/T0-Intro R")


#Creamos un vector columna x
x = c(1,3,2,5)

#Para ver x, simplemente corremos: 
x
  #--> Alternativa: View(x)

#Reemplazamos el objeto x con un nuevo vector:
x = c(1,6,2)

#Creamos un segundo vector y:
y = c(1,4,3)

#Elementos de un objeto:
length(x)
length(y)

#Operaciones B?sicas, cuando los objetos tienen el mismo tama?o: 
 #Adici?n de vectores
  x+y
  
 #Podemos crear un obejto con la operaci?n: 
  z = x - y
  
    #Muchas veces en los foros encontran que en lugar de usar el = se
    # usa <- Siguiendo el caso anterior:
    z2 <- x - y
    #Chequeamos
    z
    z2
    
#Si queremos ver todos los objetos de "Enviroment":    
ls()

#Para borrar objetos:
rm(x,y)

 #Chequeamos lo que nos queda
 ls()
 #Para borrar todo lo que tenemos:
 rm(list=ls())

#HELP de R con ?:
 ?matrix


# --------> OPERACIONES CON MATRICES:
 
#Cremos una matriz :
 x=matrix(data=c(1,2,3,4), nrow=2, ncol=2) #la arma por columna
 x
 
  #Alternativa:
   x=matrix(c(1,2,3,4),2,2)
   
  #Si quiero que la arme por fila:
   matrix(c(1,2,3,4),2,2,byrow=TRUE)
   
  #Saco la ra?z cuadrada a cada elemento
   sqrt(x)
   
  #Elevo todos los elementos al cuadrdo 
   x^2
   
   # Indexing Data
   A=matrix(1:16,4,4)
   A
   # Para tener un elemento de la matriz
   A[2,3]
   # Para seleccionar determinadas filas y columnas
   A[c(1,3),c(2,4)]
   # Para seleccionar de manera continua
   A[1:3,2:4]
   # Para seleccionar dos filas espec?ficas y todas las columnas 
   A[1:2,]
   # Para seleccionar todas las filas y dos las columnas espec?ficas 
   A[,1:2]
   # Seleccion? una sola fila
   A[1,]
   
        # ---> Cuando tenemos una matriz m?s grande, podemos ver las
        #      primeras 6 filas con head()
        # Probar A=matrix(1:10000,100,100)
        #        head(A)
   
   # Toda la matriz menos las filas que le indico
   A[-c(1,3),]
   #Para sacar las filas y las columnas que quiero 
   A[-c(1,3),-c(1,3,4)]
   #Dimensi?n de la matriz
   dim(A)
   #Elementos del objeto
   length(A)
   
# --------> VECTORES ALEATORIOS Y CORRELACIONES
   
 #Creamos dos vectores aleatorios de la distribuci?n Normal estandarizada
   x=rnorm(10)
   #Creamos otro vector indicando la media y el desv?o est?ndar:
   y=x+rnorm(10,mean=50,sd=.1)
 #Correlaci?n:
   cor(x,y)
 
 #Para que se reproduzca el mismo resultado de variables aleatorios usamos:
 set.seed(1303)
 rnorm(10)
 
# --------> MEDIA, VARIANZA, DESV?O ESTANDAR
 set.seed(3)
 y=rnorm(100)
 #Media
 mean(y)
 #Varianza
 var(y)
 #Desv?o estand?r
 sd(y)
  #--> Alternativa:  sqrt(var(y))


# --------> GR?FICOS  
x=rnorm(100)
y=rnorm(100)
 
 #Scatter plot:
  plot(x,y)

 #Opciones del comando:
  plot(x,y,col="red",xlab="Eje x",ylab="Eje y",main="Scatter plot X vs Y")
 
 #Para guardar el gr?fico en pdf:
  pdf("Figura1.pdf", paper = "a4")
  plot(x,y,col="red",xlab="Eje x",ylab="Eje y",main="Scatter plot X vs Y")
  dev.off() #Con esto le indicamos que terminamos de crear el gr?fico
  
 #Para guardar el grafico en 
  jpeg("Figura1.jpeg")
  plot(x,y,col="red",xlab="Eje x",ylab="Eje y",main="Scatter plot X vs Y")
  dev.off()
  
 # AVANZADO: para los que usan latex
  setEPS()
  postscript("Figure.eps")
  plot(x,y,col="red",xlab="Eje x",ylab="Eje y",main="Scatter plot X vs Y")
  dev.off()
  
  #PAQUETE DE GRAFICOS LINDOS!!! :) FUENTE: http://www.cookbook-r.com/Graphs/
  install.packages("ggplot2")
  library(ggplot2)
  
  #Scatter plot
  dat <- data.frame(x,y) # Estructura general de los datos en R
  
  ggplot(dat, aes(x=x, y=y)) + 
    geom_point(shape=1) 
  
  # Shape   1     C?rculos
  #         2     Tr?angulos
  #         3     +
  #         4     x
  #         5     Rombo
  
  
  ggplot(dat, aes(x=x, y=y)) +
    geom_point(shape=1) +    
    geom_smooth(method=lm) # Linea regresi?n
  
  ggplot(dat, aes(x=x, y=y)) +
    geom_point(shape=1) +    
    geom_smooth() +         # Relacion no lineal
    ggtitle("Gr?fico x vs y") # Titulo
   
#--------> SUCESIONES
  #Con comando
  x=seq(1,10)
  x
  #Sin comando
  x=1:10
  x
  
  #Sucesi?n entre -pi y pi:
  x=seq(-pi,pi,length=50)
  y=x
  
# --------> GR?FICOS  CON 3 VARIABLES:
  
  #Producto vectorial: x'y
  f=outer(x,y,function(x,y)cos(y)/(1+x^2))
  
  # Gr?fico de las curvas de nivel
  contour(x,y,f)
  
  # Gr?fico de las  curvas de nivel con opciones:
  contour(x,y,f,nlevels=45,add=T)
  fa=(f-t(f))/2
  
  contour(x,y,fa,nlevels=15)
  
  # Gr?fico con colores por nivel 
  image(x,y,fa)
  
  # Gr?fico en 3D
  persp(x,y,fa, col = "blue")
  #girando la perspectiva izq a der
  persp(x,y,fa,theta=30, col = "blue")
  # girando arriba abajo
  persp(x,y,fa,theta=30,phi=20, col = "blue")
  #Desde arriba
  persp(x,y,fa,theta=30,phi=70, col = "blue")
  #Desde arriba izq a der
  persp(x,y,fa,theta=30,phi=40, col = "blue")
  
  # Con ggplot2 para hacer gr?ficos en 3D ver:
     # https://www.r-bloggers.com/3d-plots-with-ggplot2-and-plotly/
  
  

#--------> TRABAJANDO CON LOS DATOS 

  #Instalamos el paquete del libro:
  install.packages("ISLR")
  library("ISLR")

 #--------> OPCIONES PARA CARGAR DATOS Y CREAR UN "DATA FRAME"
  
  # 1) De un archivo delimitado (text file)
    Auto=read.table("Auto.data")
    fix(Auto) #Vemos que tomo los nombres de las variables como datos
    
  # 2) De un archivo delimitado (text file) con opciones
    Auto=read.table("Auto.data",header=T,na.strings="?")
    fix(Auto)
    
  # 3) De una archivo separado por comaS
    Auto=read.csv("Auto.csv",header=T,na.strings="?")
    fix(Auto)
    
  # 4) De una archivo dta de Stata 
    install.packages("foreign")
    library("foreign")
    Auto=read.dta("Auto.dta")
    

 #--------> OPCIONES PARA GUARDAR LOS DATOS
  
   # 1) A un archivo de texto 
     write.table(Auto, "Auto2.data", sep="\t")
     
   # 2) A un excel
     install.packages("xlsx")
      # Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_101")
      # install.packages("rJava")
      # library("rJava")
      # install.packages("xlsxjars")
     library("xlsx")
     write.xlsx(Auto, "Auto.xlsx")
     
   # 3) A un .dta
     install.packages("foreign")
     library("foreign")
     write.dta(Auto, "C:\\Users\\mromero\\Dropbox\\Curso Big Data\\Tutoriales\\Tutorial 1\\Auto.dta")
     
 #--------> Caracter?sticas de los datos
     
   # Dimension   
     dim(Auto) #397 filas y 9 columnas
     
   # Elementos de los datos: primeras 4 filas de todas las variables
     Auto[1:4,]
     
   # Dropear missing values   
     Auto=na.omit(Auto)
     
    #Chequeamos la nueva dimensi?n
     dim(Auto) # 5 filas menos
     
   # Nombres de las variables
     names(Auto)
     
   # Tipo de datos   
     str(Auto) 
       # Para ver el tipo de variable para una variable en especial:
        class(Auto$name)
       # Para ver los niveles de la variables factors:
        levels(Auto$name)
        
         #Las funciones as.factor(), as.integer, is.factor, is.ordered
         #nos sirven para trabajar las variables como quieramos. Ejemplo:
         # name es factor:
           mean(as.integer(Auto$name))
     
 #--------> GR?FICOS A PARTIR DE LOS DATOS
   # Scatter plot
     plot(Auto$cylinders, Auto$mpg)
     
   # Alternativa:Usamos una funci?n que le indique a R qu? objeto utilizar
     attach(Auto)
     plot(cylinders, mpg)
     
   # Convirtiendo la variable en factor el plot hace graficos
   #  de caja para cada categoria:
     cylinders=as.factor(cylinders)
     plot(cylinders, mpg)
     
   # Opciones para el gr?fico:  
     plot(cylinders, mpg, col="blue")
     plot(cylinders, mpg, col="blue", varwidth=T)
     plot(cylinders, mpg, col="blue", varwidth=T,horizontal=T)
     plot(cylinders, mpg, col="blue", varwidth=T, xlab="cylinders", ylab="MPG")

   # Histograma
     hist(mpg)
     hist(mpg,col=4) # opcion colores 
     
      #col-> colores 1   negro
      #              2   rojo
      #              3   verde
      #              4   azul
      #              5   celeste
      #              6   fucsia
      #              7   amarillo
      #              8   gris
     
     #Para obtener m?s barras usamos la opci?n breaks
     hist(mpg,col=4,breaks=15)
     
   # Para hacer varios Scatterplots
     pairs(Auto)
     pairs(~ mpg + displacement + horsepower + weight + acceleration, 
           Auto, col="blue", main = "Scatter plot de las variables")
   
     # Para hacer gr?ficos simult?neos con ggplot2 ver:
       # http://www.sthda.com/english/wiki/ggplot2-easy-way-to-mix-multiple-graphs-on-the-same-page 
     
   # Forma interactiva para identificar valores extremos
     plot(horsepower,mpg, col="blue")
     identify(horsepower,mpg,name)
     
 #--------> ESTADISTICA DESCRIPTIVA DE LA BASE DE DATOS Y VARIABLES
    summary(Auto)
    summary(mpg)
    
    # Alternativas con m?s detalles
      install.packages("Hmisc")
      library("Hmisc")
      describe(Auto$mpg)
    
      install.packages("pastecs")
      library("pastecs")
      stat.desc(Auto$mpg) 
      
      install.packages("psych")
      library("psych")
      describe(Auto$mpg)
      
  # Opci?n by 
      describeBy(Auto$horsepower, cylinders)
    
  # Tablas
    table(Auto$cylinders)
     # alternativa:  with(Auto,table(cylinders))
    
   # Tabla de doble entrada
    table(Auto$horsepower, Auto$cylinders)
   
   # Avanzado: Tablas bonitas para latex! (Ver pdf)
    install.packages("tables")
    library("tables")
    attach(Auto)
    tab1<- tabular( (as.factor(year) + 1) ~ (n=1) + Format(digits=2)*
                (displacement + acceleration)*(mean + sd), data=Auto)
    latex(tab1)

    