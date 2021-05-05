################################
# Import tree with clean names #
################################
GetSingleGenusSpecies <- function(x) {
  return(paste(strsplit(x, " |_")[[1]][1:2], collapse=" "))
}

GetAllGenusSpecies <- function(x) {
  sapply(x, GetSingleGenusSpecies)
}

CleanData <- function(phy, data) {
  clean <- geiger::treedata(phy, data)
}

GetTreeWithNameProcessing <- function(treefile) {
  phy = read.tree(treefile)
  phy$tip.label <- unname(GetAllGenusSpecies(phy$tip.label))
  return(phy)
}

########################
# Adjust to chronogram #
########################
r8s_adjust <- function(tree, calibration, file, w="", h=""){
  tree <- r8s.phylo(phy=tree, calibrations=calibration, base="out_data/pl_file", ez.run="PL")
  pdf(file=paste0("out_data/", file), width=w, height=h)
  plot(tree)
  dev.off()
}


