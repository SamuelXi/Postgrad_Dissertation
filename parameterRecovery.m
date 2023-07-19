%% Parameter recovery on Model3
seed = 1;
N = [98,50];

folderPathConR = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/Recovery/';
% fileNameConR3 = 'model3(TwoConditionRecovery).csv';
% filePathRecoveryM3 = fullfile(folderPathConR, fileNameConR3);
% file1 = fopen(filePathRecoveryM3, 'w');


% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
% fprintf(file1, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102),AICc(1),BIC(1),Chi(1),df\n');

% Check if a parallel pool exists and delete it if found
poolObj = gcp('nocreate');
if ~isempty(poolObj)
    delete(gcp);
end

parpool('local')

parfor i = 1:115
    
    disp(i)

    % parameter_set for each participants
    aTwoR1 = con3.a_101_(i);
    terTwoR1 = con3.Ter_101_(i);
    etaTwoR1 = con3.eta_101_(i);
    zTwoR1 = con3.z_101_(i);
    szTwoR1 = con3.sz_101_(i);
    stTwoR1 = con3.st_101_(i);
    vTwoR1 = con3.v_101_(i);
    
    aTwoR2 = con3.a_102_(i);
    terTwoR2 = con3.Ter_102_(i);
    etaTwoR2 = con3.eta_102_(i);
    zTwoR2 = con3.z_102_(i);
    szTwoR2 = con3.sz_102_(i);
    stTwoR2 = con3.st_102_(i);
    vTwoR2 = con3.v_102_(i);

    parameter_set = [aTwoR1 terTwoR1 etaTwoR1 zTwoR1 szTwoR1 stTwoR1 vTwoR1
                 aTwoR2 terTwoR2 etaTwoR2 zTwoR2 szTwoR2 stTwoR2 vTwoR2];
    disp(parameter_set)
    data = multisimul(parameter_set, N, seed);

    % fit the model
    output = multiestv4(data, opts2(3));
    %qtable - shows model fitting scores
    qtable(output);
    result1 = output.FitInfo;
    
    % write to file
    filename = strrep(files(i).name, '.csv', '');
    fileName = sprintf('output_%d.csv',i);
    filePath = fullfile(folderPathConR ,fileName)

    % fprintf(file1, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', ...
    % filename, output.Minimum(1,:),output.Minimum(2,:),result1.AICc,result1.BIC,result1.ChiSquare,output.Df);

    fileID = fopen(filePath, 'w');
    fprintf(fileID, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', ...
        filename, output.Minimum(1,:), output.Minimum(2,:), result1.AICc, result1.BIC, result1.ChiSquare, output.Df);
    fclose(fileID);

    disp(output.Minimum)
end
  
delete(gcp("nocreate"))

%% Prepare file for correlation test


% Output file where combined data will be stored
fileNameConR3 = 'model3(TwoConditionRecovery).csv';
outputFilePath = fullfile(folderPathConR, fileNameConR3);
outputFile = fopen(outputFilePath, 'w');

% List all the files in the folder
filesR = dir(fullfile(folderPathConR, '*.csv'));

fprintf(outputFile, ['participantsID,a(101),Ter(101),eta(101),z(101),sz(101),' ...
     'st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102),AICc(1),BIC(1),Chi(1),df\n']);

% Loop through each file and append its contents to the output file
for i = 2:length(filesR)
    filePath = fullfile(folderPathConR, filesR(i).name);
    fileContent = fileread(filePath);
    fprintf(outputFile, '%s', fileContent);
end

% Close the output file
fclose(outputFile);


%% Append new list for testing

recoverP = readtable(outputFilePath);

index = ismember(con3.participantsID, recoverP.participantsID);

indexList = find(index);

aTwoR1C = [];
terTwoR1C = [];
etaTwoR1C = [];
zTwoR1C = [];
szTwoR1C = [];
stTwoR1C = [];
vTwoR1C = [];
    
aTwoR2C = [];
terTwoR2C = [];
etaTwoR2C = [];
zTwoR2C = [];
szTwoR2C = [];
stTwoR2C = [];
vTwoR2C = [];


for i = 1:60
    aTwoR1C = [aTwoR1C, con3.a_101_(indexList(i))];
    terTwoR1C = [terTwoR1C,con3.Ter_101_(indexList(i))];
    etaTwoR1C = [etaTwoR1C,con3.eta_101_(indexList(i))];
    zTwoR1C = [zTwoR1C,con3.z_101_(indexList(i))];
    szTwoR1C = [szTwoR1C,con3.sz_101_(indexList(i))];
    stTwoR1C = [stTwoR1C,con3.st_101_(indexList(i))];
    vTwoR1C = [vTwoR1C,con3.v_101_(indexList(i))];
    
    aTwoR2C = [aTwoR2C,con3.a_102_(indexList(i))];
    terTwoR2C = [terTwoR2C,con3.Ter_102_(indexList(i))];
    etaTwoR2C = [etaTwoR2C,con3.eta_102_(indexList(i))];
    zTwoR2C = [zTwoR2C,con3.z_102_(indexList(i))];
    szTwoR2C = [szTwoR2C,con3.sz_102_(indexList(i))];
    stTwoR2C = [stTwoR2C,con3.st_102_(indexList(i))];
    vTwoR2C = [vTwoR2C,con3.v_102_(indexList(i))];
end




%% Correlation test a 101

% Perform correlation test
corr_matrix = corrcoef(aTwoR1C, recoverP.a_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['a 101 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test Ter 101

% Perform correlation test
corr_matrix = corrcoef(terTwoR1C, recoverP.Ter_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['Ter 101 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test eta 101

% Perform correlation test
corr_matrix = corrcoef(etaTwoR1C, recoverP.eta_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['eta 101 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test z 101

% Perform correlation test
corr_matrix = corrcoef(zTwoR1C, recoverP.z_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['z 101 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test sz 101

% Perform correlation test
corr_matrix = corrcoef(szTwoR1C, recoverP.sz_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['sz 101 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test st 101

% Perform correlation test
corr_matrix = corrcoef(stTwoR1C, recoverP.st_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['st 101 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test v 101

% Perform correlation test
corr_matrix = corrcoef(vTwoR1C, recoverP.v_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['v 101 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test a 102

% Perform correlation test
corr_matrix = corrcoef(aTwoR2C, recoverP.a_102_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['a 102 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test Ter 102

% Perform correlation test
corr_matrix = corrcoef(terTwoR2C, recoverP.Ter_102_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['Ter 102 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test eta 102

% Perform correlation test
corr_matrix = corrcoef(etaTwoR2C, recoverP.eta_102_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['eta 102 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test z 102

% Perform correlation test
corr_matrix = corrcoef(zTwoR2C, recoverP.z_102_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['z 102 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test sz 102

% Perform correlation test
corr_matrix = corrcoef(szTwoR2C, recoverP.sz_102_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['sz 102 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test st 102

% Perform correlation test
corr_matrix = corrcoef(stTwoR2C, recoverP.st_102_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['st 102 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test v 102

% Perform correlation test
corr_matrix = corrcoef(vTwoR2C, recoverP.v_102_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['v 102 Correlation Coefficient: ', num2str(correlation_coefficient)]);