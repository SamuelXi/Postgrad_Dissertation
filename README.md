# Postgrad Dissertation experiment

## Packages
In order to run the following files, packages need to be installed. Please refer to the package page for more information.\
DMAT: https://ppw.kuleuven.be/okp/software/dmat/ \
HDDM: https://hddm.readthedocs.io/en/latest/

## Data
There are two Data Folders for different DDM packages. DMAT uses the data folders, and HDDM uses the folder named rt_dataframes.\ 
All data are not uploaded to GitHub for ethics and privacy reason.

## Results
All results are saved to the fitting_results folder.

## DMAT
The DMAT was implemented in MATLAB, File daraManipulation.m needed to be run first for later files. \
modelFitting2nd.m for all the model fitting. \
ANOVATEstingScript.m for fitted parameter t-test analysis and model evaluation.\
parameterRecovery.m for winning model parameter recovery test and fitted parameter convergence test.\
All the results are saved in the path: ./fitting_results folder/DMAT

## HDDM
HDDM models are tested using separate Jupyter Notebook files, which are indicated in the file names.\
ttest.ipynb contained all the scripts for participants' information extraction and t-test.\
All the results are saved in the path: ./fitting_results folder/HDDM



