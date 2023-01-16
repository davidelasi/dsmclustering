function [total_coord_cost] = Coord_Cost(DSM_matrix, Cluster_matrix, cluster_size, pow_cc);
%[total_coord_cost] = Coord_Cost(DSM_matrix, Cluster_matrix, cluster_size, pow_cc);
%
%
%	Function to calculate the coordination cost of the cluster matrix
%
%		Inputs:
%					DSM_matrix			The DSM matrix
%					Cluster_matrix		The cluster matrix (Cluster,Element)
%					cluster_size(n)	array specifying the number of elements in cluster n
%					pow_cc				value for the exponential weighting of the cost function
%
%
%		Outputs:
%					total_coord_cost	total coordination cost
%
% This routine checks all DSM Interactions.  If a DSM interaction is contained in
% in one or more clusters, we add the cost of all intra-cluster interactions.
% If the interaction is not contained within any clusters, then a higher cost is
% assigned to the out-of-cluster interaction.
%
% Looking at all DSM interactions i and j,
%	Are DSM(i) and DSM(j) both contained in any clusters
%		if yes: coordination cost is the sum of (DSM(i) + DSM(j))*cluster_size(cluster n)^pow_cc
%					across all clusters
%		if no: coordination cost is (DSM(i) + DSM(j))*DSM_size^pow_cc
%  Total coordination cost is equal to the sum of all coordination costs


% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  File:	Coord_Cost.m																		*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
%	Function to cluster the elements of a matrix		 								*
%	Algorithm based on work developed by Carlos Fernandez							*
%																									*
%	This function calculates the "coordination cost" of the clustering 		*
%	solution.  Higher values are assigned to interactions outside of 			*
%	than those occuring inside of clusters.											*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************


% get the number of clusters and the size of the DSM
[n_clusters, DSM_size] = size(Cluster_matrix);

% intialize coordination costs
total_coord_cost = 0;
coordination_cost= zeros(1,DSM_size);

DSM_labels = cell(DSM_size,1);		% dummy variable for reorder function



% reorder the DSM acording to the cluster matrix
% NOTE: this re-ordering will duplicate entries for elements that show up
% in more than one cluster.  If an element is in three clusters, the new
% DSM matrix will have three seperate entries for the element.
% Therefore this new DSM matrix may be much larger than the original DSM
% This essentially assigns a higher cost if the element is a memeber of
% more than one cluster
[New_DSM_matrix, New_DSM_labels] = reorder_DSM_byCluster(DSM_matrix, Cluster_matrix, DSM_labels);
New_DSM_size = size(New_DSM_matrix,1);



% get the number of elements in each cluster
Num_cluster_elements = sum(Cluster_matrix,2);

n=1;

New_Cluster_matrix = zeros(New_DSM_size, New_DSM_size);

% Create a new cluster matrix that matches the new reordered DSM matrix
% Because the DSM was reordered, columns of the cluster matrix must be re-ordered
% to match the order of the new DSM Matrix.  This is done for cost calculation 
% purposes only.
for i =1:n_clusters
   New_Cluster_matrix(i,n:n+Num_cluster_elements(i)-1) = ones(1,Num_cluster_elements(i));
   n= n+Num_cluster_elements(i);
end

% get new cluster size array that matches the new cluster matrix
New_Cluster_size = sum(New_Cluster_matrix,2);


% replace the old data with the new data for the cost calculation
DSM_size = New_DSM_size;
DSM_matrix = New_DSM_matrix;
Cluster_matrix = New_Cluster_matrix;
cluster_size = New_Cluster_size;

[n_clusters, DSM_size] = size(Cluster_matrix);
total_coord_cost = 0;
coordination_cost= zeros(1,DSM_size);

% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%							CALCULATE THE COST OF THE SOLUTION							*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************


for i=1:DSM_size
   for j=i+1:DSM_size		% j=i+1 to skip the diagonals
      if (DSM_matrix(i,j)>0 | DSM_matrix(j,i)>0)% if a dependancy exists between i & j
         cost_total = 0;
         
         % check if any clusters contain the both elements
         for (cluster_index=1:n_clusters)						
            if (Cluster_matrix(cluster_index,i)+Cluster_matrix(cluster_index,j)==2)	% ie both i & j belong to the same cluster
               cost_total = cost_total + (DSM_matrix(i,j) + DSM_matrix(j,i)) * cluster_size(cluster_index)^pow_cc;  
            end
         end
                  
         if (cost_total>0)				 
            cost_c = cost_total;
         else
            cost_c = (DSM_matrix(i,j) + DSM_matrix(j,i))*DSM_size^pow_cc;
         end
         coordination_cost(i) = coordination_cost(i) + cost_c;
      end
   end
end

total_coord_cost = sum(coordination_cost);
% **************************************************************************
% ******************** END COST CALCULATION ********************************
% **************************************************************************
