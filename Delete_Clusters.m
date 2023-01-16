function [new_cluster_matrix, new_cluster_size]= Delete_Clusters(cluster_size, cluster_matrix);
%[new_cluster_matrix, new_cluster_size]= Delete_Clusters(cluster_size, cluster_matrix);
%
%
% Function to delete duplicate clusters or cluster that are within clusters
%
%
%
%	Inputs:
%				cluster_size			Array of containing size of each cluster
%				cluster_matrix		The cluster matrix
%
%	Outputs:
%				new_cluster_matrix	Cluster Matrix after duplicates have been removed
%				new_cluster_size		New array of cluster sizes
%
%
%


% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	Delete_Clusters.m																					*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to calculate the bids from clusters for the selected element.	*
%	Each cluster makes a bid for the selected element based on the 			*
%	bidding parameters.																		*
%																									*
%	This algorithm is based on work by Carlos Fernandez.							*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************



[n_clusters, n_elements] = size(cluster_matrix);
new_cluster_matrix = zeros(size(cluster_matrix));
new_cluster_size = zeros(size(cluster_size));

% if the clusters are equal or cluster j is completely contained in cluster i
% delete cluster j
for i=1:n_clusters
   for j=i+1:n_clusters
      if (cluster_size(i) >= cluster_size(j) & cluster_size(j)>0)
         if all(((cluster_matrix(i,:) & cluster_matrix(j,:)) == cluster_matrix(j,:)))
            cluster_matrix(j,:)=0;
            cluster_size(j) = 0;
         end
      end
   end
end

% if cluster i is completely contained in cluster j, delete cluster i
for i=1:n_clusters
   for j= i+1:n_clusters
      if (cluster_size(i) < cluster_size(j) & cluster_size(i)>0)
         if all(((cluster_matrix(i,:) & cluster_matrix(j,:)) == cluster_matrix(i,:)))	% cluster i is contained in j
            cluster_matrix(i,:)=0;
            cluster_size(i)=0;
         end
      end
   end
end


% delete clusters with no tasks

non_empty_cluster_indx = find(cluster_size);

new_cluster_matrix(1:length(non_empty_cluster_indx),:) = cluster_matrix(non_empty_cluster_indx,:);
new_cluster_size(1:length(non_empty_cluster_indx)) = cluster_size(non_empty_cluster_indx);

