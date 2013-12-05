pcoa<-fuction(poca){
pcoah<-capscale(pcoa~1,distance="bray")
require(vegan)
require(rgl)
pcoah.site<-summary(pcoah)$site

rgl.open()
rgl.points(pcoah.site[,1],pcoah.site[,2],pcoah.site[,3],col=rainbow(15))
rgl.texts(pcoah.site[,1],pcoah.site[,2],pcoah.site[,3],
          paste("L",rep(1:5,each=3),rep(2:4,5),sep="-"),adj=c(1,1),col=rainbow(15))
axis3d('x',pos=c(NA, 0, 0),tick=FALSE,label=FALSE)
axis3d('y',pos=c(0, NA, 0),tick=FALSE,label=FALSE)
axis3d('z',pos=c(0, 0, NA),tick=FALSE,label=FALSE)
rgl.viewpoint(0,35)

for (i in 1:360) {
  rgl.viewpoint(i,35,zoom =1.1)
  filename <- paste("pcoah",formatC(i,digits=1,flag="0"),".png",sep="") 
  rgl.snapshot(filename, fmt="png", top=TRUE)
}
oopt = ani.options(interval = 0.05, nmax = 35)
owd =getwd() 
im.convert(paste("pcoah",formatC(1:360,digits=1,flag="0"),".png",sep="") ,"poca.gif")
ani.options(oopt)
setwd(owd)
}

# require animation
