% likeness_calc

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	likeness_calc.m																	*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Script file to get the average match between clusters of several runs	*
%	of the clustering algorithm.  Must change the master file below			*
%	to run the proper DSm calculations													*
%																									*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************


print_flag = 0;		% to toggle printing; 1=print, else no print

plot_flag	=	1;			% toggle plotting of the likeness averages for all of the runs
printplot_flag	=	0;		% toggle to print the plots of the likeness averages
num_runs	=	10;

for get_data = 1:num_runs
   get_data
   run_cluster_A  % ******** name of master cluster DSM file to complete the 10 runs ********
   close all;
   % Extract some of the clustering results for analysis
   Results(get_data).Cluster_matrix = Cluster_matrix;
   Results(get_data).total_coord_cost = total_coord_cost;
   Results(get_data).cost_history = cost_history(1:max_run);
   Results(get_data).New_DSM_matrix = New_DSM_matrix;
   Results(get_data).New_DSM_labels = New_DSM_labels;
   Results(get_data).params = Cluster_param;
   Results(get_data).DSM_matrix = DSM_matrix;
end

get_date = now;
current_date = datestr(get_date,0);



% now plot the average matches
[Union_match] = find_cluster_matches(Results);
[Best_match, Average_match, Max_match, BclI,totalmean] = get_match_avg(Union_match,Results, plot_flag, printplot_flag);

