# Project Title

PCA Implementation using 1. Covariance Matrix, 2. SVD

## Getting Started

These instructions are created considering MATLAB is already downloaded in the system.

### Prerequisites

MATLAB environment already configured in the system. Please copy the .mat and .m codes to that environment to run the code directly from MATLAB.


## Executing the code

Explanation of how to achieve the results are divided into two parts; one for each experiment.

## Experiment 1: Visualisation

For the visualisation of iris dataset and to see the PC1, PC2, PC3 vector spaces. The iris data needs to imported into MATLAB and solution1 function needs to be called. This will created the following images in the file path: 'IrisData.jpeg', 'PC1_PC2.jpeg', 'PC2_PC3.jpeg', 'PC1_PC3.jpeg'.
To see the function in steps, one can copy the codes written inside solution1() to execute the same code without abstraction.
This code calls pca1() to find the PC and V matrix.

```
load('iris.mat');
solution1(X,y);

```

## Experiment 2: Image compression

The next experiment deals with using dimensional reduction for image compression. The digit.mat data has to first be imported. The function; solution2() calculates the PC from the train data and encodes the test data and finally reconstructs the test images. The 'TestData.jpeg' consists of the reconstructed images. (I have also reconstructed a train data image which is created in the file: 'TrainData_10.jpeg').

It also creates the POV v Eigen vector figure, 'EigenvecVPoV.jpeg' - This is calculated and plotted in the findbestM(V) function. 

We can also call this function for the 1st experiment and we get k=1. 

On calling the function, the Reconstruction Error is also displayed. 

The function returns the lower dimensional representation of the test data.

Again, for a breakdown of the steps, one can just copy the codes inside the function- solution2() to replicate it in the MATLAB environment.

```
load('digit.mat');
lowDim = solution2(train,test);

```

## Author

Ushasree Sanyal


## Acknowledgments

Code for PCA1 and PCA2 was provided by the University.
