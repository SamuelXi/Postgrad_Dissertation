%% initialise file name


% No condition 
folderPathNoCon = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameNoConR1 = 'model1(noCondition).csv';
fileNameNoConR2 = 'model2(noCondition).csv';
fileNameNoConR3 = 'model3(noCondition).csv';
fileNameNoConR4 = 'model4(noCondition).csv';
fileNameNoConR5 = 'model5(noCondition).csv';

filePathNoConR1 = fullfile(folderPathNoCon,fileNameNoConR1);
filePathNoConR2 = fullfile(folderPathNoCon,fileNameNoConR2);
filePathNoConR3 = fullfile(folderPathNoCon,fileNameNoConR3);
filePathNoConR4 = fullfile(folderPathNoCon,fileNameNoConR4);
filePathNoConR5 = fullfile(folderPathNoCon,fileNameNoConR5);

% Condition
folderPathCon = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/Condition/';
fileNameConR1 = 'model1(Condition).csv';
fileNameConR2 = 'model2(Condition).csv';
fileNameConR3 = 'model3(Condition).csv';
fileNameConR4 = 'model4(Condition).csv';
fileNameConR5 = 'model5(Condition).csv';

filePathConR1 = fullfile(folderPathCon,fileNameConR1);
filePathConR2 = fullfile(folderPathCon,fileNameConR2);
filePathConR3 = fullfile(folderPathCon,fileNameConR3);
filePathConR4 = fullfile(folderPathCon,fileNameConR4);
filePathConR5 = fullfile(folderPathCon,fileNameConR5);

% Condition seperate test
folderPathCon = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/Condition/';
fileNameConR1_101 = 'model1(Condition101).csv';
fileNameConR2_101 = 'model2(Condition101).csv';
fileNameConR3_101 = 'model3(Condition101).csv';
fileNameConR4_101 = 'model4(Condition101).csv';
fileNameConR5_101 = 'model5(Condition101).csv';
fileNameConR1_102 = 'model1(Condition102).csv';
fileNameConR2_102 = 'model2(Condition102).csv';
fileNameConR3_102 = 'model3(Condition102).csv';
fileNameConR4_102 = 'model4(Condition102).csv';
fileNameConR5_102 = 'model5(Condition102).csv';
filePathConR1_101 = fullfile(folderPathCon,fileNameConR1_101);
filePathConR2_101 = fullfile(folderPathCon,fileNameConR2_101);
filePathConR3_101 = fullfile(folderPathCon,fileNameConR3_101);
filePathConR4_101 = fullfile(folderPathCon,fileNameConR4_101);
filePathConR5_101 = fullfile(folderPathCon,fileNameConR5_101);
filePathConR1_102 = fullfile(folderPathCon,fileNameConR1_102);
filePathConR2_102 = fullfile(folderPathCon,fileNameConR2_102);
filePathConR3_102 = fullfile(folderPathCon,fileNameConR3_102);
filePathConR4_102 = fullfile(folderPathCon,fileNameConR4_102);
filePathConR5_102 = fullfile(folderPathCon,fileNameConR5_102);

%% Initialised the DMAT toolbox
 opts = multiestv4;
 opts = repmat(opts,5,1);  

 % '1' is free parameter, and [] is the fixed

 % Parameter set  =     [ a  Ter eta z sz st  v]
 opts(1).DesignMatrix = {'1','1',[],[],[],[],'1'}; %binary for using the parameter
 %set individual input testing data matrix
 opts(1).FitBNotZ = 1;
 opts(1).Name = 'Model 1: No effect z=a/2 + fixed eta, st, sz, z';

 % Parameter set  =     [ a  Ter eta z sz st  v]
 opts(2).DesignMatrix = {'1','1','1',[],[],[],'1'}; %binary for using the parameter
 %set individual input testing data matrix
 opts(2).FitBNotZ = 1;
 opts(2).Name = 'Model 2: No effect z=a/2 + fixed st, sz, z';

 % Parameter set  =     [ a  Ter eta  z  sz st  v]
 opts(3).DesignMatrix = {'1','1','1',[],'1',[],'1'}; %binary for using the parameter
 %set individual input testing data matrix
 opts(3).FitBNotZ = 1;
 opts(3).Name = 'Model 3: No effect z=a/2 + fixed st z';

 % Parameter set  =     [ a  Ter eta z  sz  st  v]
 opts(4).DesignMatrix = {'1','1','1',[],'1','1','1'}; %binary for using the parameter
 %set individual input testing data matrix
 opts(4).FitBNotZ = 1;
 opts(4).Name = 'Model 4: No effect z=a/2 + fixed z';

 % Parameter set  =     [ a  Ter eta  z  sz   st  v]
 opts(5).DesignMatrix = {'1','1','1','1','1','1','1'}; %binary for using the parameter
 %set individual input testing data matrix
 opts(5).FitBNotZ = 1;
 opts(5).Name = 'Model 5: No effect, all parameters are free';
%% Run all 5 models (No Condition)

% Open the file for writing
file1 = fopen(filePathNoConR1, 'w');
file2 = fopen(filePathNoConR2, 'w');
file3 = fopen(filePathNoConR3, 'w');
file4 = fopen(filePathNoConR4, 'w');
file5 = fopen(filePathNoConR5, 'w');


% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file1, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file2, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file3, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file4, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file5, 'participantsID,a,Ter,eta,z,sz,st,v\n');

 for i = 1:numel(files)
     % create the data matrix [conditions, response, rt in seconds]
     %reduce the dimension from 1*148*3 to 148*3
     data_rtTemp = allParticipants(i,:,:);
     data_rtTemp = squeeze(data_rtTemp);

     % Model 1 single condition (all 1s for each trial)
     data_rtTemp(:,1) = ones(size(data_rtTemp,1),1);

     %'3' check for rt, '2' as the row dimension 
     nanRows = any(isnan(data_rtTemp(:, 3)), 2);
     % Delete rows with NaN values
     data_rtTemp(nanRows, :) = [];

     % Debugger: check for looping issue
     disp(i)
  
    
    % fit the model
     output = multiestv4(data_rtTemp, opts);
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file1, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(1).Minimum);
     fprintf(file2, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(2).Minimum);
     fprintf(file3, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(3).Minimum);
     fprintf(file4, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(4).Minimum);
     fprintf(file5, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(5).Minimum);
     %qtable - shows model fitting scores
     qtable(output);
 end

%% Run all 5 models (Condition) 
% Something worng with model 4 when running all models all together, need
% to run the model one by one for the condition model, changing parameter
% in output and save file to the corresponding file.

file1 = fopen(filePathConR1, 'w');
file2 = fopen(filePathConR2_102, 'w');
file3 = fopen(filePathConR3_102, 'w');
file4 = fopen(filePathConR4, 'w');
file5 = fopen(filePathConR5, 'w');


% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file1, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');
fprintf(file2, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');
fprintf(file3, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');
fprintf(file4, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');
fprintf(file5, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');

 for i = 1:numel(files)
     % create the data matrix [conditions, response, rt in seconds]
     %reduce the dimension from 1*148*3 to 148*3
     data_rtTemp = allParticipants(i,:,:);
     data_rtTemp = squeeze(data_rtTemp);

     %'3' check for rt, '2' as the row dimension 
     nanRows = any(isnan(data_rtTemp(:, 3)), 2);
     % Delete rows with NaN values
     data_rtTemp(nanRows, :) = [];

     % Debugger: check for looping issue
     disp(i)
  
    
    % fit the model
     output = multiestv4(data_rtTemp, opts(5));
     filename = strrep(files(i).name, '.csv', '');
     % fprintf(file1, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum(1,:),output.Minimum(2,:));
     % fprintf(file2, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum(1,:),output.Minimum(2,:));
     % fprintf(file3, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum(1,:),output.Minimum(2,:));
     % fprintf(file4, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum(1,:),output.Minimum(2,:));
     fprintf(file5, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum(1,:),output.Minimum(2,:));
     %qtable - shows model fitting scores
     qtable(output);
 end

 %% Testing seperating trial types
 
file1 = fopen(filePathConR1_101, 'w');
file2 = fopen(filePathConR2_101, 'w');
file3 = fopen(filePathConR3_101, 'w');
file4 = fopen(filePathConR4_101, 'w');
file5 = fopen(filePathConR5_101, 'w');
file6 = fopen(filePathConR1_102, 'w');
file7 = fopen(filePathConR2_102, 'w');
file8 = fopen(filePathConR3_102, 'w');
file9 = fopen(filePathConR4_102, 'w');
file10 = fopen(filePathConR5_102, 'w');


% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file1, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file2, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file3, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file4, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file5, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file6, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file7, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file8, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file9, 'participantsID,a,Ter,eta,z,sz,st,v\n');
fprintf(file10, 'participantsID,a,Ter,eta,z,sz,st,v\n');


 for i = 1:numel(files)
     % create the data matrix [conditions, response, rt in seconds]
     %reduce the dimension from 1*148*3 to 148*3
     data_rtTemp = allParticipants101(i,:,:);
     data_rtTemp = squeeze(data_rtTemp);

     % Model 1 single condition (all 1s for each trial)
     data_rtTemp(:,1) = ones(size(data_rtTemp,1),1);

     %'3' check for rt, '2' as the row dimension 
     nanRows = any(isnan(data_rtTemp(:, 3)), 2);
     % Delete rows with NaN values
     data_rtTemp(nanRows, :) = [];

     % Debugger: check for looping issue
     disp('101')
     disp(i)
  
    % fit the model
     output = multiestv4(data_rtTemp, opts);
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file1, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(1).Minimum);
     fprintf(file2, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(2).Minimum);
     fprintf(file3, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(3).Minimum);
     fprintf(file4, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(4).Minimum);
     fprintf(file5, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(5).Minimum);
     %qtable - shows model fitting scores
     qtable(output);
 end

 for i = 1:numel(files)
     % create the data matrix [conditions, response, rt in seconds]
     %reduce the dimension from 1*148*3 to 148*3
     data_rtTemp = allParticipants102(i,:,:);
     data_rtTemp = squeeze(data_rtTemp);
 
     % Model 1 single condition (all 1s for each trial)
     data_rtTemp(:,1) = ones(size(data_rtTemp,1),1);
 
     %'3' check for rt, '2' as the row dimension 
     nanRows = any(isnan(data_rtTemp(:, 3)), 2);
     % Delete rows with NaN values
     data_rtTemp(nanRows, :) = [];
 
     % Debugger: check for looping issue
     disp('102')
     disp(i)
 
    % fit the model
     output = multiestv4(data_rtTemp, opts);
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file6, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(1).Minimum);
     fprintf(file7, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(2).Minimum);
     fprintf(file8, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(3).Minimum);
     fprintf(file9, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(4).Minimum);
     fprintf(file10, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output(5).Minimum);
     %qtable - shows model fitting scores
     qtable(output);
 end









