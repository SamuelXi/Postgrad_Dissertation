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
con3Recover = readtable(filePathRecoveryM3);

%% Correlation test a 101

% Perform correlation test
corr_matrix = corrcoef(con3.a_101_, con3Recover.a_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['A 101 Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test Ter 101

% Perform correlation test
corr_matrix = corrcoef(con3.Ter_101_, con3Recover.Ter_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test eta 101

% Perform correlation test
corr_matrix = corrcoef(con3.eta_101_, con3Recover.eta_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test z 101

% Perform correlation test
corr_matrix = corrcoef(con3.z_101_, con3Recover.z_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test sz 101

% Perform correlation test
corr_matrix = corrcoef(con3.sz_101_, con3Recover.sz_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['Correlation Coefficient: ', num2str(correlation_coefficient)]);

%% Correlation test st 101

% Perform correlation test
corr_matrix = corrcoef(con3.st_101_, con3Recover.st_101_);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['Correlation Coefficient: ', num2str(correlation_coefficient)]);
