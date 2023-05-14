setwd("/home/jturner/projects/jm_collab/jesse/redo/bdg/rt")
data<-read.table("jm_no_    norm_no_smooth.txt",header=FALSE)
colnames(data)=c("chr","start","stop","HMGA1_0","HMGA1_3","HMGA1_6","HMGA1_10","HMGA2_0","HMGA2_3","HMGA2_6","HMGA2_10","WTpool","WTrep1","WTrep2")
attach(data)

par(mfrow=c(3,4))

text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(HMGA1_0,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(HMGA1_3,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(HMGA1_6,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(HMGA1_10,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(HMGA2_0,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(HMGA2_3,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(HMGA2_6,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(HMGA2_10,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(WTpool,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(WTrep1,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)
text(725,0.95, labels = bquote(ACF == .(format(round(
  acf(WTrep2,lag=1000)$acf[2],
  digits=3), digits = 3))),cex=1)