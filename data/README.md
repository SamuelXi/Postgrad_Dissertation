# Data

`data_anx_gad7_prior.csv` and `data_single_prior.csv` are the demographic and summary statistics data for all the participants we included in our study. 

They are mostly the same file, only the `rho/lambda/mu` columns are different. It depends on whether they have been fitted using the GAD-7 median split of the data (based on the `anx_gad7_median` column) or using a single group prior.

The individual choice data columns should be quite easy to parse:
- `trial_type` is 101 for mixed gamble trials, 102 for gain only trials
- `safe/gain/loss` are the values shown to the participants
- `rt` is the reaction time
- `gamble/win` are binary columns reporting whether the participant took the gamble and whether they won that gamble. If `gamble` is -999.0 the participant timed out on that trial (rt > 4s).
- `money` is the amount of money the participant has at the beginning of that trial
- the last 3 columns are not particularly interesting, they're mostly there for debug purposes


The gain only trail, participants choose between sure small gain or the gamble for a potentially high gain.
The mixed gamble trial explanation: Participants have the option to choose to gamble or not gamble for each trial. Each gamble has a 50% chance of winning/losing
Each participants have 148 trials, 98 mixed gamble trials (code: 101), 50 gain-only trials (code: 102)
Which scale should I infer to when measuring if its anxious or not anxious
What does safe mean in each case

