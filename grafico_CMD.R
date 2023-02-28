#-----------------------------------------------------------------------------------------------------------
#                                                                                                          -
#         script para rodar um programa em R cujo objetivo é fazer um Diagrama Cor-Magnitude (CMD)         -
#      das estrelas de um aglomerados aberto muito conhecido da Galáxia, chamada de NGC188, na faixa do    -
#   infravermelho próximo (J vs. (J-H) a partir dos dados encontrados no arquivo stetsonS_2mass_saida.dat  -
#                                                                                                          -
#    Posteriormente é plotado ah isocrona de Padova correspondente, cujos parametros estao encontrados     -
#             no arquivo mkcmd_Gi02.sh: idade, distancia(Pc), avermelhamento e metalicidade                -
#                                                                                                          -
#-----------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------
pdf(file="/home/cleiton/data_science/fortran/grafico_CMD.pdf",family="Palatino")

family="Palatino"
font=4

layout(matrix(1:2,ncol=2),widths=c(2.418,1.98))
#-----------------------------------------------------------------------------------------------------



#-----------------------------------------------------------------------------------------------------
aglomerado <- read.table('/home/cleiton/data_science/fortran/stetsonS_2mass_saida.dat',header=TRUE)

a <- aglomerado[,2]
b <- aglomerado[,1]
z <- aglomerado[,3]

xa <- vector(mode="numeric")
ya <- vector(mode="numeric")

#n_estrelas <- 0

na <- 0
for(i in 1:1623){
  za <- z[i]
   if(za > 80.){
#n_estrelas = n_estrelas + 1
   na <- na+1
   xa[na] <- a[i]
   ya[na] <- b[i]
  }
}
#-----------------------------------------------------------------------------------------------------


par(mar=c(5,5,2,0))

eixo_x=c(-0.3,0,0.3,0.6,0.9,1.2)
eixo_y=c(16,15,14,13,12,11,10,9)

plot(a,b,axes=FALSE,frame.plot=TRUE,xlab='J-H',ylab='J',cex.lab=1.2,font.lab=20,tcl=0.4,xaxs="i",yaxt="n",yaxs="i",xlim=c(-0.4,1.3),ylim=c(16,9),pch=16,cex=0.6,col='darkgray')

points(xa,ya,col='darkblue',pch=16,cex=0.6)

axis(side=1,at=eixo_x,tcl=0.6,labels=eixo_x)
axis(side=4,at=eixo_y,tcl=0.6,labels=FALSE)
axis(side=3,at=eixo_x,tcl=0.6,labels=FALSE)
axis(side=2,at=eixo_y,tcl=0.6,labels=eixo_y)

#-----------------------------------------------------------------------------------------------------


par(mar=c(5,0,2,2))

eixo_x=c(-0.3,0,0.3,0.6,0.9,1.2)
eixo_y=c(16,15,14,13,12,11,10,9)

plot(xa,ya,axes=FALSE,frame.plot=TRUE,cex.lab=1.2,font.lab=20,ylab="J",xlab="J-H",xlim=c(-0.4,1.3),ylim=c(16,9),xaxs="i",yaxs="i",col="darkblue",pch=16,cex=0.6)

axis(side=1,at=eixo_x,tcl=0.6,labels=eixo_x)
axis(side=4,at=eixo_y,tcl=0.6,labels=FALSE)
axis(side=3,at=eixo_x,tcl=0.6,labels=FALSE)
axis(side=2,at=eixo_y,tcl=0.6,labels=FALSE)

#-----------------------------------------------------------------------------------------------------







#text(x,y,expression(0<= x <= 1))
mtext("Cleitao Carillo", outer = TRUE, cex = 1.5)
#mtext("Diagrama HR",outer=TRUE,cex=2,font=2)

dev.off()
