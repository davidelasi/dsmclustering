function [Best_match, Average_match, Max_match, BclI, totalmean] = get_match_avg(Union_match,Results, plot_flag, printplot_flag);
%[Best_match, Average_match, Max_match, BclI] = get_match_avg(Union_match,Results);%
%
% Function averagve of matches between two runs of cluster calculations
%
%
%
%	Inputs:
%				Union_match				Cell array of likeness calculations between the clusters
%				Results					Structure of Results from running the clustering
%											algorithm multiple times
%				plot_flag				toggle the plotting of figures summarizing the results (1=plot, 0=no plot)
%				printplot_flag			toggle printing of the plots
%
%	Outputs:
%				Best_match				the best match average for a cluster of run x to any cluster
%											in run y
%				Average_match			the average match for a cluster of run x to all other best matched
%											clusters in other runs
%											in run y
%				Max_match				the best match for a cluster of run x to all other best matched
%											clusters in other runs
%											in run y
%				BclI						the index of best matches between clusters
%				totalmean				mean of the likeness averages for all of the clusters of a run


% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	get_match_avg.m																	*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to calculate the bids from clusters for the selected element.	*
%	Each cluster makes a bid for the selected element based on the 			*
%	bidding parameters.  An plot the results.											*
%																									*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************

test_data = Results;						% get the clustering results
[num_runs] = size(Union_match,2);

for test_a = 1:num_runs
   [row_a, col_a] = find(test_data(test_a).Cluster_matrix);
   test_data(test_a).n_clusters = max(row_a);
end

for Run1 = 1:num_runs
   for Run2 = 1:num_runs
      if Run1 ~= Run2
         for Cluster_R1 = 1:test_data(Run1).n_clusters
            if Run1< Run2
               [Best_match(Run1,Run2,Cluster_R1),BclI(Run1,Run2,Cluster_R1)] = max((Union_match(Run1,Run2,Cluster_R1, :)),[],4);
            else
               [Best_match(Run1,Run2,Cluster_R1),BclI(Run1,Run2,Cluster_R1)] = max((Union_match(Run2,Run1,:, Cluster_R1)),[],3);
            end
         end
      end
   end
end

c_run = [];
for Run1 = 1:num_runs
   for j=1:num_runs
      if j ~= Run1
         c_run = [c_run, j];
      end
   end
   
   for Cluster_r1 = 1:test_data(Run1).n_clusters
      Average_match(Run1,Cluster_r1) = mean(Best_match(Run1,c_run,Cluster_r1));
      Max_match(Run1,Cluster_r1) = max(Best_match(Run1,c_run,Cluster_r1));
   end
end


if plot_flag == 1
   
   plots_per_page = 5;
   
   [num_runs, num_clusters] = size(Average_match);
   
   
   plot_num = 0;
   figure;
   for i=1:num_runs
      n_cluster = nnz(Average_match(i,:));
      totalmean(i) = mean(Average_match(i,1:n_cluster));
   end
   
   Total_run_mean = num2str(mean(totalmean));
   Total_run_median = num2str(median(totalmean));
   
   for i=1:num_runs
      plot_num = plot_num+1;
      if plot_num > plots_per_page
         if printplot_flag ==1
            print
         end
         figure;
         plot_num = 1;
      end
      subplot(plots_per_page,1,plot_num);
      n_cluster = nnz(Average_match(i,:));
      bar(Average_match(i,:),'k');
      ylabel(['Run ' num2str(i) ' Avg']);
      Tcost = Results(i).total_coord_cost;
      xlabel(['Clusters  (total Avg: ' num2str(totalmean(i)) ' ); Coord Cost: ' num2str(Tcost)]);
      if (i == 1) | (mod(i,(plots_per_page+1))==0)
         title(['Mean: ' Total_run_mean '      Median: ' Total_run_median]);
      end
      grid;
      orient tall;
      hold on;
      plot(Max_match(i,:),'rx');
   end
   
   
   if printplot_flag ==1
      print
   end
end

