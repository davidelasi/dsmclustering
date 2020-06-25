function [Union_match] = find_cluster_matches(Results);
%[Union_match] = find_cluster_matches(Results);
%
%
% Function to find matching clusters from different runs of the clustering algorithm
%
%
%
%	Inputs:
%				Results				Structure containing the results of multiple
%										runs of the clustering algorithm
%
%	Outputs:
%				Union_match			Cell array of the match between every cluster
%										of a run with every cluster of all other runs
%										{Matrix_A,Matrix_B,Matrix_A_Cluster_x, Matrix_B_Cluster_y} = match measurement

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	find_cluster_matches.m																					*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to find matching clusters from different runs of the				*
%	clustering algorithm																		*
%																									*
%	This algorithm is based on work by Carlos Fernandez.							*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************


% match or likeness is calculated as follows

% [2*sum(#elements in both clusters)]/[Sum(# of elements in Cluster A) + Sum(# of elements in Cluster B)]

num_mat = length(Results);


test_data = Results(1:num_mat);

for test_a = 1:num_mat
   [row_a, col_a] = find(test_data(test_a).Cluster_matrix);
   test_data(test_a).n_clusters = max(row_a);
end


for aa = 1:num_mat
   for bb = aa+1:num_mat
      for cc = 1:test_data(aa).n_clusters
         for dd = 1:test_data(bb).n_clusters
            Cluster_union{aa,bb,cc,dd} = ...
               (test_data(aa).Cluster_matrix(cc,:) .* ...
               test_data(bb).Cluster_matrix(dd,:));
            Union_sum{aa,bb,cc,dd} = sum(Cluster_union{aa,bb,cc,dd});
            Union_total_elmts{aa,bb,cc,dd} = ...
               (sum(test_data(aa).Cluster_matrix(cc,:) + ...
               test_data(bb).Cluster_matrix(dd,:)));
            if Union_total_elmts{aa,bb,cc,dd} > 0
               Union_match(aa,bb,cc,dd) = 2*Union_sum{aa,bb,cc,dd}/Union_total_elmts{aa,bb,cc,dd};
            else
               Union_match(aa,bb,cc,dd) = 0;
            end
         end
      end
   end
end

