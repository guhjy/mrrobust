{smcl}
{* *! version 0.1.0  4jun2016 Tom Palmer}{...}
{viewerjumpto "Syntax" "mrmedianobs##syntax"}{...}
{viewerjumpto "Description" "mrmedianobs##description"}{...}
{viewerjumpto "Options" "mrmedianobs##options"}{...}
{viewerjumpto "Examples" "mrmedianobs##examples"}{...}
{viewerjumpto "Stored results" "mrmedianobs##results"}{...}
{viewerjumpto "References" "mrmedianobs##references"}{...}
{viewerjumpto "Author" "mrmedianobs##author"}{...}
{title:Title}

{p 5}
{bf:mrmedianobs} {hline 2} Weighted median of instrumental variable estimates
{p_end}

{marker syntax}{...}
{title:Syntax}

{p 8 14 2}
{cmd:mrmedianobs} {depvar} [{it:{help varlist:varlist1}}] 
{cmd:(}{var:_endog} {cmd:=} {varlist:_ivs}{cmd:)} {ifin}
 [{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt all:}}report percentile and bias corrected confidence intervals{p_end}
{synopt :{opt obsboot:}}obtain standard error by bootstrapping at observation 
level{p_end}
{synopt :{opt penw:eighted}}penalized weighted estimator{p_end}
{synopt :{opt reps:(#)}}number of bootstrap replications to obtain standard error{p_end}
{synopt :{opt seed:(#)}}seed for random number generator for bootstrapping to 
obtain standard error{p_end}
{synopt :{opt w:eighted}}weighted estimator{p_end}

{marker description}{...}
{title:Description}

{pstd}
{cmd:mrmedian} performs unweighted, weighted, and penalized IV estimator on 
observation level data.

{col 10}{depvar}: {col 26}outcome variable
{col 10}{varlist:1}: {col 26}covariates to adjust for
{col 10}{var:_endog}: {col 26}treatment received or exposure variable (endogenous variable)
{col 10}{varlist:_ivs}: {col 26}instrumental variables

{marker options}{...}
{title:Options}

{phang}
{opt all} report percentile and bias corrected bootstrap confidence interval 
limits (only applies to observation level bootstrapping with {opt obsboot}).

{phang}
{opt obsboot} obtain bootstrap standard error by bootstrapping at the 
observation level.

{phang}
{opt reps(#)} specifies the number of bootstrap replications for obtaining the
 standard error.

{phang}
{opt seed(#)} specifies the initial value of the random-number seed. 
The default is the current random-number seed. Specifying {opt seed(#)} is the
 same as typing {cmd:set seed} {it:#} before issuing the command; 
see {helpb set_seed}.

{phang}
{opt weighted} use weights.

{phang}
{opt penweighted} use penalized weights.


{marker examples}{...}
{title:Example 1}

{pstd}Simulated test dataset.{p_end}

{pstd}Setup{p_end}
{phang2}{cmd:. use https://raw.github.com/remlapmot/mrmedian/master/mrmedianobs_testdata, clear}{p_end}

{pstd}Unweighted median estimator{p_end}
{phang2}{cmd:. mrmedianobs y (x = z1-z20)}{p_end}

{pstd}Weighted median estimator{p_end}
{phang2}{cmd:. mrmedianobs y (x = z1-z20), weighted}{p_end}

{pstd}Penalized weighted median estimator{p_end}
{phang2}{cmd:. mrmedianobs y (x = z1-z20), weighted}{p_end}

{pstd}Unweighted median estimator with percentile CI limits{p_end}
{phang2}{cmd:. mrmedianobs y (x = z1-z20), obsboot all}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:mrmedian} stores the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:e(k)}}number of instruments{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:mrmedianobs}{p_end}
{synopt:{cmd:e(cmdline)}}command as typed{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:e(b)}}coefficient vector{p_end}
{synopt:{cmd:e(V)}}variance-covariance matrix of the estimates{p_end}

{marker references}{...}
{title:References}

{marker bowden}{...}
{phang}
Bowden J, Davey Smith G, Haycock PC, Burgess S. 2016. 
Consistent estimation in Mendelian randomization with some invalid instruments
 using a weighted median estimator. Genetic Epidemiology. 
DOI: 10.1002/gepi.21965
{p_end}

{marker author}
{title:Author}

{phang}Tom Palmer