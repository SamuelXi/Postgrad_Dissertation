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

% Open the file for writing
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

file1 = fopen(filePathConR1, 'w');
file2 = fopen(filePathConR2, 'w');
file3 = fopen(filePathConR3, 'w');
file4 = fopen(filePathConR4, 'w');
file5 = fopen(filePathConR5, 'w');


% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file1, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');
fprintf(file2, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');
fprintf(file3, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');
fprintf(file4, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');
fprintf(file5, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');

 for i = 1:1
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
     output = multiestv4(data_rtTemp, opts);
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file1, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output(1).Minimum(1,:),output(1).Minimum(2,:));
     fprintf(file2, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output(2).Minimum(1,:),output(2).Minimum(2,:));
     fprintf(file3, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output(3).Minimum(1,:),output(3).Minimum(2,:));
     fprintf(file4, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output(4).Minimum(1,:),output(4).Minimum(2,:));
     fprintf(file5, '%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n', filename, output(5).Minimum(1,:),output(5).Minimum(2,:));
     %qtable - shows model fitting scores
     qtable(output);
 end