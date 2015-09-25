trainModel = function(modelName, fileName, trainingData, modelTrainControl) {

  cluster <- makeCluster(detectCores() - 2)
  registerDoParallel(cluster)
  
  if (file.exists(fileName)){
    load(fileName, .GlobalEnv)
  }
  else {
    myModel <<- train(classe ~ .,data=trainingData, method=modelName, trControl = modelTrainControl)
    save(trainModel, file=fileName)
  }
  
  stopCluster(cluster)
}