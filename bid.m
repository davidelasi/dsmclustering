function [cluster_bid]=bid(elmt, DSM_matrix, cluster_matrix, max_cluster_size, pow_dep, pow_bid, cluster_size);
%[cluster_bid]=bid(elmt, DSM_matrix, cluster_matrix, max_cluster_size, pow_dep, pow_bid, cluster_size);
%
%
%
% Function to calculate the bids from an element to each cluster of elements
%
%
%
%	Inputs:
%				elmt					The DSM element number to receive bids from clusters
%				DSM_matrix			The DSM matrix
%				Cluster_matrix		The Cluster Matrix (cluster,element)
%														1 = element in cluster, 0 = not in cluster
%				max_cluster_size	maximum cluster size
%				pow_dep				parameter for weighting interactions between elements
%				pow_bid				parameter for penalizing cluster sizes
%				cluster_size		array of cluster sizes
%
%
%	Outputs:
%				cluster_bid			array of the cluster bids

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	bid.m																					*
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


% get the number of clusters and number of elements
[n_clusters, DSM_size] = size(cluster_matrix);

% intialize the bidding array
cluster_bid = zeros(n_clusters,1);

% For each Cluster, if any element in the cluster has an interaction with 
% the selected element then add the number of interactions with the selected
% element.  Then use the number of interactions to calculate the bid.

for i=1:n_clusters
   in=0;
   out=0;
   for j=1:DSM_size
      % if element J is in Cluster i, need j not equal to element to avoid diagnal
      if((cluster_matrix(i,j)==1)&(j~=elmt))		
         if (DSM_matrix(j,elmt)>0)
            in = in + DSM_matrix(j,elmt);
         end
         if (DSM_matrix(elmt,j) > 0)
            out = out + DSM_matrix(elmt,j);
         end
      end
   end
   % if there were any interactions with members of the clusters, make a bid
   if ( (in>0) | (out>0))
      if (cluster_size(i) == max_cluster_size)
         cluster_bid(i) = 0;
      else
         % calculate the cluster bid
         cluster_bid(i)=((in+out)^pow_dep)/((cluster_size(i)^pow_bid));
      end
   end
end



