# Nerual network on handwritten digits

### Preparation
 - Data has size (5000, 400). 5000 samples, each has 400 features. Output into 10 classes
 - Using architecture [400, 25, 10]. Input layer 400 elements; one hidden layer with 25 elements; output layer 10 elements
 - Plan 3 runs. Run 1: optimize sample number, decide bias vs. variance. Run 2: optimize regulating rate. Run 3: compute Theta and test on test data set

### Analysis Before Run 1
 - Each data has 400 features, which is absolutely enough for human beings to classify the data. Thus we consider this is a feature-rich data and we might run into high-variance (overfitting) result. High regulating rate (lambda) might help.
 - If it's a high-variance case, we hope to see the plot like below. 
	 - Cross validation curve (cv) and training curve (train) never across. 
	 - Difference between cv and train is getting smaller as sample increases
	 - Relatively high cv cost and low train cost  
	 ![high_variance](https://github.com/TrentaIcedCoffee/algo-ml/blob/master/readme_resource/high_variance.png)

 
		
