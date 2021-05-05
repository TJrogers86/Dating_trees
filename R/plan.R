plan <- drake_plan(
  tree_import = GetTreeWithNameProcessing("R/data/RAxML_bipartitions.result"),
  calibrations = data.frame(MRCA="LP", MinAge=100, MaxAge=100,
                            taxonA="Ga0105875_101", 
                            taxonB = "Caldilinea_aerophila", 
                            stringsAsFactors=FALSE),
  adjust = r8s_adjust(tree = tree_import, calibration = calibrations,
                      file = "chronogram.pdf", w = 30, h = 30)
)
