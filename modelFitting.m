%initialised the DMAT toolbox
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
 
%% Model 1 No effect, fixed starting point z=a/2

% Open the file for writing
folderPathR = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameR = 'model1(noCondition).csv';
filePathR = fullfile(folderPathR,fileNameR);
file = fopen(filePathR, 'w');

% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file, 'participantsID,a,Ter,eta,z,sz,st,v\n');

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
     output = multiestv4(data_rtTemp, opts(1));
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum);
     %qtable - shows model fitting scores
     qtable(output);
 end

 %% Model 2 No effect z=a/2, fixed st sz, z

% Open the file for writing
folderPathR = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameR = 'model2(noCondition).csv';
filePathR = fullfile(folderPathR,fileNameR);
file = fopen(filePathR, 'w');

% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file, 'participantsID,a,Ter,eta,z,sz,st,v\n');

 for i = 1:numel(files)
     % create the data matrix [conditions, response, rt in seconds]
     %reduce the dimension from 1*148*3 to 148*3
     data_rtTemp = allParticipants(i,:,:);
     data_rtTemp = squeeze(data_rtTemp);

     % Model 2 single condition (all 1s for each trial)
     data_rtTemp(:,1) = ones(size(data_rtTemp,1),1);

     %'3' check for rt, '2' as the row dimension 
     nanRows = any(isnan(data_rtTemp(:, 3)), 2);
     % Delete rows with NaN values
     data_rtTemp(nanRows, :) = [];

     % Debugger: check for looping issue
     disp(i)
  
    
    % fit the model
     output = multiestv4(data_rtTemp, opts(2));
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum);
    % qtable - shows model fitting scores
     qtable(output)
 end

%% Model 3, fixed st z'

% Open the file for writing
folderPathR = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameR = 'model3(noCondition).csv';
filePathR = fullfile(folderPathR,fileNameR);
file = fopen(filePathR, 'w');

% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file, 'participantsID,a,Ter,eta,z,sz,st,v\n');

 for i = 1:numel(files)
     % create the data matrix [conditions, response, rt in seconds]
     %reduce the dimension from 1*148*3 to 148*3
     data_rtTemp = allParticipants(i,:,:);
     data_rtTemp = squeeze(data_rtTemp);

     % Model 3 single condition (all 1s for each trial)
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
     fprintf(file, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum);
    % qtable - shows model fitting scores
    qtable(output);
 end 

%% Model 4, fixed z

% Open the file for writing
folderPathR = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameR = 'model4(noCondition).csv';
filePathR = fullfile(folderPathR,fileNameR);
file = fopen(filePathR, 'w');

% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file, 'participantsID,a(101),Ter(101),eta(101),z(101),sz(101),st(101),v(101),a(102),Ter(102),eta(102),z(102),sz(102),st(102),v(102)\n');

 for i = 1:numel(files)
     % create the data matrix [conditions, response, rt in seconds]
     %reduce the dimension from 1*148*3 to 148*3
     data_rtTemp = allParticipants(i,:,:);
     data_rtTemp = squeeze(data_rtTemp);

     % Model 3 single condition (all 1s for each trial)
     data_rtTemp(:,1) = ones(size(data_rtTemp,1),1);

     %'3' check for rt, '2' as the row dimension 
     nanRows = any(isnan(data_rtTemp(:, 3)), 2);
     % Delete rows with NaN values
     data_rtTemp(nanRows, :) = [];

     % Debugger: check for looping issue
     disp(i)
  
    
    % fit the model
     output = multiestv4(data_rtTemp, opts(4));
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum);
    % qtable - shows model fitting scores
    % fit_scores = qtable(output);
 end 

%% Model 5 all parameters are free

% Open the file for writing
folderPathR = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameR = 'model5(noCondition).csv';
filePathR = fullfile(folderPathR,fileNameR);
file = fopen(filePathR, 'w');

% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file, 'participantsID,a,Ter,eta,z,sz,st,v\n');

 for i = 1:numel(files)
     % create the data matrix [conditions, response, rt in seconds]
     %reduce the dimension from 1*148*3 to 148*3
     data_rtTemp = allParticipants(i,:,:);
     data_rtTemp = squeeze(data_rtTemp);

     % Model 3 single condition (all 1s for each trial)
     data_rtTemp(:,1) = ones(size(data_rtTemp,1),1);

     %'3' check for rt, '2' as the row dimension 
     nanRows = any(isnan(data_rtTemp(:, 3)), 2);
     % Delete rows with NaN values
     data_rtTemp(nanRows, :) = [];

     % Debugger: check for looping issue
     disp(i)
  
    
    % fit the model
     output = multiestv4(data_rtTemp, opts(5));
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum);
    % qtable - shows model fitting scores
    % fit_scores = qtable(output);
 end 

