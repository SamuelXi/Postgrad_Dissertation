%% Compile filePath
% No need to get the folder and file path when running the modelFitting2nd as all
% paths have been saved to the workspace
noCon1 = readtable(filePathNoConR1);
noCon2 = readtable(filePathNoConR2);
noCon3 = readtable(filePathNoConR3);
noCon4 = readtable(filePathNoConR4);
noCon5 = readtable(filePathNoConR5);
con1 = readtable(filePathConR1);
con2 = readtable(filePathConR2);
con3 = readtable(filePathConR3);
con4 = readtable(filePathConR4);
con5 = readtable(filePathConR5);


%% Testing for significance between different model

%Read table
fileDataT1 = readtable(filePathNoConR1);
fileDataT2 = readtable(filePathNoConR5);

T1 = fileDataT1.z;
T2 = fileDataT2.z;
test = [T1,T2]
% [h, p, ci, stats] = ttest2(T1,T2);

%% Comparing between anxious and non annxious group in all parameter values

% Create testing group for based on the on anxious and not anxious
%using all free parameters model data

% No condition group
vNoAnxG1 = [];
vAnxG1 = [];

% Condition group
vNoAnxG2 = [];
vAnxG2 = [];


% Group size
anxSize = size(anxPar);
anxNoSize = size(anxNoPar);

% Extract participant information
for i = 1:115
    if ismember(noCon5(i,:).participantsID, anxNoPar)
        vNoAnxG1 = [vNoAnxG1,noCon5(i,:).v];
    elseif ismember(noCon5(i,:).participantsID, anxPar)
        vAnxG1 = [vAnxG1,noCon5(i,:).v];
    end
    
    if ismember(con5(i,:).participantsID, anxNoPar)
        vNoAnxG2 = [vNoAnxG2,con5(i,:).v_101_];
    elseif ismember(con5(i,:).participantsID, anxPar)
        vAnxG2 = [vAnxG2,con5(i,:).v_101_];
    end
end


[h1, p1, ci1, stats1] = ttest2(vNoAnxG1,vAnxG1);
[h2, p2, ci2, stats2] = ttest2(vNoAnxG2,vAnxG2);

% Display the results
fprintf('___________No Conditioned t-test___________\n');
fprintf('t-statistic: %.4f\n', stats1.tstat);
fprintf('p-value: %.4f\n', p1);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci1(1), ci1(2));
fprintf('\n')
fprintf('____________Conditioned t-test_____________\n');
fprintf('t-statistic: %.4f\n', stats2.tstat);
fprintf('p-value: %.4f\n', p2);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci2(1), ci2(2));


