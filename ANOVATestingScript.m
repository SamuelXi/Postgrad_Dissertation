%% Testing for significance between different model
%getting file path
folderPathT1 = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameT1 = 'model1(noCondition).csv';
folderPathT2 = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameT2 = 'model2(noCondition).csv';
filePathT1 = fullfile(folderPathT1, fileNameT1);
filePathT2 = fullfile(folderPathT2, fileNameT2);

fileDataT1 = readtable(filePathT1);
fileDataT2 = readtable(filePathT2);

T1 = fileDataT1.z;
T2 = fileDataT2.z;
test = [T1,T2]
% [h, p, ci, stats] = ttest2(T1,T2);