%initialised the DMAT toolbox
 opts = multiestv4;
 
 %get all individuals files
 folderPath = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/individual_data_paper';

 % List all .csv file under the individual_data_paper folder
 % should be 115 participants
 files = dir(fullfile(folderPath, '*.csv'));
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

     % '1' is free parameter, and [] is the fixed
     options(1).DesignMatrix = {'1','1',[],[],[],[],'1'}; %binary for using the parameter
     %set individual input testing data matrix
     options(1).FitBNotZ = 1;
     options(1).Name = 'Model 1: No effect z=a/2 + fixed eta st sz';

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
     output = multiestv4(data_rtTemp, options(1));
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum);
    % qtable - shows model fitting scores
    % fit_scores = qtable(output);
 end 

 %% Model 2

% Open the file for writing
folderPathR = '/Users/samuelxisun/Desktop/Postgrad_Dissertation/fitting_results/DMAT/NoCondition/';
fileNameR = 'model1(noCondition).csv';
filePathR = fullfile(folderPathR,fileNameR);
file = fopen(filePathR, 'w');

% Write the header line to the file
% Parameter set  = [a Ter eta z sz st v (pi) (gamma)]
fprintf(file, 'participantsID,a,Ter,eta,z,sz,st,v\n');

 for i = 1:numel(files)

     % '1' is free parameter, and [] is the fixed
     options(1).DesignMatrix = {'1','1',[],[],[],[],'1'}; %binary for using the parameter
     %set individual input testing data matrix
     options(1).FitBNotZ = 1;
     options(1).Name = 'Model 2: No effect z=a/2 + fixed eta st sz';

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
     output = multiestv4(data_rtTemp, options(1));
     filename = strrep(files(i).name, '.csv', '');
     fprintf(file, '%s,%d,%d,%d,%d,%d,%d,%d\n', filename, output.Minimum);
    % qtable - shows model fitting scores
    % fit_scores = qtable(output);
 end 
