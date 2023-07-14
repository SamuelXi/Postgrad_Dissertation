%% Parameter Recovery for two condition

% two condition parameters mean
aTwoR1 = mean(con5.a_101_);
terTwoR1 = mean(con5.Ter_101_);
etaTwoR1 = mean(con5.eta_101_);
zTwoR1 = mean(con5.z_101_);
szTwoR1 = mean(con5.sz_101_);
stTwoR1 = mean(con5.st_101_);
vTwoR1 = mean(con5.v_101_);

aTwoR2 = mean(con5.a_102_);
terTwoR2 = mean(con5.Ter_102_);
etaTwoR2 = mean(con5.eta_102_);
zTwoR2 = mean(con5.z_102_);
szTwoR2 = mean(con5.sz_102_);
stTwoR2 = mean(con5.st_102_);
vTwoR2 = mean(con5.v_102_);

% Parameter set  =     [a Ter eta z  sz  st  v]
parameter_set = [aTwoR1 terTwoR1 etaTwoR1 zTwoR1 szTwoR1 stTwoR1 vTwoR1
                 aTwoR2 terTwoR2 etaTwoR2 zTwoR2 szTwoR2 stTwoR2 vTwoR2]
N = [98,50];
% N = [147,75]; %for 148 trials
% N = [196,100]; %for 148 trials
%N = [980,500]; %for 148 * 10 trials
%N = [11270,5750]; %for 148 trials
seed = 1;
data = multisimul(parameter_set, N);

%% Run all 5 models (Condition) 
% Something worng with model 4 when running all models all together, need
% to run the model one by one for the condition model, changing parameter
% in output and save file to the corresponding file.

folderPathConR = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/Recovery/';
fileNameConR5 = 'model5(TwoConditionRecovery).csv';
filePathRecoveryM5 = fullfile(folderPathConR, fileNameConR5);
file1 = fopen(filePathRecoveryM5, 'w');


% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file1, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102),AICc(1),BIC(1),Chi(1),df\n');

for i = 1:115

    disp(i)
    data = multisimul(parameter_set, N);
    % fit the model
    output = multiestv4(data, opts2(5));
    %qtable - shows model fitting scores
    qtable(output);
    result1 = output.FitInfo;
    % write to file
    filename = strrep(files(i).name, '.csv', '');
    fprintf(file1, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', ...
    filename, output.Minimum(1,:),output.Minimum(2,:),result1.AICc,result1.BIC,result1.ChiSquare,output.Df);
    disp(output.Minimum)
end
    

%% Calculate mean and compare
recoveryM5 = readtable(filePathRecoveryM5);


RaTwoR1 = mean(recoveryM5.a_101_);
RterTwoR1 = mean(recoveryM5.Ter_101_);
RetaTwoR1 = mean(recoveryM5.eta_101_);
RzTwoR1 = mean(recoveryM5.z_101_);
RszTwoR1 = mean(recoveryM5.sz_101_);
RstTwoR1 = mean(recoveryM5.st_101_);
RvTwoR1 = mean(recoveryM5.v_101_);

RaTwoR2 = mean(recoveryM5.a_102_);
RterTwoR2 = mean(recoveryM5.Ter_102_);
RetaTwoR2 = mean(recoveryM5.eta_102_);
RzTwoR2 = mean(recoveryM5.z_102_);
RszTwoR2 = mean(recoveryM5.sz_102_);
RstTwoR2 = mean(recoveryM5.st_102_);
RvTwoR2 = mean(recoveryM5.v_102_);

parameter_set
parameter_RecoveryM5 = [RaTwoR1 RterTwoR1 RetaTwoR1 RzTwoR1 RszTwoR1 RstTwoR1 RvTwoR1
                 RaTwoR2 RterTwoR2 RetaTwoR2 RzTwoR2 RszTwoR2 RstTwoR2 RvTwoR2]

%% Correlation test 

parameter_set_101 = [aTwoR1 terTwoR1 etaTwoR1 zTwoR1 szTwoR1 stTwoR1 vTwoR1];
parameter_RecoveryM5_101 = [RaTwoR1 RterTwoR1 RetaTwoR1 RzTwoR1 RszTwoR1 RstTwoR1 RvTwoR1];

parameter_set_102 = [aTwoR2 terTwoR2 etaTwoR2 zTwoR2 szTwoR2 stTwoR2 vTwoR2];
parameter_RecoveryM5_102 = [RaTwoR2 RterTwoR2 RetaTwoR2 RzTwoR2 RszTwoR2 RstTwoR2 RvTwoR2];

% Perform correlation test
corr_matrix = corrcoef(parameter_set_all, parameter_RecoveryM5_all);

% Extract correlation coefficient
correlation_coefficient = corr_matrix(1, 2);

% Display correlation coefficient
disp(['Correlation Coefficient: ', num2str(correlation_coefficient)]);